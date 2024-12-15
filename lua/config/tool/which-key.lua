-- https://github.com/folke/which-key.nvim
---@module 'which-key'

return function()
  ---@type wk.Config
  local opts = {
    -- Document existing key chains
    spec = {
      { '<leader>q', group = 'Quit/Session' },
      { '<leader>t', group = 'Toggle' },
      -- better descriptions
      { 'gx', desc = 'Open with system app' },
    },
    triggers = {
      { '<auto>', mode = 'nixsotc' },
    },
    sort = { 'order', 'group', 'alphanum', 'mod' },
    icons = {
      group = '',
    },
  }
  return opts
end
