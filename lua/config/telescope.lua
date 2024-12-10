-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup({
  pickers = {
    colorscheme = {
      enable_preview = true,
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
})

-- Enable Telescope extensions if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

-- See `:help telescope.builtin`
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
vim.keymap.set('n', '<leader>st', builtin.colorscheme, { desc = 'Search Themes' })
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
-- builtin.lsp_references
-- builtin.lsp_incoming_calls
-- builtin.lsp_outgoing_calls
-- builtin.lsp_document_symbols
-- builtin.lsp_workspace_symbols
-- builtin.lsp_dynamic_workspace_symbols
-- builtin.lsp_implementations
-- builtin.lsp_definitions
-- builtin.lsp_type_definitions

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
