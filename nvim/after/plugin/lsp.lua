vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if not (string.find(client.name, 'solargraph') or string.find(client.name, 'educationlsp')) then
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    end

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gc', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<leader>vrn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set("n", "<leader>vd", '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set("n", "[d", '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
    vim.keymap.set("n", "]d", '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  end
})

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

local function solargraph_commands(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "", {
    callback = function()

      client.request("textDocument/definition", vim.lsp.util.make_position_params(), function(err, result, ctx, config)
        if not err and result and not vim.tbl_isempty(result) then
          vim.lsp.util.jump_to_location(result[1], config or {})
        else
          print("Definition not found.")
        end
      end)
    end,
  })
end

local function education_lsp_commands(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gd", "", {
    callback = function()

      if client then
        client.request("textDocument/definition", vim.lsp.util.make_position_params(), function(err, result, ctx, config)
          if not err and result and not vim.tbl_isempty(result) then
            vim.lsp.util.jump_to_location(result, config or {})
          else
            print("Definition not found.")
          end
        end)
      end
    end,
    desc = "Go to definition with prioritized LSP",
  })
end


local lspconfig = require('lspconfig')
lspconfig.solargraph.setup({
  settings = {
    diagnostics = true
  },
  on_attach = function(client, bufnr)
    solargraph_commands(client, bufnr)
  end,
})

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

require('lspconfig').educationlsp.setup({
  on_attach = function(client, bufnr)
    education_lsp_commands(client, bufnr)
  end,
})
