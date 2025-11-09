# TODO:

- [x] Fix moving between nvim panes
  - [ ] make it so that it works in Tmux
- [x] Decide between mini.animate or cinnamon
  - [x] not much configuration ability with mini? like shorter animation time from cinnamon
- [x] Make it so that in markdown files, continue lists
- [x] get rid of errors on startup
  - [ ] maybe got rid of it by removing flit
- [ ] ssh remote dev
- [ ] fix toggle term
- [ ] fix auto save
- [ ] Fix hot reload when file changes outside neovim




# lsps, treesitters, formatters, linters, debuggers

| pack | treesitter parser | language server | formatter | linter | debugger | concern? |
|------|-------------------|-----------------|-----------|--------|----------|----------|
| bash | bash | bashls | shfmt | shellcheck | bash | |
| cpp  | cpp,c,objc,cuda,proto | clangd | clang-format |  |  | |
| docker | dockerfile | docker-language-server |  | hadolint |  | |
| fish | fish |  | fish_indent | fish |  |* missing fish_indent |
| go,golangci-lint | go | gopls,golangci-lint-langserver | gofumpt | golangci-lint |  | * |
| html-css | html,css | html,css,emmet_ls |  |  |  | |
| json | json,jsonc | jsonls |  |  | | |
| lua | lua | lua_ls | stylua | selene | | |
| markdown | markdown,markdown_inline | marksman |  |  |  | |
| nix | nix | nixd |  |  |  | |
| python | python,toml | basedpyright,ruff_lsp |  | | debugpy | |
| sql | sql | sqls |  |  |  | |
| typescript-all-in-one | typescript,javascript,tsx,jsdoc | denols,vtsls |  |  |  | |
| yaml | yaml | yamlls |  |  |  | |
| zig | zig | zls |  |  |  | |


