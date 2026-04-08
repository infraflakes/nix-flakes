return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope = require "telescope"
    local previewers = require "telescope.previewers"

    telescope.setup {
      defaults = {

        -- Use fd for finding files (faster than find)
        find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--exclude", ".git" },

        -- Use rg for live_grep
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/*",
        },

        -- Faster previewing for large files
        buffer_previewer_maker = function(filepath, bufnr, opts)
          opts = opts or {}
          filepath = vim.fn.expand(filepath)
          vim.loop.fs_stat(filepath, function(_, stat)
            if not stat or stat.size > 100000 then
              return
            end -- Don't preview files > 100KB
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
          end)
        end,
        file_ignore_patterns = {
          "__pycache__/",
          ".npm/",
          ".cargo/",
          ".zoom/",
          ".mozilla/",
          "node_modules/",
          ".android/",
          "^%.config/",
          ".zen/",
          ".cache/",
          ".git/",
          ".local/",
          ".venv/",
          ".gemini/",
          ".steam/",
          ".dotnet/",
          ".mpd/",
          ".pki/",
          ".ssh/",
          "%.mp3$",
          "%.flac$",
          "%.opus$",
          "%.m4a$",
          "%.zip$",
          "%.tar$",
          "%.tar%.gz$",
          "%.tgz$",
          "%.rar$",
          "%.7z$",
          "%.deb$",
          "%.rpm$",
          "%.dmg$",
          "%.pkg$",
          "%.msi$",
          "%.png$",
          "%.jpg$",
          "%.jpeg$",
          "%.gif$",
          "%.bmp$",
          "%.svg$",
          "%.ico$",
          "%.webp$",
          "%.tiff$",
          "%.psd$",
          "%.fig$",
          "%.pdf$",
          "%.docx$",
          "%.doc$",
          "%.xlsx$",
          "%.pptx$",
          "%.odt$",
          "%.ods$",
          "%.iso$",
          "%.mkv",
          "%.png",
          "%.pdf",
          "%.xlxs",
          ".bash_history",
          "Games/",
          "Pictures/",
          "Videos/",
        },
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        sorting_strategy = "ascending",
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          hidden = true,
        },
      },
    }
  end,
}
