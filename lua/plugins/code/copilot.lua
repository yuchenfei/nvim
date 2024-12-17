-- pure lua replacement for github/copilot.vim.
-- https://github.com/zbirenbaum/copilot.lua

return {
  'zbirenbaum/copilot.lua',
  build = ':Copilot auth',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    panel = { enabled = false },
    suggestion = { enabled = false },
    filetypes = {
      markdown = true,
    },
  },
}
