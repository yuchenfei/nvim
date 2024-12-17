local map = require('util.keymap').set_keymaps

map({
  -- Better up/down
  { 'j', mode = 'nx', "v:count == 0 ? 'gj' : 'j'", desc = 'Down', expr = true, silent = true },
  { 'k', mode = 'nx', "v:count == 0 ? 'gk' : 'k'", desc = 'Up', expr = true, silent = true },

  -- See `:help wincmd` for a list of all window commands
  -- Move to window using the <ctrl> hjkl keys
  { '<C-h>', '<C-w>h', desc = 'Go to the Left Window', remap = true },
  { '<C-j>', '<C-w>j', desc = 'Go to the Down Window', remap = true },
  { '<C-k>', '<C-w>k', desc = 'Go to the Up Window', remap = true },
  { '<C-l>', '<C-w>l', desc = 'Go to the Right Window', remap = true },

  -- Resize window using <ctrl> arrow keys
  { '<C-Up>', '<Cmd>resize +2<CR>', desc = 'Incrase Height' },
  { '<C-Down>', '<Cmd>resize -2<CR>', desc = 'Decrease Height' },
  { '<C-Left>', '<Cmd>vertical resize -2<CR>', desc = 'Decrease Width' },
  { '<C-Right>', '<Cmd>vertical resize +2<CR>', desc = 'Increase Width' },

  -- Buffers
  { '<leader>`', '<Cmd>e #<CR>', desc = 'Switch Buffers' },
  { '<leader>c', function() Snacks.bufdelete() end, desc = 'Close a Buffer' },
  { '<leader>bb', '<Cmd>e #<CR>', desc = 'Switch Buffers' },
  { '<leader>bc', function() Snacks.bufdelete() end, desc = 'Close a Buffer' },
  { '<leader>bo', function() Snacks.bufdelete.other() end, desc = 'Close all Other Buffers' },
  -- NOTE: replaced by bufferline
  -- { '<leader>bD', '<Cmd>:bd<CR>', desc = 'Delete Buffer and Window' },
  -- { '<S-h>', '<Cmd>bprevious<CR>', desc = 'Prev Buffer' },
  -- { '<S-l>', '<Cmd>bnext<CR>', desc = 'Next Buffer' },
  -- { '[b', '<Cmd>bprevious<CR>', desc = 'Prev Buffer' },
  -- { ']b', '<Cmd>bnext<CR>', desc = 'Next Buffer' },

  -- Clear search with <Esc>
  { '<Esc>', mode = 'ni', '<Cmd>noh<CR><Esc>', desc = 'Escape and Clear hlsearch' },

  -- Save file
  { '<C-s>', mode = 'nixs', '<Cmd>w<CR><Esc>', desc = 'Save File' },

  -- Quit
  { '<leader>qq', '<Cmd>qa<CR>', desc = 'Quit All' },

  -- Packages
  { '<leader>pm', function() require('mason.ui').open() end, desc = 'Mason' },
  { '<leader>pl', function() require('lazy').home() end, desc = 'Lazy' },

  -- Git
  { '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
  { '<leader>gh', function() Snacks.lazygit.log() end, desc = 'Lazygit Log (cwd)' },
  { '<leader>gH', function() Snacks.lazygit.log_file() end, desc = 'Lazygit Log (current file)' },
  { '<leader>gl', function() Snacks.git.blame_line() end, desc = 'Git Blame Line' },
  { '<leader>gx', mode = 'nx', function() Snacks.gitbrowse() end, desc = 'Git Browse' },

  -- Diagnostic keymaps
  -- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
})
