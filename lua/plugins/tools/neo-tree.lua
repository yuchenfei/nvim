-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua

local icons = require('config.icons')
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  cmd = 'Neotree',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    { '<leader>e', '<Cmd>Neotree toggle<CR>', desc = 'Toggle Explorer' },
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
  },
  init = function()
    -- HACK: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
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
  opts = {
    close_if_last_window = false,
    source_selector = {
      winbar = false,
      content_layout = 'center',
      -- HACK: fix neo-tree source selector tab separator black bg
      -- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/integrations/neotree.lua
      highlight_separator = 'NeoTreeTabInactive',
      highlight_separator_active = 'NeoTreeTabInactive',
    },
    default_component_configs = {
      modified = { symbol = icons.file.modified },
      git_status = {
        symbols = require('config.icons').git,
      },
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
  config = function(_, opts)
    local function on_move(data) Snacks.rename.on_rename_file(data.source, data.destination) end
    local events = require('neo-tree.events')
    opts.event_handlers = opts.event_handlers or {}
    vim.list_extend(opts.event_handlers, {
      { event = events.FILE_MOVED, handler = on_move },
      { event = events.FILE_RENAMED, handler = on_move },
    })
    require('neo-tree').setup(opts)
  end,
}
