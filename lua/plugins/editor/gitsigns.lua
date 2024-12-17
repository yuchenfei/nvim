-- Adds git related signs to the gutter, as well as utilities for managing changes
-- https://github.com/lewis6991/gitsigns.nvim

local M = {}

function M.on_attach(bufnr)
  local gitsigns = require('gitsigns')
  local keys = {
    {
      ']h',
      function()
        if vim.wo.diff then
          vim.cmd.normal({ ']h', bang = true })
        else
          gitsigns.nav_hunk('next')
        end
      end,
      desc = 'Next Git Hunk',
    },
    {
      '[h',
      function()
        if vim.wo.diff then
          vim.cmd.normal({ '[h', bang = true })
        else
          gitsigns.nav_hunk('prev')
        end
      end,
      desc = 'Previous Git Hunk',
    },
    -- Actions
    { '<leader>gs', gitsigns.stage_hunk, desc = 'Stage Hunk' },
    { '<leader>gr', gitsigns.reset_hunk, desc = 'Reset Hunk' },
    {
      '<leader>gs',
      mode = 'v',
      function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end,
      desc = 'Stage Hunk',
    },
    {
      '<leader>gr',
      mode = 'v',
      function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end,
      desc = 'Reset Hunk',
    },
    { '<leader>gu', gitsigns.undo_stage_hunk, desc = 'Undo Stage Hunk' },
    { '<leader>gp', gitsigns.preview_hunk, desc = 'Preview Hunk' },
    { '<leader>gS', gitsigns.stage_buffer, desc = 'Stage Buffer' },
    { '<leader>gR', gitsigns.reset_buffer, desc = 'Reset Buffer' },
    { '<leader>gL', function() gitsigns.blame_line({ full = true }) end, desc = 'Git Blame Line (full)' },
    { '<leader>gB', function() gitsigns.blame() end, desc = 'Git Blame Buffer' },
    { '<leader>gd', gitsigns.diffthis, desc = 'Diff this' },
    { '<leader>gD', function() gitsigns.diffthis('~') end, desc = 'Diff this ~' },
    -- Toggles
    { '<leader>tb', gitsigns.toggle_current_line_blame, desc = 'Toggle Show Git Blame Line' },
    { '<leader>tD', gitsigns.toggle_deleted, desc = 'Toggle Show Git Deleted' },
  }
  require('util.keymap').set_keymaps(keys)
end

return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  ---@module 'gitsigns'
  ---@type Gitsigns.Config
  opts = {
    signs = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    current_line_blame = true,
    on_attach = M.on_attach,
  },
}
