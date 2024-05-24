local git_worktree = require "git-worktree"
local builtin = require('telescope.builtin')
local telescope = require('telescope')
local job = require('plenary.job')
--local file = require('file')
--
--requtire("debugger")

telescope.load_extension = git_worktree

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
vim.keymap.set("n", "<leader>bf", builtin.buffers, {})

vim.keymap.set("n", "<leader>gw", telescope.extensions.git_worktree.git_worktrees, {})
-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-f> - toggles forcing of the next deletion
vim.keymap.set("n", "<leader>gm", telescope.extensions.git_worktree.create_git_worktree, {})

--git_worktree.on_tree_change(function(op, metadata)
--  if op == git_worktree.Operations.Switch then
--    --jpause("debug time!")
--    --print("create BRANCH")
--    --file.copy(src, dest)
--  end
--end)


-- op = Operations.Switch, Operations.Create, Operations.Delete
-- metadata = table of useful values (structure dependent on op)
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted

git_worktree.on_tree_change(function(op, metadata)
  --print('op', git_worktree.Operations.Create)

  if op == git_worktree.Operations.Switch then
  --if op == git_worktree.Operations.Create then
    --print('bundle install')
    --job:new({
    --  command = 'bundle',
    --  args = { 'install' }
    --}):start()

    print('bin/setup')
    job:new({
      command = 'bin/setup'
    }):start()

---- Check if the .env files is 2 directories back as well
    print('copying .env')
    job:new({
      command = 'cp',
      args = { '../../main/.env', '.env' }
    }):start()
  end
end)
