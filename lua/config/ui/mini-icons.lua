-- https://github.com/echasnovski/mini.icons

local M = {}

M.opts = function()
  return {
    style = 'glyph',
  }
end

M.init = function()
  -- See :h MiniIcons.mock_nvim_web_devicons().
  package.preload['nvim-web-devicons'] = function()
    require('mini.icons').mock_nvim_web_devicons()
    return package.loaded['nvim-web-devicons']
  end
end

return M
