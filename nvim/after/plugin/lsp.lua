local lsp = require('lsp-zero')

lsp.preset('recommended')



lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gc", vim.lsp.buf.references, opts)

  -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
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

  require('mason').setup({})
  require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {'eslint', 'tsserver', 'solargraph'},
    handlers = {
      lsp.default_setup,
    },
  })

  lsp.setup()
