return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,
                diagnosticSeverityOverrides = {
                  reportUnusedVariable = "warning",
                  reportUnusedImport = "warning",
                },
              },
            },
          },
        },
        ruff = {
          init_options = {
            settings = {
              organizeImports = true,
              fixAll = true,
              lint = {
                enable = true,
              },
            },
          },
          on_attach = function(client, bufnr)
            -- Enable formatting via code action
            client.server_capabilities.codeActionProvider = {
              codeActionKinds = {
                "source.fixAll",
                "source.organizeImports",
                "source.fixAll.ruff",
              },
            }
          end,
        },
      },
    },
  },
}