return {
  { -- Add indentation guides even on blank lines
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    main = 'ibl', -- See `:help ibl`
    opts = {
      indent = { char = '│' },
      scope = { enabled = false },
    },
  },
  { -- Visualize and work with indent scope
    -- https://github.com/echasnovski/mini.indentscope
    --
    -- - ii/ia - object scope
    -- - [i/]i - jump to respective border line
    'echasnovski/mini.indentscope',
    event = 'VeryLazy',
    opts = {
      symbol = '│',
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'lazy',
          'mason',
          'neo-tree',
          'snacks_dashboard',
          'snacks_notif',
          'snacks_terminal',
          'snacks_win',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
