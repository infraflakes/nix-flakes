vim.opt.updatetime = 100
vim.diagnostic.config {
  virtual_text = {
    prefix = "", -- Could be '', '●', '◆'
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
}
-- Floating error message
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})
return {

  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    config = function()
      -- Use the new manual install API
      local ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "toml",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "svelte",
        "typescript",
        "go",
        "yaml",
        "make",
        "json",
        "jsonc",
        "css",
        "nix",
      }

      local ts = require "nvim-treesitter"
      local installed = require("nvim-treesitter.config").get_installed()
      local to_install = vim
        .iter(ensure_installed)
        :filter(function(p)
          return not vim.tbl_contains(installed, p)
        end)
        :totable()

      if #to_install > 0 then
        ts.install(to_install)
      end

      -- ENABLE HIGHLIGHTING & INDENT MANUALLY
      -- This replaces the highlight = { enable = true } block
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          -- Start built-in treesitter highlighting
          pcall(vim.treesitter.start)

          -- Use the plugin's indent engine
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      local servers = { "rust_analyzer", "nil_ls", "ts_ls", "zls", "svelte" }
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Lazy load on insert
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer", -- buffer words
      "hrsh7th/cmp-path", -- file paths
    },
    config = function()
      local cmp = require "cmp"
      cmp.setup {
        -- Use Neovim's native snippet expansion
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<CR>"] = cmp.mapping.confirm { select = true },
          ["<C-Space>"] = cmp.mapping.complete(),
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 1000 },
          { name = "path" },
          -- Only load buffer if LSP isn't providing enough info
          { name = "buffer", keyword_length = 3 },
        },
      }
    end,
  },

  { -- Autoformat
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = "fallback",
          }
        end
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        nix = { "alejandra" },
        rs = { "cargo fmt" },
        go = { "gofmt" },
        cpp = { "clang-format" },
        c = { "clang-format" },
      },
    },
  },

  "NMAC427/guess-indent.nvim",

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup {
        filetypes = { "*" }, -- or limit to { "css", "html", "js", etc. }
        user_default_options = {
          mode = "virtualtext",
          virtualtext = "󱓻",
          names = false,
          css = true,
          tailwind = true,
          rgb_fn = true,
          hsl_fn = true,
        },
      }
    end,
  },
}
