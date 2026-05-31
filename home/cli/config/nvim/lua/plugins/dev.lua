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
    branch = "main",
    lazy = false,
    config = function()
      -- We stop trying to use require("nvim-treesitter") as a manager.
      -- Instead, we use the Neovim command-line interface which is more stable.

      local ensure_installed = {
        "bash",
        "c",
        "lua",
        "nix",
        "go",
        "rust",
        "svelte",
        "typescript",
        "markdown",
      }

      -- Use the Vim command instead of the Lua API
      -- This is much more resilient to the plugin's internal refactors
      vim.defer_fn(function()
        for _, parser in ipairs(ensure_installed) do
          -- Check if the parser is actually loadable by the core engine
          local ok = pcall(vim.treesitter.query.get, parser, "highlights")
          if not ok then
            vim.cmd("TSInstallSync " .. parser)
          end
        end
      end, 100)

      -- The 0.12 "Standard" for Highlighting
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          -- Use the native Neovim engine directly
          pcall(vim.treesitter.start)

          -- Indent is the ONLY thing we still need from the plugin
          -- We wrap it in a pcall so your editor doesn't crash if the plugin is missing
          pcall(function()
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end)
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
        nix = { "nixfmt" },
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
