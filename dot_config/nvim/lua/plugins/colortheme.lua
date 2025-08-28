return {
  {
    "catppuccin/nvim",
    -- Fix for a breaking change in V1.11 API
    -- https://github.com/LazyVim/LazyVim/issues/6355#issuecomment-3212986215
    opts = function(_, opts)
      local module = require("catppuccin.groups.integrations.bufferline")
      if module then
        module.get = module.get_theme
      end
      return opts
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
