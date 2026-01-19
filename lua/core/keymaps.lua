vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- save / quit
keymap("n", "<leader>w", ":w<CR>")
keymap("n", "<leader>q", ":q<CR>")

-- window movement
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")

-- window resize
keymap("n", "<A-h>", ":vertical resize -2<CR>")
keymap("n", "<A-l>", ":vertical resize +2<CR>")
keymap("n", "<A-j>", ":resize -2<CR>")
keymap("n", "<A-k>", ":resize +2<CR>")

-- fast navigation
keymap("n", "H", "^")
keymap("n", "L", "$")
keymap("n", "<leader>gg", "gg")
keymap("n", "<leader>G", "G")

