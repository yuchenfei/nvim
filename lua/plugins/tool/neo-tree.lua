-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
--
-- References:
-- - https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua
-- - https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/plugins/neo-tree.lua

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
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
  },
  opts = {
    close_if_last_window = true,
    source_selector = {
      winbar = false,
      content_layout = 'center',
      -- HACK: fix neo-tree source selector tab separator black bg
      -- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/integrations/neotree.lua
      highlight_separator = 'NeoTreeTabInactive',
      highlight_separator_active = 'NeoTreeTabInactive',
    },
    window = {
      mappings = {
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['<space>'] = 'none',
        ['[b'] = 'prev_source',
        [']b'] = 'next_source',
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      -- netrw disabled, opening a directory opens within the
      -- window like netrw would, regardless of window.position
      hijack_netrw_behavior = 'open_current',
      use_libuv_file_watcher = true,
    },
  },
  init = function()
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
  end,
}
