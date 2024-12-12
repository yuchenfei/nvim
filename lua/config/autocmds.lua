-- See `:help lua-guide-autocommands`

-- [[ Basic Autocommands ]]

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Plugin Autocommands ]]

-- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
-- because `cwd` is not set up properly.
vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Start Neo-tree with directory',
  once = true,
  callback = function()
    if package.loaded['neo-tree'] then
      return
    else
      local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(0))
      if stats and stats.type == 'directory' then
        require('neo-tree')
      end
    end
  end,
})

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
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
