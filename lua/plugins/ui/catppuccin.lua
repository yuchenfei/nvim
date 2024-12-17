-- https://github.com/catppuccin/nvim

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  ---@module 'catppuccin'
  ---@type CatppuccinOptions
  opts = {
    transparent_background = true,
    integrations = {
      blink_cmp = true,
      cmp = true,
      gitsigns = true,
      mason = true,
      mini = {
        enabled = true,
        indentscope_color = 'sky',
      },
      neotree = true,
      notify = true,
      telescope = true,
      treesitter = true,
      which_key = true,
    },
  },
  specs = {
    {
      'akinsho/bufferline.nvim',
      optional = true,
      opts = function(_, opts)
        if (vim.g.colors_name or ''):find('catppuccin') then
          opts.highlights = require('catppuccin.groups.integrations.bufferline').get()
        end
      end,
    },
  },
}
