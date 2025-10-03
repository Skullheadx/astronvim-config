
-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
-- Terminal mode: exit to Normal then move
vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]], { desc = "Terminal: focus left" })
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]], { desc = "Terminal: focus down" })
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]], { desc = "Terminal: focus up" })
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]], { desc = "Terminal: focus right" })
