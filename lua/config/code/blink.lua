-- https://github.com/Saghen/blink.cmp
-- https://github.com/giuxtaposition/blink-cmp-copilot

return function()
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  local opts = {
    keymap = {
      preset = 'default',
      ['<C-l>'] = { 'show' },
      ['<C-e>'] = { 'hide' },
      ['<PageDown>'] = { 'scroll_documentation_down' },
      ['<PageUp>'] = { 'scroll_documentation_up' },
    },
    completion = {
      menu = {
        border = 'rounded',
      },
      documentation = {
        auto_show = true,
        window = {
          border = 'rounded',
        },
      },
    },
    signature = { enabled = true },
    sources = {
      -- default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'copilot' },
      completion = {
        enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'copilot' },
      },
      providers = {
        -- dont show LuaLS require statements when lazydev has items
        lsp = { fallback_for = { 'lazydev' } },
        lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink' },
        copilot = {
          name = 'copilot',
          module = 'blink-cmp-copilot',
        },
      },
      -- optionally disable cmdline completions
      -- cmdline = {},
    },
    appearance = {
      nerd_font_variant = 'mono', -- mono or normal
    },
  }
  return opts
end
