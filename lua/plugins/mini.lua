-- Collection of various small independent plugins/modules
-- https://github.com/echasnovski/mini.nvim

return {
  'echasnovski/mini.nvim',
  specs = {
    { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
  },
  config = function()
    require('mini.bufremove').setup()

    require('mini.icons').setup()

    -- require('config.mini')
    -- Better Around/Inside textobjects
    --
    -- - va)  - [V]isually select [A]round [)]paren
    -- - yinq - [Y]ank [I]nside [N]ext [Q]uote
    -- - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup({ n_lines = 500 })

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()
  end,
  init = function()
    -- Mocking methods of 'nvim-tree/nvim-web-devicons' for better integrations with plugins outside 'mini.nvim'.
    -- See :h MiniIcons.mock_nvim_web_devicons().
    package.preload['nvim-web-devicons'] = function()
      require('mini.icons').mock_nvim_web_devicons()
      return package.loaded['nvim-web-devicons']
    end
  end,
}
