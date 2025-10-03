-- lua/plugins/dev_env.lua
return {
  -- Mason core (manages external tools)
  {
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },

  -- Mason LSP bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        -- === Core / infra ===
        "lua_ls",      -- Lua (for Neovim config)
        "bashls",      -- Bash
        "dockerls",    -- Dockerfile
        "docker_compose_language_service",
        "jsonls",      -- JSON schemas
        "yamlls",      -- YAML
        "marksman",    -- Markdown
        "taplo",       -- TOML
        -- === Web / FE ===
        "html",
        "cssls",
        "emmet_ls",
        "tailwindcss",
        -- === TypeScript / JS ===
        -- Prefer vtsls (fast TS server); fallback: tsserver
        "vtsls",
        -- "tsserver",
        -- === Python ===
        -- Prefer basedpyright (faster, modern); fallback: pyright
        "basedpyright",
        -- "pyright",
        -- === Go ===
        "gopls",
        -- === Extras you might want ===
        -- "prismals", "svelte", "vuels", "rust_analyzer", "clangd", "sqlls"
      },
      automatic_installation = true,
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
      local lspconfig = require("lspconfig")

      -- Minimal per-server customizations (AstroNvim already sets sane defaults)
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              diagnostics = { globals = { "vim" } },
            },
          },
        },
        vtsls = {
          -- Nice JS/TS defaults
          settings = {
            typescript = { preferences = { importModuleSpecifier = "non-relative" } },
          },
        },
        yamlls = {
          settings = { yaml = { keyOrdering = false } },
        },
      }

      -- Auto-setup installed servers
      require("mason-lspconfig").setup_handlers({
        function(server)
          local sopts = servers[server] or {}
          lspconfig[server].setup(sopts)
        end,
      })
    end,
  },

  -- DAP (debug adapters) via Mason
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {
      ensure_installed = {
        "delve",            -- Go (dlv)
        "debugpy",          -- Python
        "js-debug-adapter", -- Node/JS/TS (vscode-js)
      },
      automatic_installation = true,
      handlers = {},
    },
  },

  -- Formatters & linters via none-ls (null-ls)
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim",
      "nvimtools/none-ls-extras.nvim", -- ⬅️ add extras for eslint_d
    },
    opts = function()
      local null_ls = require("null-ls")
      local sources = {
        -- ==== General ====
        null_ls.builtins.code_actions.gitsigns,

        -- ==== Lua ====
        null_ls.builtins.formatting.stylua,

        -- ==== Shell ====
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.formatting.shfmt,

        -- ==== JSON / Markdown / YAML / TOML / HTML / CSS ====
        null_ls.builtins.formatting.prettierd, -- fast Prettier daemon

        -- ==== Python ====
        -- Prefer Ruff for lint+format; fast & batteries-included
        null_ls.builtins.formatting.ruff,        -- ruff format
        null_ls.builtins.diagnostics.ruff,       -- ruff check

        -- ==== Go ====
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.golines,     -- optional: wrap long lines
        -- Diagnostics: golangci-lint (heavier; only if config present)
        null_ls.builtins.diagnostics.golangci_lint.with({
          condition = function(utils) return utils.root_has_file({ ".golangci.yml", ".golangci.yaml" }) end,
        }),
      }

      -- ==== Web / FE: ESLint via none-ls-extras (eslint_d) ====
      -- diagnostics
      local ok_diag, eslint_diag = pcall(require, "none-ls.diagnostics.eslint_d")
      if ok_diag then
        table.insert(sources, eslint_diag.with({
          condition = function(utils)
            return utils.root_has_file({
              ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json",
              "eslint.config.js", "eslint.config.cjs", "eslint.config.mjs",
            })
          end,
        }))
      end
      -- code actions (fixes, etc.)
      local ok_actions, eslint_actions = pcall(require, "none-ls.code_actions.eslint_d")
      if ok_actions then table.insert(sources, eslint_actions) end

      return {
        border = "rounded",
        sources = sources,
      }
    end,
    config = function(_, opts)
      require("null-ls").setup(opts)
    end,
  },

  -- Bridge Mason <-> none-ls: auto-install tools used above
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        -- formatters / linters listed above
        "stylua",
        "shfmt",
        "shellcheck",
        "prettierd",
        "eslint_d",
        "ruff",
        "gofumpt",
        "golines",
        "golangci-lint",
        -- If you prefer black/isort:
        -- "black", "isort",
      },
      automatic_installation = true,
      handlers = {},
    },
  },
}

