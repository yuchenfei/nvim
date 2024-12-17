local M = {}

function M.setup()
  local map = require('util.keymap').set_keymaps
  local wk = require('which-key')

  M.basic_mappings(map, wk)
  M.window_mappings(map, wk)
  M.buffer_mappings(map, wk)
  M.git_mappings(map, wk)
end

---@param map function
---@param wk wk
function M.basic_mappings(map, wk)
  map({
    -- Better up/down
    { 'j', mode = 'nx', "v:count == 0 ? 'gj' : 'j'", desc = 'Down', expr = true, silent = true },
    { 'k', mode = 'nx', "v:count == 0 ? 'gk' : 'k'", desc = 'Up', expr = true, silent = true },
    -- Clear search with <esc>
    { '<esc>', mode = 'ni', '<cmd>noh<cr><esc>', desc = 'Escape and Clear hlsearch' },
    -- Save file
    { '<C-s>', mode = 'nixs', '<cmd>w<cr><esc>', desc = 'Save File' },
    -- Quit
    { '<leader>qq', '<cmd>qa<cr>', desc = 'Quit All' },
  })

  wk.add({ '<leader>p', group = 'Packages', icon = { icon = require('config.icons').ui.package } })
  map({
    { '<leader>pm', function() require('mason.ui').open() end, desc = 'Mason' },
    { '<leader>pl', function() require('lazy').home() end, desc = 'Lazy' },
  })

  -- Diagnostic keymaps
  -- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
end

---@param map function
---@param wk wk
function M.window_mappings(map, wk)
  wk.add({
    '<leader>w',
    group = 'Windows',
    proxy = '<c-w>',
    expand = function() return require('which-key.extras').expand.win() end,
  })
  map({
    -- { '<leader>wd', '<C-w>c', desc = 'Delete a window', remap = true },
    -- See `:help wincmd` for a list of all window commands
    -- Move to window using the <ctrl> hjkl keys
    { '<C-h>', '<C-w>h', desc = 'Go to the Left Window', remap = true },
    { '<C-j>', '<C-w>j', desc = 'Go to the Down Window', remap = true },
    { '<C-k>', '<C-w>k', desc = 'Go to the Up Window', remap = true },
    { '<C-l>', '<C-w>l', desc = 'Go to the Right Window', remap = true },
    -- Resize window using <ctrl> arrow keys
    { '<C-Up>', '<cmd>resize +2<cr>', desc = 'Incrase Height' },
    { '<C-Down>', '<cmd>resize -2<cr>', desc = 'Decrease Height' },
    { '<C-Left>', '<cmd>vertical resize -2<cr>', desc = 'Decrease Width' },
    { '<C-Right>', '<cmd>vertical resize +2<cr>', desc = 'Increase Width' },
  })
end

---@param map function
---@param wk wk
function M.buffer_mappings(map, wk)
  wk.add({
    '<leader>b',
    group = 'Buffer',
    expand = function() return require('which-key.extras').expand.buf() end,
  })
  map({
    { '<leader>`', '<cmd>e #<cr>', desc = 'Switch Buffers' },
    { '<leader>c', function() Snacks.bufdelete() end, desc = 'Close a Buffer' },
    { '<leader>bb', '<cmd>e #<cr>', desc = 'Switch Buffers' },
    { '<leader>bc', function() Snacks.bufdelete() end, desc = 'Close a Buffer' },
    { '<leader>bo', function() Snacks.bufdelete.other() end, desc = 'Close all Other Buffers' },
    -- NOTE: replaced by bufferline
    -- { '<leader>bD', '<cmd>:bd<cr>', desc = 'Delete Buffer and Window' },
    -- { '<S-h>', '<cmd>bprevious<cr>', desc = 'Prev Buffer' },
    -- { '<S-l>', '<cmd>bnext<cr>', desc = 'Next Buffer' },
    -- { '[b', '<cmd>bprevious<cr>', desc = 'Prev Buffer' },
    -- { ']b', '<cmd>bnext<cr>', desc = 'Next Buffer' },
  })
