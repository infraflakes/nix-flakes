---Find and navigate to git repositories using Telescope and fd.
---Uses async job runner for non-blocking performance on large filesystems.
---Caches results implicitly via Telescope's internal caching.
---@usage :OpenGitRepos
_G.OpenGitRepoPicker = function()
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local conf = require("telescope.config").values

  pickers
    .new({}, {
      prompt_title = "Git Repositories",
      -- new_oneshot_job: streams fd output asynchronously without blocking UI
      -- Flags: -t d (directories), -H (hidden), -I (no ignore), -g (glob), --prune (skip nested)
      finder = finders.new_oneshot_job({ "fd", "-t", "d", "-H", "-I", "-g", ".git", os.getenv "HOME", "--prune" }, {
        entry_maker = function(line)
          -- Strip /.git suffix (handles optional trailing slash from fd)
          -- Example: "/home/user/project/.git" -> "/home/user/project"
          local repo = line:gsub("/?$", ""):gsub("/%.git$", "")
          return {
            value = repo, -- absolute path (used for cd)
            display = vim.fn.fnamemodify(repo, ":~"), -- "~/project" for UI
            ordinal = repo, -- search/filter against this
          }
        end,
      }),
      sorter = conf.file_sorter {},
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          -- selection.value: absolute path to repo root
          vim.cmd.cd(selection.value)
          vim.notify("cd " .. vim.fn.fnamemodify(selection.value, ":~"))
        end)
        return true
      end,
    })
    :find()
end

vim.api.nvim_create_user_command("OpenGitRepos", _G.OpenGitRepoPicker, {})
