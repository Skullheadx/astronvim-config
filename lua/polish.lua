
-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function() vim.lsp.buf.format({ async = false }) end,
})
-- Normal mode
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Focus left window" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Focus lower window" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Focus upper window" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Focus right window" })

-- Terminal mode: exit to Normal then move
vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]], { desc = "Terminal: focus left" })
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]], { desc = "Terminal: focus down" })
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]], { desc = "Terminal: focus up" })
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]], { desc = "Terminal: focus right" })

vim.opt.autoread = true
vim.opt.updatetime = 500

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI" }, { command = "checktime" })

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  callback = function(args)
    vim.notify("Reloaded: " .. vim.fn.fnamemodify(args.file, ":."), vim.log.levels.INFO)
  end,
})
vim.api.nvim_create_autocmd("FileChangedShell", {
  callback = function(args)
    vim.notify(
      "⚠ File changed on disk: "
        .. vim.fn.fnamemodify(args.file, ":.")
        .. " (" .. tostring(args.data.reason) .. ")",
      vim.log.levels.WARN
    )
  end,
})



