return {
  {
    "LazyVim/LazyVim",
    opts = function()
      -- Create autosave functionality using autocmds
      local autosave_enabled = true
      
      -- Create autocmd group
      local autosave_group = vim.api.nvim_create_augroup("AutoSave", { clear = true })
      
      -- Autosave on these events
      vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "FocusLost", "BufLeave" }, {
        group = autosave_group,
        pattern = "*",
        callback = function()
          if autosave_enabled and vim.bo.modified and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
            vim.cmd("silent! write")
          end
        end,
      })
      
      -- Create toggle command
      vim.api.nvim_create_user_command("AutoSaveToggle", function()
        autosave_enabled = not autosave_enabled
        vim.notify("AutoSave " .. (autosave_enabled and "enabled" or "disabled"))
      end, {})
      
      -- Add keymap for toggling
      vim.keymap.set("n", "<leader>ue", "<cmd>AutoSaveToggle<cr>", { desc = "Toggle auto-save" })
    end,
  },
}
