-- https://github.com/CopilotC-Nvim/CopilotChat.nvim

return {
  'CopilotC-Nvim/CopilotChat.nvim',
  cmd = 'CopilotChat',
  dependencies = {
    { 'zbirenbaum/copilot.lua' },
    { 'nvim-lua/plenary.nvim' },
  },
  keys = {
    { '<leader>a', desc = 'AI', mode = { 'n', 'v' } },
    { '<leader>aa', mode = { 'n', 'v' }, function() require('CopilotChat').toggle() end, desc = 'Toggle Copilot Chat' },
    { '<leader>ar', mode = { 'n', 'v' }, function() require('CopilotChat').reset() end, desc = 'Reset Copilot Chat' },
    {
      '<leader>aq',
      mode = { 'n', 'v' },
      function()
        local input = vim.fn.input('Quick Chat: ')
        if input ~= '' then
          require('CopilotChat').ask(input)
        end
      end,
      desc = 'Quick Chat',
    },
  },
  opts = {},
}
