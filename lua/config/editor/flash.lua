-- https://github.com/folke/flash.nvim

return function()
  ---@module 'flash'
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
        enabled = false,
      },
    },
  }
  return opts
end
