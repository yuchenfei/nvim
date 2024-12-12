-- https://github.com/lukas-reineke/indent-blankline.nvim
-- See `:help ibl`
---@module 'ibl

return function()
  ---@type ibl.config
  local opts = {
    indent = { char = '│' },
    scope = { enabled = false },
  }
  return opts
end
