-- References:
-- - https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
-- - https://github.com/ayamir/nvimdots/blob/main/lua/core/options.lua
-- - https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- - https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/plugins/_astrocore_options.lua

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]

vim.opt.breakindent = true -- Enable break indent
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.foldenable = true
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = 'expr'
vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.inccommand = 'split' -- Preview substitutions live, as you type!
vim.opt.laststatus = 3 -- Global statusline
vim.opt.list = true -- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.number = true -- Make line numbers default
vim.opt.relativenumber = true -- You can also add relative line numbers, to help with jumping.
vim.opt.scrolloff = 5 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line
vim.opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true -- Configure how new splits should be opened
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time. Displays which-key popup sooner
vim.opt.undofile = true -- Save undo history
vim.opt.updatetime = 250 -- Decrease update time

-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus' -- Sync with system clipboard
end)
