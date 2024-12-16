-- https://github.com/Saghen/blink.cmp

return function()
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  local opts = {
    keymap = {
      preset = 'default',
      ['<C-l>'] = { 'show' },
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
      default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
      providers = {
        -- dont show LuaLS require statements when lazydev has items
        lsp = { fallback_for = { 'lazydev' } },
        lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink' },
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
