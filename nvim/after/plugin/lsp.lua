 require("catalin.go_to_definition")
  local lsp = require('lsp-zero')

  lsp.preset('recommended')

  --vim.lsp.set_log_level 'debug'
  --if vim.fn.has 'nvim-0.5.1' == 1 then
  --  require('vim.lsp.log').set_format_func(vim.inspect)
  --end

  lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gc", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    --vim.keymap.set("n", "gd", function()
    --  Go_to_definition()
    --end, {noremap = true})
    --
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "R",  function() vim.lsp.buf.rename() end,         { desc = '[R]ename symbol (with LSP)', buffer = bufnr, remap = false })

    -- vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    -- vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    -- vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    -- vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    -- vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    -- vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    -- vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    -- vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  end)

  --let g:LanguageClient_serverCommands = {
    --    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    --    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    --    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    --    \ 'python': ['/usr/local/bin/pyls'],
    --    \ 'ruby': ['~/.rvm/gems/ruby-3.1.2/bin/solargraph', 'stdio'],
    --    \ }

    lsp.set_preferences({
      sign_icons = {},
      settings = {
        solargraph = {
          diagnostics = true
        }
      }
    })

local lsp_configurations = require('lspconfig.configs')

if not lsp_configurations.educationlsp then
  lsp_configurations.educationlsp = {
    default_config = {
      name = "educationlsp",
      cmd = { "ruby", "/home/catalin/play/rpc/ruby.rb" },
      filetypes = {"ruby"},
      root_dir = require('lspconfig.util').root_pattern('.git')
    }
  }
end

require('lspconfig').educationlsp.setup({})

    require('mason').setup({})
    require('mason-lspconfig').setup({
      -- Replace the language servers listed here 
      -- with the ones you want to install
      ensure_installed = {'solargraph', 'lua_ls'},
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,
      }
    })

    lsp.setup()




----vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
----vim.keymap.set("n", "e", vim.lsp.buf.code_action, opts)
----vim.keymap.set("n", "e", vim.lsp.buf.completion, opts)
--
--local client = vim.lsp.start_client {
--  name = "educationlsp",
--  cmd = { "ruby", "/home/catalin/play/rpc/ruby.rb" }
--  --cmd = { "/home/catalin/play/educationlsp/main" }
--}
--
--if not client then
--  vim.notify("error")
--  return
--end
--
--
-- vim.api.nvim_create_autocmd("Filetype", {
--   pattern = "ruby",
--   callback = function()
--     vim.lsp.buf_attach_client(0, client)
--     print(client)
--   end,
-- })
