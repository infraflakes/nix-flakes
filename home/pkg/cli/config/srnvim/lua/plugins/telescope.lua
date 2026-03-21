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
      },
      pickers = {
        find_files = {
          hidden = true,
          theme = "ivy",
        },
      },
    }

    -- standalone picker (NOT an extension)
    function _G.ToggleTmuxSessions(opts)
      opts = opts or {}
      local Job = require "plenary.job"
      local job = Job:new {
        command = "tmux",
        args = { "ls" },
      }
      local results, stderr = job:sync()

      -- We will now check for success by looking for non-empty stdout,
      -- because job.exit_code is unreliable in this environment.
      if not results or #results == 0 or (#results == 1 and results[1] == "") then
        -- If no sessions, create a new one
        local Terminal = require("toggleterm.terminal").Terminal
        local term = Terminal:new {
          cmd = "tmux",
          direction = "float",
          float_opts = {
            border = "rounded",
            width = math.floor(vim.o.columns * 0.85),
            height = math.floor(vim.o.lines * 0.80),
          },
          autoclose = true,
        }
        term:open()
        vim.schedule(function()
          vim.cmd "startinsert"
        end)
        return
      end

      local actions = require "telescope.actions"
      local action_state = require "telescope.actions.state"
      local pickers = require "telescope.pickers"

      pickers
        .new(opts, {
          prompt_title = "  Tmux Sessions",
          finder = require("telescope.finders").new_table { results = results },
          sorter = require("telescope.config").values.generic_sorter(opts),
          attach_mappings = function(_, map)
            map({ "i", "n" }, "<CR>", function(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              if selection then
                actions.close(prompt_bufnr)
                local session_name = selection[1]:match "^([^:]+)"
                if not session_name then
                  vim.notify("Could not parse session name from: " .. selection[1], vim.log.levels.ERROR)
                  return
                end
                local Terminal = require("toggleterm.terminal").Terminal
                local term = Terminal:new {
                  cmd = "tmux attach -t " .. session_name,
                  direction = "float",
                  float_opts = {
                    border = "rounded",
                    width = math.floor(vim.o.columns * 0.85),
                    height = math.floor(vim.o.lines * 0.80),
                  },
                  autoclose = true,
                }
                term:open()
                vim.schedule(function()
                  vim.cmd "startinsert"
                end)
              end
            end)
            return true
          end,
        })
        :find()
    end

    -- key-map that calls the plain function
    vim.keymap.set("n", "<leader>fs", _G.ToggleTmuxSessions, { desc = "find tmux session" })
    vim.cmd [[ command! ToggleTmux lua _G.ToggleTmuxSessions() ]]
  end,
}
