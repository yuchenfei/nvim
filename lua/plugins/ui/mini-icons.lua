-- https://github.com/echasnovski/mini.icons

return {
  'echasnovski/mini.icons',
  lazy = true,
  specs = {
    { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
  },
  config = function()
    require('mini.icons').setup()
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
