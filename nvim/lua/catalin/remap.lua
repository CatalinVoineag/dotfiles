require("catalin.go_to_test")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Vex)
vim.keymap.set("n", "<leader>pe", vim.cmd.Ex)

-- move highlighted text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move line below onto current line
vim.keymap.set("n", "J", "mzJ`z")
-- Keep cursor centered when navigating up and down by half of page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Keep cursor centered when searching 
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Remember the yank after you pasted it over text
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "Q", "<nop>")
-- Find and replace the current word in the whole file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")

-- Reload nvim config
vim.keymap.set("n", "<leader><CR>", ":so /home/catalin/.config/dotfiles/nvim/init.lua<CR>")

-- Collapse text
vim.keymap.set("n", "<end>", "za")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Make current file executable
vim.keymap.set("n", "<leader>e", ":!chmod +x %")

-- tmux sessioniser
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww /home/catalin/.config/dotfiles/tmux-sessioniser<CR>")

local function file_exists(filename)
  local file = io.open(filename, "r")
  if file then
    file:close()
    return true
  else
    return false
  end
end

-- go to test file
vim.keymap.set("n", "<leader>tv", function()
  Go_to_test()
end, {noremap = true})

-- quickfix
vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprev<CR>")
