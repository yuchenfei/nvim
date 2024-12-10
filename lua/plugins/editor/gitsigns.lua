-- Adds git related signs to the gutter, as well as utilities for managing changes
-- See `:help gitsigns` to understand what the configuration keys do
-- https://github.com/lewis6991/gitsigns.nvim

return {
  'lewis6991/gitsigns.nvim',
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
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']h', function()
        if vim.wo.diff then
          vim.cmd.normal({ ']h', bang = true })
        else
          gitsigns.nav_hunk('next')
        end
      end, { desc = 'Next Git Hunk' })

      map('n', '[h', function()
        if vim.wo.diff then
          vim.cmd.normal({ '[h', bang = true })
        else
          gitsigns.nav_hunk('prev')
        end
      end, { desc = 'Previous Git Hunk' })

      -- Actions
      -- stylua: ignore start
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
    end,
  },
}
