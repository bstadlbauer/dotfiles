return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- For Python monorepos with basedpyright
        basedpyright = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            -- Look for the monorepo root by finding common monorepo markers
            -- Adjust these patterns based on your monorepo structure
            local root = util.root_pattern("uv.lock")(fname)
            -- If no root found, fall back to current working directory
            return root or vim.fn.getcwd()
          end,
          settings = {
            basedpyright = {
              analysis = {
                -- Include all packages in the monorepo
                extraPaths = {},
                -- Use workspace mode for better monorepo support
                useLibraryCodeForTypes = true,
                -- Index the entire workspace
                indexing = true,
              },
            },
            python = {
              analysis = {
                -- Analyze all files in workspace
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        -- For TypeScript/JavaScript monorepos
        tsserver = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            -- Look for monorepo root markers
            return util.root_pattern(
              "pnpm-workspace.yaml", -- pnpm monorepo
              "lerna.json", -- Lerna monorepo
              "nx.json", -- Nx monorepo
              "rush.json", -- Rush monorepo
              ".git", -- Git root as fallback
              "package.json" -- Fallback to package.json
            )(fname) or vim.fn.getcwd()
          end,
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Ensure LSP searches from monorepo root for references
      local on_attach = opts.on_attach or function() end
      opts.on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        -- Override the workspace folders to use monorepo root
        if client.config.root_dir then
          local workspace_folders = {
            {
              uri = vim.uri_from_fname(client.config.root_dir),
              name = vim.fn.fnamemodify(client.config.root_dir, ":t"),
            },
          }
          client.config.workspace_folders = workspace_folders
        end
      end
      return opts
    end,
  },
}
