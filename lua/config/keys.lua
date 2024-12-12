local M = {}

M.neotree = {
  { '<leader>e', '<cmd>Neotree toggle<CR>', desc = 'Toggle Explorer' },
  {
    '<leader>be',
    function()
      require('neo-tree.command').execute({ source = 'buffers', toggle = true })
    end,
    desc = 'Buffer Explorer',
  },
  {
    '<leader>ge',
    function()
      require('neo-tree.command').execute({ source = 'git_status', toggle = true })
    end,
    desc = 'Git Explorer',
  },
}

M.bufferline = {
  { '<leader>bb', '<Cmd>BufferLinePick<CR>', desc = 'Pick Buffer' },
  { '<leader>bd', '<Cmd>BufferLinePickClose<CR>', desc = 'Close Buffer from Tabline' },
  { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
  { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Close Non-Pinned Buffers' },
  { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Close Buffers to the Right' },
  { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Close Buffers to the Left' },
  { '<leader>bE', '<Cmd>BufferLineSortByExtension<CR>', desc = 'Sort by Extension' },
  { '<leader>bD', '<Cmd>BufferLineSortByDirectory<CR>', desc = 'Sort by Directory' },
  { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
  { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
  { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer prev' },
  { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer next' },
}

-- stylua: ignore
M.flash = {
  { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
  { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
  { 'c', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
  { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
  { '<leader>ts', mode = { 'n' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
}

M.gitsigns = function(bufnr)
  local gitsigns = require('gitsigns')
  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end
  -- stylua: ignore start
  -- Navigation
  map('n', ']h', function()
    if vim.wo.diff then vim.cmd.normal({ ']h', bang = true }) else gitsigns.nav_hunk('next') end
  end, { desc = 'Next Git Hunk' })
  map('n', '[h', function()
    if vim.wo.diff then vim.cmd.normal({ '[h', bang = true }) else gitsigns.nav_hunk('prev') end
  end, { desc = 'Previous Git Hunk' })
  -- Actions
  map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Stage Hunk' })
  map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Reset Hunk' })
  map('v', '<leader>gs', function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { desc = 'Stage Hunk' })
  map('v', '<leader>gr', function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { desc = 'Reset Hunk' })
  map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'Undo Stage Hunk' })
  map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Preview Hunk' })
  map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Stage Buffer' })
  map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Reset Buffer' })
  map('n', '<leader>gL', function() gitsigns.blame_line({ full = true }) end, { desc = 'Git Blame Line (full)' })
  map('n', '<leader>gB', function() gitsigns.blame() end, { desc = 'Git Blame Buffer' })
  map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Diff This' })
  map('n', '<leader>gD', function() gitsigns.diffthis('~') end, { desc = 'Diff This ~' })
  -- Toggles
  map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle show Git Blame Line' })
  map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = 'Toggle Show Git Deleted' })
  -- stylua: ignore end
end

return M
