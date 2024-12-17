-- a completion plugin with support for LSPs and external sources
-- https://github.com/Saghen/blink.cmp
-- https://github.com/giuxtaposition/blink-cmp-copilot

return {
  'saghen/blink.cmp',
  version = 'v0.*',
  event = 'InsertEnter',
  dependencies = {
    'giuxtaposition/blink-cmp-copilot',
    -- optional: provides snippets for the snippet source
    -- 'rafamadriz/friendly-snippets'
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
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
        draw = {
          treesitter = { 'lsp' },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = 'rounded',
        },
      },
      ghost_text = {
        enabled = true,
      },
    },
    signature = { enabled = true },
    sources = {
      -- latest version config
      default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'copilot' },
      completion = {
        enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'copilot' },
      },
      providers = {
        -- dont show LuaLS require statements when lazydev has items
        lsp = { fallback_for = { 'lazydev' } },
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
        copilot = {
          name = 'copilot',
          module = 'blink-cmp-copilot',
          async = true,
          score_offset = 100,
        },
      },
      -- optionally disable cmdline completions
      cmdline = {},
    },
    appearance = {
      nerd_font_variant = 'mono', -- mono or normal
    },
  },
}
