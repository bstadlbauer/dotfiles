return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      -- Override the default <leader><leader> to use monorepo root
      {
        "<leader><leader>",
        function()
          local util = require("lspconfig.util")
          local current_file = vim.fn.expand("%:p")
          local root = util.root_pattern("uv.lock", ".git")(current_file) or vim.fn.getcwd()
          require("fzf-lua").files({ cwd = root })
        end,
        desc = "Find Files (Root Dir)",
      },
      -- Also override live_grep to use monorepo root
      {
        "<leader>/",
        function()
          local util = require("lspconfig.util")
          local current_file = vim.fn.expand("%:p")
          local root = util.root_pattern("uv.lock", ".git")(current_file) or vim.fn.getcwd()
          require("fzf-lua").live_grep({ cwd = root })
        end,
        desc = "Grep (Root Dir)",
      },
    },
    opts = {
      defaults = {
        -- Change keybindings for fzf actions
        actions = {
          -- Use Ctrl-h instead of Alt-h for toggle hidden files
          ["ctrl-h"] = { fn = require("fzf-lua.actions").toggle_hidden, desc = "toggle-hidden" },
          ["alt-h"] = false, -- Disable the default Alt-h binding
          
          -- Use Ctrl-u instead of Alt-i for toggle ignore
          ["ctrl-u"] = { fn = require("fzf-lua.actions").toggle_ignore, desc = "toggle-ignore" },
          ["alt-i"] = false, -- Disable the default Alt-i binding
        },
      },
      -- Apply to specific pickers that use these actions
      files = {
        actions = {
          ["ctrl-h"] = { fn = require("fzf-lua.actions").toggle_hidden, desc = "toggle-hidden" },
          ["alt-h"] = false,
          ["ctrl-u"] = { fn = require("fzf-lua.actions").toggle_ignore, desc = "toggle-ignore" },
          ["alt-i"] = false,
        },
      },
      grep = {
        actions = {
          ["ctrl-h"] = { fn = require("fzf-lua.actions").toggle_hidden, desc = "toggle-hidden" },
          ["alt-h"] = false,
          ["ctrl-u"] = { fn = require("fzf-lua.actions").toggle_ignore, desc = "toggle-ignore" },
          ["alt-i"] = false,
        },
      },
    },
  },
}
