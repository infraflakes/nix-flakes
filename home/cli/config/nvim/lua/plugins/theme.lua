return {
  -- {
  --   "arcticicestudio/nord-vim",
  --   priority = 1000, -- Make sure to load this before all the other start plugins.
  --   config = function()
  --     vim.cmd.colorscheme "nord"
  --   end,
  -- },

  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "tokyonight-storm" -- "night", "storm", "moon", etc.
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
      vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
      vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" })
    end,
  },
  -- {
  --   "catppuccin/nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme "catppuccin-mocha"
  --     vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
  --   end,
  -- },
  -- {
  --   "ful1e5/onedark.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme "onedark"
  --     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
  --   end,
  -- },
  -- {
  --   "vague-theme/vague.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme "vague"
  --     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" })
  --   end,
  -- },
  -- {
  --   "shaunsingh/solarized.nvim",
  --   priority = 1000,
  --   lazy = false, -- ensures it loads immediately on startup
  --   config = function()
  --     -- Solarized requires setting the global background option to 'light'
  --     vim.o.background = "light"
  --     vim.g.solarized_disable_background = true
  --
  --     -- Load and apply the colorscheme
  --     vim.cmd.colorscheme "solarized"
  --   end,
  -- },
  --
  -- {
  --   "cpplain/flexoki.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.o.background = "light"
  --     vim.cmd.colorscheme "flexoki"
  --   end,
  -- },
}
