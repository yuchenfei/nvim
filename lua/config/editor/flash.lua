-- https://github.com/folke/flash.nvim
---@module 'flash'

return function()
  ---@type Flash.Config
  local opts = {
    labels = 'asdfghjklqwertyuiopzxcvbnm',
    label = {
      rainbow = {
        enabled = true,
      },
    },
    modes = {
      search = {
        enabled = true,
      },
    },
  }
  return opts
end
