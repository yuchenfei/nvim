-- See `:help lua-guide-autocommands`

-- [[ Basic Autocommands ]]

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

-- [[ Plugin Autocommands ]]

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'help',
    'lazy',
    'mason',
    'neo-tree',
    'snacks_dashboard',
    'snacks_notif',
    'snacks_terminal',
    'snacks_win',
  },
  callback = function() vim.b.miniindentscope_disable = true end,
})
