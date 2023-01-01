local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
local g = vim.g

map("n", "<Space>", "<Nop>", opts)
g.mapleader = " "
g.maplocalleader = " "

-- File tree
map("n", "<leader>e", ":Lex 30<cr>", opts)

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

-- Telescrope
map("n", "<c-n>", "<cmd>Telescope find_files<cr>", opts)
map("n", "<c-f>", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)

