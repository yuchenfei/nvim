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

M.lsp = function(client, buffer)
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = buffer, desc = 'LSP: ' .. desc })
  end

  map('gd', require('telescope.builtin').lsp_definitions, 'Goto Definition') -- To jump back, press <C-t>.
  map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
  map('gr', require('telescope.builtin').lsp_references, 'Goto References')
  map('gI', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
  map('gy', require('telescope.builtin').lsp_type_definitions, 'Goto Type Definition')

  map('<leader>la', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })
  map('<leader>lr', vim.lsp.buf.rename, 'Rename')
  map('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
  map('<leader>lS', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
end

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

-- stylua: ignore
M.todocomments = {
  { ']t', function() require('todo-comments').jump_next() end, desc = 'Next todo comment' },
  { '[t', function() require('todo-comments').jump_prev() end, desc = 'Previous todo comment' },
  { '<leader>st', '<cmd>TodoTelescope<cr>', desc = 'Search Todos' }
}

M.telescope = function()
  local builtin = require('telescope.builtin')
  -- Shortcut
  vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Find Files' })

  -- File Pickers
  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find by Grep' })
  vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Find Current Word' })
  vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find Recent Files' })
  vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = 'Find in Current Buffer' })
  vim.keymap.set('n', '<leader>fn', function()
    builtin.find_files({ cwd = vim.fn.stdpath('config') })
  end, { desc = 'Find Neovim Config' })
  -- builtin.git_files

  -- Vim Pickers
  vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Search Open Buffers' })
  vim.keymap.set('n', '<leader>sc', builtin.command_history, { desc = 'Search Command History' })
  vim.keymap.set('n', '<leader>sC', builtin.commands, { desc = 'Search Commands' })
  vim.keymap.set('n', '<leader>sR', builtin.search_history, { desc = 'Search History' })
  vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help' })
  vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = 'Search Marks' })
  vim.keymap.set('n', '<leader>sM', builtin.man_pages, { desc = 'Search Manpages' })
  vim.keymap.set('n', '<leader>sT', builtin.colorscheme, { desc = 'Search Themes' })
  vim.keymap.set('n', '<leader>sq', builtin.quickfix, { desc = 'Search Quickfix' })
  vim.keymap.set('n', '<leader>sl', builtin.loclist, { desc = 'Search Location List' })
  vim.keymap.set('n', '<leader>sj', builtin.jumplist, { desc = 'Search Jump List' })
  vim.keymap.set('n', '<leader>so', builtin.vim_options, { desc = 'Search Vim Options' })
  vim.keymap.set('n', '<leader>sa', builtin.autocommands, { desc = 'Search Autocommands' })
  vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search Keymaps' })
  vim.keymap.set('n', '<leader>sf', builtin.filetypes, { desc = 'Search Filetypes' })
  vim.keymap.set('n', '<leader>sH', builtin.highlights, { desc = 'Search Highlights' })
  vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search Resume' })
  -- builtin.tags
  -- builtin.quickfixhistory
  -- builtin.registers
  -- builtin.spell_suggest
  -- builtin.current_buffer_tags
  -- builtin.pickers

  -- Neovim LSP Pickers
  vim.keymap.set('n', '<leader>sd', '<cmd>Telescope diagnostics bufnr=0<cr>', { desc = 'Diagnostics (current buffer)' })
  vim.keymap.set('n', '<leader>sD', builtin.diagnostics, { desc = 'Diagnostics (all buffers)' })
  -- See lsp config
  -- builtin.lsp_incoming_calls
  -- builtin.lsp_outgoing_calls
  -- builtin.lsp_workspace_symbols

  -- Git Pickers
  vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git Branches' })
  vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git Commits' })
  vim.keymap.set('n', '<leader>gC', builtin.git_bcommits, { desc = 'Git Commits (current file)' })
  vim.keymap.set('n', '<leader>gi', builtin.git_status, { desc = 'Git Status' })
  -- builtin.git_stash

  -- Other
  vim.keymap.set('n', '<leader>sB', builtin.builtin, { desc = 'Search Telescope Builtin' })
  -- builtin.treesitter
  -- builtin.planets
  -- builtin.reloader
  -- builtin.symbols

  -- Slightly advanced example of overriding default behavior and theme
  -- vim.keymap.set('n', '<leader>/', function()
  --   -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  --   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
  --     winblend = 10,
  --     previewer = false,
  --   }))
  -- end, { desc = '[/] Fuzzily search in current buffer' })

  -- It's also possible to pass additional configuration options.
  --  See `:help telescope.builtin.live_grep()` for information about particular keys
  -- vim.keymap.set('n', '<leader>s/', function()
  --   builtin.live_grep({
  --     grep_open_files = true,
  --     prompt_title = 'Live Grep in Open Files',
  --   })
  -- end, { desc = '[S]earch [/] in Open Files' })
end

return M
