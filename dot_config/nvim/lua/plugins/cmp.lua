return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.preselect = require("cmp").PreselectMode.None
      opts.completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      }
    end,
  },
}
