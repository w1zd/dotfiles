-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

keymap.set("n", "<Left>", "<Nop>")
keymap.set("n", "<Right>", "<Nop>")
keymap.set("n", "<Up>", "<Nop>")
keymap.set("n", "<Down>", "<Nop>")

keymap.set("n", "∆", ":m .+1<CR>==")
keymap.set("n", "˚", ":m .-2<CR>==")

keymap.set("i", "∆", "<Esc>:m .+1<CR>==gi")
keymap.set("i", "˚", "<Esc>:m .-2<CR>==gi")

keymap.set("v", "∆", ":m '>+0<CR>gv=gv")
keymap.set("v", "˚", ":m '<-2<CR>gv=gv")
