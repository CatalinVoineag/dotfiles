require("catalin.go_to_definition")
local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gc", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  end)

local lsp_configurations = require('lspconfig.configs')

if not lsp_configurations.educationlsp then
  lsp_configurations.educationlsp = {
    default_config = {
      name = "educationlsp",
      cmd = { "ruby", "/home/catalin/play/rpc/ruby.rb" },
      filetypes = {"ruby", "eruby"},
      root_dir = require('lspconfig.util').root_pattern('.git')
    }
  }
end

require('lspconfig').educationlsp.setup({})

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {'lua_ls', 'gopls', 'htmx'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

lsp.setup()


local lspconfig = require('lspconfig')
lspconfig.solargraph.setup {
  settings = {
    diagnostics = true
  }
}

-- Store the original handler
local original_definition_handler = vim.lsp.handlers['textDocument/definition']

-- Table to track if a response has been processed per buffer
local processed_per_buf = {}

local function custom_definition_handler(err, result, ctx, config)
  -- Get the buffer number
  local bufnr = ctx.bufnr
  -- Initialize state for the buffer if it doesn't exist
  if not processed_per_buf[bufnr] then
    processed_per_buf[bufnr] = {processed = false}
  end

  -- Get the client name
  local client_name = vim.lsp.get_client_by_id(ctx.client_id).name

  -- Reset the state if there is an error or the result is nil
  if err or not result then
    processed_per_buf[bufnr].processed = false
    return
  end

  -- Check if the result should be handled by the current client
  if client_name == 'educationlsp' and result and result['priority'] then
    processed_per_buf[bufnr].processed = true
    vim.cmd.edit(result['uri'])
  else
    if not processed_per_buf[bufnr].processed then
      processed_per_buf[bufnr].processed = true
      original_definition_handler(err, result, ctx, config)
    end
  end

  -- Reset the state for the next request
  vim.defer_fn(function()
    processed_per_buf[bufnr].processed = false
  end, 1)
end

-- Set the custom handler for 'textDocument/definition'
vim.lsp.handlers['textDocument/definition'] = custom_definition_handler
