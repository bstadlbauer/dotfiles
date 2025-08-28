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
      },
    },
  },
}