return {
  {
    "ibhagwan/fzf-lua",
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