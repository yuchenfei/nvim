return {
  { -- catppuccin
    'catppuccin/nvim',
    name = 'catppuccin',
    opts = require('config.ui.catppuccin'),
  },
  { -- mini.icons
    'echasnovski/mini.icons',
    opts = require('config.ui.mini-icons').opts,
    init = require('config.ui.mini-icons').init,
    specs = {
      { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
    },
  },
  { -- bufferline
    'akinsho/bufferline.nvim',
    lazy = true,
    event = 'VeryLazy',
    keys = require('config.keys').bufferline,
    opts = require('config.ui.bufferline'),
  },
  { -- statusline
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = require('config.ui.lualine'),
  },
  { -- noice: replaces the UI for messages, cmdline and the popupmenu.
    'folke/noice.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = require('config.ui.noice'),
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },
  { -- indent-blankline: add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    event = 'VeryLazy',
    main = 'ibl',
    opts = require('config.ui.indent-blankline'),
  },
  { -- mini.indentscope: visualize and work with indent scope
    'echasnovski/mini.indentscope',
    lazy = true,
    event = 'VeryLazy',
    opts = require('config.ui.mini-indentscope'),
  },
  { -- rainbow-delimiters
    'HiPhish/rainbow-delimiters.nvim',
    lazy = true,
    event = 'VeryLazy',
    main = 'rainbow-delimiters.setup',
    opts = require('config.ui.rainbow-delimiters'),
  },
}
