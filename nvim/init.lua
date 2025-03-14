require("catalin")
require("global")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  { "rose-pine/neovim", name = "rose-pine" },

  {
	  'VonHeikemen/lsp-zero.nvim',
	  dependencies= {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},
      {'onsails/lspkind.nvim'},

		  -- Snippets
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
		  {'rafamadriz/friendly-snippets'},
	  }
  },

  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {'nvim-treesitter/playground'},
  {'ThePrimeagen/harpoon'},
  {'mbbill/undotree'},
  {'tpope/vim-fugitive'},
  -- SQL Client
  {'tpope/vim-dadbod'},
  {'kristijanhusak/vim-dadbod-completion'},
  {'kristijanhusak/vim-dadbod-ui'},

  { 'vim-test/vim-test' },
  { 'ThePrimeagen/git-worktree.nvim' },
  { 'tpope/vim-rhubarb' },
  { 'vimwiki/vimwiki' },

  -- Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { 'xiyaowong/transparent.nvim' },

  -- neorg notes
  {
    "rebelot/kanagawa.nvim", -- neorg needs a colorscheme with treesitter support
    config = function()
      vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {
            config = {
              icons = {
                todo = {
                  done = {
                    icon = "✓",
                  },
                  pending = {
                    icon = "⚒",
                  }
                }
              }
            }
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
}, {})
