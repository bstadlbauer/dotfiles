return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<Tab>",
          accept_word = "<M-Right>",  -- Accept word-by-word
          accept_line = "<C-Right>",  -- Accept line-by-line  
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",  -- Open panel to see multiple suggestions
        },
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    -- Optional: Configure Copilot Chat for longer code generation
    opts = {
      show_help = true,
      debug = false,
    },
  },
}