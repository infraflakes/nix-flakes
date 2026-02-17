_G.OpenGitRepoPicker = function()
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local conf = require("telescope.config").values

  local cmd = { "fd", "-t", "d", "-H", "-I", "-g", ".git", os.getenv "HOME", "--prune" }
  local output = vim.fn.systemlist(cmd)

  if vim.v.shell_error ~= 0 then
    vim.notify("fd command failed. Is fd installed?", vim.log.levels.ERROR)
    return
  end

  -- Explicitly remove /.git suffix, handling potential trailing slash
  local repos = vim.tbl_map(function(git_dir)
    -- Remove trailing slash if present, then remove /.git
    return git_dir:gsub("/?$", ""):gsub("/%.git$", "")
  end, output)

  if #repos == 0 then
    vim.notify("No Git repositories found.", vim.log.levels.WARN)
    return
  end

  pickers
    .new({}, {
      prompt_title = "Git Repositories",
      finder = finders.new_table {
        results = repos,
        entry_maker = function(entry)
          return {
            value = entry,
            display = vim.fn.fnamemodify(entry, ":~"),
            ordinal = entry,
          }
        end,
      },
      sorter = conf.file_sorter {},
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          -- Debug: print what we're actually cd'ing to
          -- print("DEBUG: cd to:", selection.value)
          vim.cmd.cd(selection.value)
          vim.notify("cd " .. vim.fn.fnamemodify(selection.value, ":~"))
        end)
        return true
      end,
    })
    :find()
end

vim.api.nvim_create_user_command("OpenGitRepos", _G.OpenGitRepoPicker, {})
