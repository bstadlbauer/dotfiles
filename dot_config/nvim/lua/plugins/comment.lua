return {
  {
    "numToStr/Comment.nvim",
    opts = {
      -- Add 'gc' to comment line in normal mode (without needing gcc)
      toggler = {
        line = "gc",  -- This makes 'gc' toggle comment on current line
        block = "gbc",
      },
      opleader = {
        line = "gc",
        block = "gb",
      },
    },
  },
}