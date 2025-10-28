-- Neo-tree configuration
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden files by default
        hide_dotfiles = false, -- Don't hide dotfiles
        hide_gitignored = false, -- Don't hide gitignored files
        hide_by_name = {
          -- You can add specific files to hide here if needed
          ".git",
          ".DS_Store",
        },
      },
    },
  },
}
