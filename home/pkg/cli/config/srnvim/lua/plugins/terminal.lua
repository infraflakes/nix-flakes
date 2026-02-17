return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    -- Normal mode mapping to open/toggle
    { "<M-w>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
  },
  opts = {
    direction = "float",
    -- maps Alt+w inside the terminal buffer so you can close it without switching modes first.
    open_mapping = [[<M-w>]],
    float_opts = {
      border = "rounded",
      width = math.floor(vim.o.columns * 0.85),
      height = math.floor(vim.o.lines * 0.80),
    },
    on_create = function(t)
      vim.api.nvim_create_autocmd("DirChanged", {
        buffer = t.bufnr,
        callback = function()
          vim.loop.chdir(vim.b[t.bufnr].changedtick and vim.fn.getcwd(t.bufnr) or t.dir)
        end,
      })
    end,
  },
}
