return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "vague-theme/vague.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      vim.cmd "colorscheme vague"
    end,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require "configs.lspconfig"
  --   end,
  -- },

  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "master",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "nix",
        "go",
        "yaml",
        "diff",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "query",
        "vim",
        "vimdoc",
        "svelte",
        "typescript",
      },
    },
  },

  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown.nvim",
    ft = "markdown",
    config = function()
      require("render-markdown").setup {
        headings = { "Headline1", "Headline2", "Headline3" },
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
}
