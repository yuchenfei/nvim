-- https://github.com/catppuccin/nvim

return function()
  ---@module 'catppuccin'
  ---@type CatppuccinOptions
  local opts = {
    transparent_background = true,
    integrations = {
      blink_cmp = true,
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
