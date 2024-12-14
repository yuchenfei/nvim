return {
  { -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    lazy = true,
    event = 'VeryLazy',
    config = require('config.code.lsp').setup,
    dependencies = {
      -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
      { 'williamboman/mason.nvim', opts = {} },
      -- bridge mason with the lspconfig
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
  },
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        { path = 'snacks.nvim',        words = { 'Snacks' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
}
