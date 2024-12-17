-- https://github.com/echasnovski/mini.icons

return {
  'echasnovski/mini.icons',
  specs = {
    { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
  },
  init = function()
    -- See :h MiniIcons.mock_nvim_web_devicons().
    package.preload['nvim-web-devicons'] = function()
      require('mini.icons').mock_nvim_web_devicons()
      return package.loaded['nvim-web-devicons']
    end
  end,
  opts = {
    style = 'glyph',
  },
}
