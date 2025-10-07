
-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "go",
      "gomod",
      "gowork",
      "regex",
      "comment",
      "query",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
