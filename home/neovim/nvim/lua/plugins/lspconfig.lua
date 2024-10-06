return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- stylua: ignore
      vim.list_extend(Keys, {
        { "gr", false, desc = "References", nowait = true },
        { "gR", false, desc = "References", nowait = true },
        { "gI", false, desc = "Goto Implementation" },
        { "gy", false, desc = "Goto T[y]pe Definition" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type vim.diagnostic.Opts
      diagnostics = {
        virtual_text = {
          format = function(diagnostic)
            if diagnostic.code == nil then
              return string.format("[%s]: %s", diagnostic.source, diagnostic.message)
            end

            return string.format("[%s]: %s (%s)", diagnostic.source, diagnostic.message, diagnostic.code)
          end,
        },
      },
      ---@type lspconfig.options
      servers = {
        ---@type lspconfig.options.lua_ls
        lua_ls = {
          settings = {
            Lua = {
              hint = {
                enable = true,
                paramName = "All",
                paramType = true,
                setType = true,
              },
            },
          },
        },
        cssmodules_ls = {},
        golangci_lint_ls = {},
        emmet_language_server = {},
        sqls = {},
        css_variables = {},
        cssls = {
          settings = {
            css = { validate = true, lint = {
              unknownAtRules = "ignore",
            } },
            scss = { validate = true, lint = {
              unknownAtRules = "ignore",
            } },
            less = { validate = true, lint = {
              unknownAtRules = "ignore",
            } },
          },
        },
        phpactor = {},
        volar = {
          settings = {
            volar = {
              filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
            },
          },
        },
        stimulus_ls = {
          filetypes = { "html", "ruby", "eruby", "blade", "php", "slim" },

          settings = {
            stimulus_ls = {},
          },
        },
        ---@type lspconfig.options.gopls
        gopls = {
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
              analyses = {
                unusedvariable = true,
                useany = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
        -- ---@type lspconfig.options.tsserver
        -- tsserver = {
        --   settings = {
        --     tsserver = {
        --       completions = {
        --         completeFunctionCalls = true,
        --       },
        --     },
        --     typescript = {
        --       inlayHints = {
        --         includeCompletionsWithInsertText = true,
        --         includeInlayParameterNameHints = "all",
        --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        --         includeInlayFunctionParameterTypeHints = true,
        --         includeInlayVariableTypeHints = true,
        --         includeInlayPropertyDeclarationTypeHints = true,
        --         includeInlayFunctionLikeReturnTypeHints = true,
        --         includeInlayEnumMemberValueHints = true,
        --       },
        --     },
        --     javascript = {
        --       suggest = {
        --         autoImports = true,
        --         completeFunctionCalls = true,
        --         includeAutomaticOptionalChainCompletions=true
        --       },
        --       experimental = {
        --         updateImportsOnPaste = true,
        --       },
        --       format = {
        --         semicolons = "insert",
        --       },
        --       inlayHints = {
        --         includeCompletionsWithInsertText = true,
        --         includeInlayParameterNameHints = "all",
        --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        --         includeInlayFunctionParameterTypeHints = true,
        --         includeInlayVariableTypeHints = true,
        --         includeInlayPropertyDeclarationTypeHints = true,
        --         includeInlayFunctionLikeReturnTypeHints = true,
        --         includeInlayEnumMemberValueHints = true,
        --         enumMemberValues = {
        --           enabled = true,
        --         },
        --         functionLikeReturnTypes = {
        --           enabled = true,
        --         },
        --         parameterNames = {
        --           enabled = "all",
        --           suppressWhenArgumentMatchesName = "all",
        --         },
        --         parameterTypes = {
        --           enabled = true,
        --         },
        --         propertyDeclarationTypes = {
        --           enabled = true,
        --         },
        --         variableTypes = {
        --           enabled = true,
        --           suppressWhenTypeMatchesName = "all",
        --         },
        --       },
        --       referencesCodeLens = {
        --         enabled = true,
        --         showOnAllFunctions = true,
        --       },
        --     },
        --   },
        -- },
        ---@type lspconfig.options.vtsls
        vtsls = {
          settings = {
            inlayHints = {
              variableTypes = { enabled = true },
              parameterNames = { enabled = "all" },
            },
          },
        },
        ---@type lspconfig.options.tailwindcss
        tailwindcss = {
          settings = {
            tailwindCSS = {
              classAttributes = { ":class", "class", "className" },
              experimental = {
                classRegex = {
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { "(?:enter|leave)(?:From|To)?=\\s*(?:\"|')([^(?:\"|')]*)" },
                  { "cn\\(([^)]*)\\)", "'([^']*)'" },
                  { ":class?=\\s*(?:\"|'|{`)([^(?:\"|'|`})]*)" },
                },
              },
            },
          },
        },
        ---@type lspconfig.options.eslint
        eslint = {
          mason = true,
          -- root_dir = require("lspconfig.util").root_pattern("package.json"),
          settings = {
            eslint = {
              workingDirectory = { mode = "auto" },
            },
          },
        },
        -- ---@type lspconfig.options.ruby_lsp
        -- ruby_lsp = {
        --   mason = false,
        --   settings = {
        --     rubyLsp = {
        --       featuresConfiguration = {
        --         inlayHint = {
        --           enableAll = true,
        --         },
        --       },
        --     },
        --   },
        -- },
        ---@type lspconfig.options.solargraph
        solargraph = {
          mason = false,
          settings = {
            solargraph = {
              diagnostics = false,
              useBundler = true,
            },
          },
        },
        ruby_lsp = {
          mason = false,
        },
        rubocop = {
          enabled = false,
          mason = false,
        },
        yamlls = {
          mason = false,
          settings = {
            yaml = {
              schemaStore = {
                enable = true,
              },
              schemas = {
                kubernetes = "k8s-*.yaml",
                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
                ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                ["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
              },
            },
          },
        },
        nixd = {
          mason = false,
        },
        nil_ls = {
          mason = false,
        },
        typos_lsp = {
          mason = true,
        },
        ---@type lspconfig.options.standardrb
        -- standardrb = {
        --   mason = false,
        -- },
      },
    },
    -- config = function()
    --   require("lspconfig").efm.setup({
    --     init_options = { documentFormatting = true },
    --     filetypes = { "lua" },
    --     settings = {
    --       rootMarkers = { ".git/" },
    --       languages = {
    --         lua = {
    --           require("efmls-configs.linters.luacheck"),
    --           require("efmls-configs.formatters.stylua"),
    --         },
    --       },
    --     },
    --   })
    -- end, }
  },
}
