-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- https://github.com/nvim-telescope/telescope-ui-select.nvim

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  cmd = 'Telescope',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function() return vim.fn.executable('make') == 1 end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  keys = {
    -- Shortcut
    -- { '<leader><leader>', builtin.find_files, desc = 'Find Files' },
    { '<leader><leader>', '<Cmd>Telescope buffers<CR>', desc = 'Buffers' },
    -- File Pickers
    { '<leader>ff', '<Cmd>Telescope find_files<CR>', desc = 'Find Files' },
    { '<leader>fg', '<Cmd>Telescope live_grep<CR>', desc = 'Find by Grep' },
    { '<leader>fw', '<Cmd>Telescope grep_string<CR>', desc = 'Find Current Word' },
    { '<leader>fr', '<Cmd>Telescope oldfiles<CR>', desc = 'Find Recent Files' },
    { '<leader>fb', '<Cmd>Telescope current_buffer_fuzzy_find<CR>', desc = 'Find in Buffer' },
    {
      '<leader>fn',
      function() require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') }) end,
      desc = 'Find Neovim Config',
    },
    -- builtin.git_files

    -- Vim Pickers
    { '<leader>sb', '<Cmd>Telescope buffers<CR>', desc = 'Search Open Buffers' },
    { '<leader>sc', '<Cmd>Telescope command_history<CR>', desc = 'Search Command History' },
    { '<leader>sC', '<Cmd>Telescope commands<CR>', desc = 'Search Commands' },
    { '<leader>sR', '<Cmd>Telescope search_history<CR>', desc = 'Search History' },
    { '<leader>sh', '<Cmd>Telescope help_tags<CR>', desc = 'Search Help' },
    { '<leader>sm', '<Cmd>Telescope marks<CR>', desc = 'Search Marks' },
    { '<leader>sM', '<Cmd>Telescope man_pages<CR>', desc = 'Search Manpages' },
    { '<leader>sT', '<Cmd>Telescope colorscheme<CR>', desc = 'Search Themes' },
    { '<leader>sq', '<Cmd>Telescope quickfix<CR>', desc = 'Search Quickfix' },
    { '<leader>sl', '<Cmd>Telescope loclist<CR>', desc = 'Search Location List' },
    { '<leader>sj', '<Cmd>Telescope jumplist<CR>', desc = 'Search Jump List' },
    { '<leader>so', '<Cmd>Telescope vim_options<CR>', desc = 'Search Vim Options' },
    { '<leader>sa', '<Cmd>Telescope autocommands<CR>', desc = 'Search Autocommands' },
    { '<leader>sk', '<Cmd>Telescope keymaps<CR>', desc = 'Search Keymaps' },
    { '<leader>sf', '<Cmd>Telescope filetypes<CR>', desc = 'Search Filetypes' },
    { '<leader>sH', '<Cmd>Telescope highlights<CR>', desc = 'Search Highlights' },
    { '<leader>sr', '<Cmd>Telescope resume<CR>', desc = 'Search Resume' },
    -- builtin.tags
    -- builtin.quickfixhistory
    -- builtin.registers
    -- builtin.spell_suggest
    -- builtin.current_buffer_tags
    -- builtin.pickers

    -- Neovim LSP Pickers
    { '<leader>sd', '<Cmd>Telescope diagnostics bufnr=0<CR>', desc = 'Diagnostics (current buffer)' },
    { '<leader>sD', '<Cmd>diagnostics<CR>', desc = 'Diagnostics (all buffers)' },
    -- See lsp config
    -- builtin.lsp_incoming_calls
    -- builtin.lsp_outgoing_calls
    -- builtin.lsp_workspace_symbols

    -- Git Pickers
    { '<leader>gb', '<Cmd>Telescope git_branches<CR>', desc = 'Git Branches' },
    { '<leader>gc', '<Cmd>Telescope git_commits<CR>', desc = 'Git Commits' },
    { '<leader>gC', '<Cmd>Telescope git_bcommits<CR>', desc = 'Git Commits (current file)' },
    { '<leader>gi', '<Cmd>Telescope git_status<CR>', desc = 'Git Status' },
    -- builtin.git_stash

    -- Other
    { '<leader>sB', '<Cmd>Telescope builtin<CR>', desc = 'Telescope Builtin' },
    -- builtin.treesitter
    -- builtin.planets
    -- builtin.reloader
    -- builtin.symbols
  },
  opts = {
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
  },
  config = function(_, opts)
    require('telescope').setup(opts)

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}

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
