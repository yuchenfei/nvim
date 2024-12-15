local M = {}

--[[
  See `:help lspconfig-all` for a list of all the pre-configured LSPs
  Add any additional override configuration in the following tables. Available keys are:
  - cmd (table): Override the default command used to start the server
  - filetypes (table): Override the default list of associated filetypes for the server
  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
  - settings (table): Override the default settings passed when initializing the server.
    - For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
--]]
M.servers = {
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
}

function M.setup()
  -- setup keymaps
  M.on_lsp_attach(function(client, buffer)
    require('config.keys').lsp(client, buffer)
  end)

  M.config_diagnostic_signs()

  local servers = M.servers
  local capabilities = vim.tbl_deep_extend(
    'force',
    vim.lsp.protocol.make_client_capabilities(),
    require('cmp_nvim_lsp').default_capabilities()
  )

  local ensure_installed = vim.tbl_keys(servers or {})
  require('mason-lspconfig').setup({
    ensure_installed = ensure_installed,
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        -- This handles overriding only values explicitly passed
        -- by the server configuration above. Useful when disabling
        -- certain features of an LSP (for example, turning off formatting for ts_ls)
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        require('lspconfig')[server_name].setup(server)
      end,
    },
  })
end

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

return M
