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
        pylsp = {
          mason = false, -- Don't install via Mason
          cmd = { vim.fn.expand("~/.local/share/uv/tools/python-lsp-server/bin/pylsp") },
          settings = {
            pylsp = {
              plugins = {
                -- Disable all linting/formatting (let basedpyright handle it)
                pycodestyle = { enabled = false },
                mccabe = { enabled = false },
                pyflakes = { enabled = false },
                pylint = { enabled = false },
                flake8 = { enabled = false },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                black = { enabled = false },
                
                -- Only enable rope for refactoring
                rope_autoimport = { enabled = true },
                rope_completion = { enabled = false },
              },
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "basedpyright",
      },
    },
  },
}