return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    -- Override the default <leader>e to focus instead of toggle
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({ action = "focus" })
      end,
      desc = "Focus Neotree (open if closed)",
    },
  },
}