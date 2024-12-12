-- https://github.com/nvim-neo-tree/neo-tree.nvim

return function()
  local icons = require('config.icons')
  local opts = {
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
        symbols = {
          -- Change type
          added = icons.git.added,
          modified = icons.git.modified,
          deleted = icons.git.deleted,
          renamed = icons.git.renamed,
          -- Status type
          untracked = icons.git.untracked,
          ignored = icons.git.ignored,
          unstaged = icons.git.unstaged,
          staged = icons.git.staged,
          conflict = icons.git.conflict,
        },
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
  }

  return opts
end
