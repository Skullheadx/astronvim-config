-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- import/override with your plugins folder

  -- Colorscheme: tokyonight
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },

  -- if you need to remove a lsp installed by mason: rm from ~/.local/share/nvim/mason/packages
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.golangci-lint" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.prettier" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.yaml" },

  -- { import = "astrocommunity.pack.harper" },
  --  { import = "astrocommunity.editing-support.auto-save-nvim" },
  { import = "astrocommunity.editing-support.conform-nvim" },
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
  { import = "astrocommunity.terminal-integration.vim-tmux-yank" },
  { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.editing-support.mini-operators" },
  { import = "astrocommunity.search.grug-far-nvim" },
  --  { import = "astrocommunity.editing-support.nvim-origami" },
  { import = "astrocommunity.motion.leap-nvim" },
  -- { import = "astrocommunity.motion.flit-nvim" }, --  TODO: make this not glitchy in floating terminal.
  { import = "astrocommunity.recipes.auto-session-restore" },
  --   { import = "astrocommunity.scrolling.cinnamon-nvim" },
  { import = "astrocommunity.motion.nvim-spider" },
  { import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.motion.tabout-nvim" },
  -- { import = "astrocommunity.workflow.precognition-nvim" },
  -- { import = "astrocommunity.remote-development.remote-sshfs-nvim" },
  -- { import = "astrocommunity.completion.avante-nvim" },
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline" },
  { import = "astrocommunity.game.leetcode-nvim" },
}
