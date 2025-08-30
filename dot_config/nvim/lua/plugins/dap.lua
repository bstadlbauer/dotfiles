return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      -- Choose and run debug configuration
      {
        "<leader>di",
        function()
          require("dap").continue()
        end,
        desc = "Debug with Configuration",
      },
      -- Disable the default <leader>dc mapping
      { "<leader>dc", false },
      -- Debug current file with breakpoints
      {
        "<leader>dd",
        function()
          require("dap").continue()
        end,
        desc = "Debug File",
      },
      -- Run file in terminal without debugging
      {
        "<leader>de",
        function()
          local filetype = vim.bo.filetype
          local filepath = vim.fn.expand("%:p")
          local cmd = ""
          
          -- Define run commands for different filetypes
          local run_commands = {
            python = "python3",
            javascript = "node",
            typescript = "tsx",
            lua = "lua",
            go = "go run",
            rust = "cargo run",
            -- Add more as needed
          }
          
          cmd = run_commands[filetype]
          if not cmd then
            vim.notify("No run command defined for filetype: " .. filetype, vim.log.levels.ERROR)
            return
          end
          
          -- Open a terminal and run the file
          vim.cmd("split | terminal " .. cmd .. " " .. filepath)
          vim.cmd("startinsert") -- Enter insert mode in terminal
        end,
        desc = "Execute File in Terminal",
      },
    },
    opts = function()
      local dap = require("dap")
      
      -- Ensure Python configurations use integrated terminal for console output
      dap.configurations.python = dap.configurations.python or {}
      
      -- Add both debug and run configurations for Python
      local python_configs = {
        {
          type = "python",
          request = "launch",
          name = "Debug Current File",
          program = "${file}",
          console = "integratedTerminal",
          justMyCode = false,
        },
        {
          type = "python",
          request = "launch", 
          name = "Run Current File (no debug)",
          program = "${file}",
          console = "integratedTerminal",
          justMyCode = false,
          stopOnEntry = false,
          -- Note: The adapter might still stop at breakpoints
          -- To truly run without debugging, you might need to use
          -- a different approach like running in terminal directly
        },
      }
      
      -- Merge with existing configs
      for _, config in ipairs(python_configs) do
        table.insert(dap.configurations.python, 1, config)
      end
    end,
  },
}