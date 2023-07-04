local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
local g = vim.g
local dap = require "dap"
local dap_go =require "dap-go"

map("n", "<Space>", "<Nop>", opts)
g.mapleader = " "
g.maplocalleader = " "

-- File tree
map("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Resizing
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffers navigation
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual Mode
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
map("n", "<c-n>", "<cmd>Telescope find_files<cr>", opts)
map("n", "<c-f>", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
map("n", "<c-b>", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)

-- Debug
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dr', dap.repl.open)
vim.keymap.set('n', '<leader>dt', dap_go.debug_test)
