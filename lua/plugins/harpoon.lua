-- lua/plugins/harpoon.lua
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    settings = { save_on_toggle = true, sync_on_ui_close = true },
  },
  config = function(_, opts)
    local harpoon = require "harpoon"

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>.", function() harpoon:list():add() end, { desc = "Add Harpoon Mark" })
    vim.keymap.set(
      "n",
      "<leader>'",
      function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Show Harpoon List" }
    )

    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
  end,
}
