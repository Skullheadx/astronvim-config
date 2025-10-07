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

-- vim.keymap.set("n", "<leader>r", "<cmd>GrugFar<cr>", { desc = "Find & Replace (GrugFar)" })

-- Start OPEN, then you choose what to close
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Make folds less trigger-happy
vim.opt.foldminlines = 2 -- ignore teeny tiny blocks; try 3–5 if you like
vim.opt.foldnestmax = 6 -- don't go crazy with deep nesting
vim.opt.foldcolumn = "auto:3" -- visual gutter to see fold levels (Neovim ≥0.10)

-- Recompute folds after parser/LSP attach (prevents "everything looks folded")
vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
  pattern = { "*.go" },
  callback = function()
    vim.schedule(function()
      vim.cmd "silent! normal! zx" -- rebuild fold info
      vim.cmd "silent! normal! zR" -- open all by default
    end)
  end,
})
