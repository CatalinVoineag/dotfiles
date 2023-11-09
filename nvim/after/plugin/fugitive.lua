vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gt", function()
  vim.cmd.Git('stash')
end, opts)
