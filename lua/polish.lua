-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
-- Terminal mode: exit to Normal then move
--vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]], { desc = "Terminal: focus left" })
--vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]], { desc = "Terminal: focus down" })
--vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]], { desc = "Terminal: focus up" })
--vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]], { desc = "Terminal: focus right" })

vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set("n", "<A-h>", "<Cmd>TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<A-j>", "<Cmd>TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<A-k>", "<Cmd>TmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<A-l>", "<Cmd>TmuxNavigateRight<CR>", { silent = true })

vim.keymap.set("n", "<leader>r", "<cmd>GrugFar<cr>", { desc = "Find & Replace (GrugFar)" })
