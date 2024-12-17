-- Main LSP Configuration

local M = {}

function M.config_keymaps(client, buffer)
  local mappings = {
    { 'gd', require('telescope.builtin').lsp_definitions, desc = 'Goto Definition' },
    { 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
    { 'gr', require('telescope.builtin').lsp_references, desc = 'Goto References' },
    { 'gI', require('telescope.builtin').lsp_implementations, desc = 'Goto Implementation' },
    { 'gy', require('telescope.builtin').lsp_type_definitions, desc = 'Goto Type Definition' },
    { '<leader>la', mode = 'nx', vim.lsp.buf.code_action, desc = 'Code Action' },
    { '<leader>lr', vim.lsp.buf.rename, desc = 'Rename' },
    { '<leader>ls', require('telescope.builtin').lsp_document_symbols, desc = 'Symbols (document)' },
    { '<leader>lS', require('telescope.builtin').lsp_dynamic_workspace_symbols, desc = 'Symbols (workspace)' },
  }
  require('util.keymap').set_keymaps(mappings, buffer)
end

M.plugin = {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    { 'williamboman/mason.nvim' },
    -- bridge mason with the lspconfig
    'williamboman/mason-lspconfig.nvim',
    'saghen/blink.cmp',
  },
  opts = {
    -- See `:help lspconfig-all` for a list of all the pre-configured LSPs
    -- Add any additional override configuration in the following tables. Available keys are:
    -- - cmd (table): Override the default command used to start the server
    -- - filetypes (table): Override the default list of associated filetypes for the server
    -- - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
    -- - settings (table): Override the default settings passed when initializing the server.
    --   - For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    },
  },
  config = function(_, opts)
    M.on_lsp_attach(function(client, buffer) M.config_keymaps(client, buffer) end)
    M.config_diagnostic_signs()

    require('mason').setup()
    require('mason-lspconfig').setup()

    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      require('lspconfig')[server].setup(config)
    end
  end,
}

-- Change diagnostic symbols in the sign column (gutter)
function M.config_diagnostic_signs()
  local icons = require('config.icons')
  local signs = {
    ERROR = icons.diagnostics.error,
    WARN = icons.diagnostics.warn,
    INFO = icons.diagnostics.info,
    HINT = icons.diagnostics.hint,
  }
  local diagnostic_signs = {}
  for type, icon in pairs(signs) do
    diagnostic_signs[vim.diagnostic.severity[type]] = icon
  end
  vim.diagnostic.config({ signs = { text = diagnostic_signs } })
end

---@param on_attach fun(client:vim.lsp.Client, buffer)
---@param name? string
function M.on_lsp_attach(on_attach, name)
  return vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('config', {}),
    callback = function(args)
      local buffer = args.buf ---@type number
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and (not name or client.name == name) then
        return on_attach(client, buffer)
      end
    end,
  })
end

return M.plugin
