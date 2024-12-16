-- https://github.com/lukas-reineke/indent-blankline.nvim
-- See `:help ibl`

return function()
  ---@module 'ibl
  ---@type ibl.config
  local opts = {
    indent = { char = '│' },
    scope = { enabled = false },
  }
  return opts
end
