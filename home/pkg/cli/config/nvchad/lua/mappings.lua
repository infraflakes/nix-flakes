require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "U", "<C-R>", { desc = "Redo last change" })
map("n", "<leader>wr", [[:%s///g<Left><Left><Left>]], { desc = "Substitute fast" })
map("n", "q", "<nop>", { silent = true, noremap = true }) -- disable recording
map("n", "<leader>dd", "<cmd>Nvdash<CR>", { desc = "Open Nvdash dashboard" }) -- open Nvdash
