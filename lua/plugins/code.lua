return {
  { -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    config = require('config.code.lsp').setup,
    dependencies = {
      -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
      { 'williamboman/mason.nvim' },
      -- bridge mason with the lspconfig
      'williamboman/mason-lspconfig.nvim',
      'saghen/blink.cmp',
    },
  },
  -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
  -- used for completion, annotations and signatures of Neovim apis
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        { path = 'snacks.nvim', words = { 'Snacks' } },
      },
    },
  },
  -- luvit-meta: collection of definition files for the framework Luvit.
  { 'Bilal2453/luvit-meta', lazy = true },
  { -- blink.cmp: a completion plugin with support for LSPs and external sources
    'saghen/blink.cmp',
    version = 'v0.*',
    event = 'InsertEnter',
    opts = require('config.code.blink'),
    -- optional: provides snippets for the snippet source
    -- dependencies = 'rafamadriz/friendly-snippets',
  },
}
