return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
  },
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute {
          toggle = true,
          reveal = true,
          position = "float",
        }
      end,
      desc = "Neo-tree Reveal Float",
    },
  },
  config = function()
    require("neo-tree").setup {
      popup_border_style = "rounded",
      window = {
        position = "float",
        width = 35,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
      filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = {
          enabled = true, -- This finds the file in the tree
          leave_dirs_open = true, -- Keeps the path expanded
        },
        hijack_netrw_behavior = "open_default",
        window = {
          mappings = {
            ["<cr>"] = "open_with_window_picker",
          },
        },
      },
      buffers = {
        window = {
          mappings = {
            ["<cr>"] = "open_with_window_picker",
          },
        },
      },
    }
  end,
}