end
M.bufferline = {
  { '<leader>bB', '<Cmd>BufferLinePick<CR>', desc = 'Pick a Buffer' },
  { '<leader>bC', '<Cmd>BufferLinePickClose<CR>', desc = 'Close a Buffer (Pick)' },
  { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
  { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Close Non-Pinned Buffers' },
  { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Close Buffers to the Right' },
  { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Close Buffers to the Left' },
  { '<leader>bs', '<Cmd>BufferLineSortByExtension<CR>', desc = 'Sort by Extension' },
  { '<leader>bS', '<Cmd>BufferLineSortByDirectory<CR>', desc = 'Sort by Directory' },
  { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous Buffer' },
  { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous Buffer' },
  { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Move Buffer Prev' },
  { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Move Buffer Next' },
}

---@param map function
---@param wk wk
function M.git_mappings(map, wk)
  wk.add({ '<leader>g', group = 'Git', mode = { 'n', 'v' } })
  if vim.fn.executable('lazygit') == 1 then
    map({
      { '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
      { '<leader>gh', function() Snacks.lazygit.log() end, desc = 'Lazygit Log (cwd)' },
      { '<leader>gH', function() Snacks.lazygit.log_file() end, desc = 'Lazygit Log (current file)' },
    })
  end
  map({
    { '<leader>gl', function() Snacks.git.blame_line() end, desc = 'Git Blame Line' },
    { '<leader>gx', mode = 'nx', function() Snacks.gitbrowse() end, desc = 'Git Browse' },
  })
end
M.gitsigns = function(bufnr)
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

M.lsp = function(client, buffer)
  require('which-key').add({ '<leader>l', group = 'LSP/Code', mode = { 'n', 'v' } })
  local keys = {
    { 'gd', require('telescope.builtin').lsp_definitions, desc = 'Goto Definition' },
    { 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
    { 'gr', require('telescope.builtin').lsp_references, desc = 'Goto References' },
    { 'gI', require('telescope.builtin').lsp_implementations, desc = 'Goto Implementation' },
    { 'gy', require('telescope.builtin').lsp_type_definitions, desc = 'Goto Type Definition' },
    { '<leader>la', mode = 'nx', vim.lsp.buf.code_action, desc = 'Code Action' },
    { '<leader>lr', vim.lsp.buf.rename, desc = 'Rename' },
    { '<leader>ls', require('telescope.builtin').lsp_document_symbols, desc = 'Symbols (document)' },
    { '<leader>lS', require('telescope.builtin').lsp_dynamic_workspace_symbols, desc = 'Symbols (workspace)' },
  }
  require('util.keymap').set_keymaps(keys, buffer)
end
M.conform = {
  {
    '<leader>lf',
    function() require('conform').format({ async = true, lsp_format = 'fallback' }) end,
    mode = '',
    desc = 'Format',
  },
}

M.flash = {
  { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
  { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
  { 'c', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
  { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
  { '<leader>ts', mode = { 'n' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
}

M.todocomments = {
  { ']t', function() require('todo-comments').jump_next() end, desc = 'Next Todo Comment' },
  { '[t', function() require('todo-comments').jump_prev() end, desc = 'Previous Todo Comment' },
  { '<leader>st', '<cmd>TodoTelescope<cr>', desc = 'Search Todos' },
}

M.neotree = {
  { '<leader>e', '<cmd>Neotree toggle<CR>', desc = 'Toggle Explorer' },
  {
    '<leader>be',
    function() require('neo-tree.command').execute({ source = 'buffers', toggle = true }) end,
    desc = 'Buffer Explorer',
  },
  {
    '<leader>ge',
    function() require('neo-tree.command').execute({ source = 'git_status', toggle = true }) end,
    desc = 'Git Explorer',
  },
}

M.telescope = function()
  require('which-key').add({
    { '<leader>f', group = 'Find' },
    { '<leader>s', group = 'Search' },
  })
  local builtin = require('telescope.builtin')
  local keys = {
    -- Shortcut
    -- { '<leader><leader>', builtin.find_files, desc = 'Find Files' },
    { '<leader><leader>', builtin.buffers, desc = 'Search Open Buffers' },
    -- File Pickers
    { '<leader>ff', builtin.find_files, desc = 'Find Files' },
    { '<leader>fg', builtin.live_grep, desc = 'Find by Grep' },
    { '<leader>fw', builtin.grep_string, desc = 'Find Current Word' },
    { '<leader>fr', builtin.oldfiles, desc = 'Find Recent Files' },
    { '<leader>fb', builtin.current_buffer_fuzzy_find, desc = 'Find in Buffer' },
    {
      '<leader>fn',
      function() builtin.find_files({ cwd = vim.fn.stdpath('config') }) end,
      desc = 'Find Neovim Config',
    },
    -- builtin.git_files

    -- Vim Pickers
    { '<leader>sb', builtin.buffers, desc = 'Search Open Buffers' },
    { '<leader>sc', builtin.command_history, desc = 'Search Command History' },
    { '<leader>sC', builtin.commands, desc = 'Search Commands' },
    { '<leader>sR', builtin.search_history, desc = 'Search History' },
    { '<leader>sh', builtin.help_tags, desc = 'Search Help' },
    { '<leader>sm', builtin.marks, desc = 'Search Marks' },
    { '<leader>sM', builtin.man_pages, desc = 'Search Manpages' },
    { '<leader>sT', builtin.colorscheme, desc = 'Search Themes' },
    { '<leader>sq', builtin.quickfix, desc = 'Search Quickfix' },
    { '<leader>sl', builtin.loclist, desc = 'Search Location List' },
    { '<leader>sj', builtin.jumplist, desc = 'Search Jump List' },
    { '<leader>so', builtin.vim_options, desc = 'Search Vim Options' },
    { '<leader>sa', builtin.autocommands, desc = 'Search Autocommands' },
    { '<leader>sk', builtin.keymaps, desc = 'Search Keymaps' },
    { '<leader>sf', builtin.filetypes, desc = 'Search Filetypes' },
    { '<leader>sH', builtin.highlights, desc = 'Search Highlights' },
    { '<leader>sr', builtin.resume, desc = 'Search Resume' },
    -- builtin.tags
    -- builtin.quickfixhistory
    -- builtin.registers
    -- builtin.spell_suggest
    -- builtin.current_buffer_tags
    -- builtin.pickers

    -- Neovim LSP Pickers
    { '<leader>sd', '<cmd>Telescope diagnostics bufnr=0<cr>', desc = 'Diagnostics (current buffer)' },
    { '<leader>sD', builtin.diagnostics, desc = 'Diagnostics (all buffers)' },
    -- See lsp config
    -- builtin.lsp_incoming_calls
    -- builtin.lsp_outgoing_calls
    -- builtin.lsp_workspace_symbols

    -- Git Pickers
    { '<leader>gb', builtin.git_branches, desc = 'Git Branches' },
    { '<leader>gc', builtin.git_commits, desc = 'Git Commits' },
    { '<leader>gC', builtin.git_bcommits, desc = 'Git Commits (current file)' },
    { '<leader>gi', builtin.git_status, desc = 'Git Status' },
    -- builtin.git_stash

    -- Other
    { '<leader>sB', builtin.builtin, desc = 'Telescope builtin' },
    -- builtin.treesitter
    -- builtin.planets
    -- builtin.reloader
    -- builtin.symbols
  }
  require('util.keymap').set_keymaps(keys)

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

M.copilotchat = {
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
}

return M
