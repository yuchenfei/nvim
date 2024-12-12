-- https://github.com/catppuccin/nvim
---@module 'catppuccin'

return function()
  ---@type CatppuccinOptions
  local opts = {
    transparent_background = true,
    integrations = {
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
  }
  return opts
end
