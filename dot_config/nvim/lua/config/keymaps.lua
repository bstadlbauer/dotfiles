-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Move Lines
vim.keymap.set("n", "<A-j>", "")
vim.keymap.set("i", "<A-j>", "")
vim.keymap.set("v", "<A-j>", "")
vim.keymap.set("n", "<A-k>", "")
vim.keymap.set("i", "<A-k>", "")
vim.keymap.set("v", "<A-k>", "")

-- Quickfix/Search
vim.keymap.set("n", "<leader>xn", "<cmd>cnext<CR>", { desc = "Next Quickfix Line" })
vim.keymap.set("n", "<leader>xp", "<cmd>cprevious<CR>", { desc = "Previous Quickfix Line" })

-- Python formatters/linters
-- Ruff check all
vim.keymap.set(
  "n",
  "<leader>cpr",
  '<cmd>cgetexpr system("ruff check -q") | cw <CR>',
  { desc = "Run Ruff on all files" }
)
-- Ruff fix all
vim.keymap.set("n", "<leader>cpf", '<cmd>cgetexpr system("ruff check -q --fix")<CR>', { desc = "Run Ruff autofixes" })
-- Ruff fix all unsafe
vim.keymap.set(
  "n",
  "<leader>cpu",
  '<cmd>cgetexpr system("ruff check -q --fix --unsafe-fixes")<CR>',
  { desc = "Run Ruff unsafe autofixes" }
)
--- Mypy
vim.keymap.set("n", "<leader>cpm", '<cmd>cgetexpr system("mypy") | cw <CR>', { desc = "Run Mypy on all files" })
