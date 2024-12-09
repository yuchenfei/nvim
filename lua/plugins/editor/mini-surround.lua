-- Add/delete/replace surroundings (brackets, quotes, etc.)
-- https://github.com/echasnovski/mini.surround
--
-- - gzaiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - gzd'   - [S]urround [D]elete [']quotes
-- - gzr)'  - [S]urround [R]eplace [)] [']

local prefix = 'gz'
return {
  'echasnovski/mini.surround',
  opts = {
    mappings = {
      add = prefix .. 'a', -- Add surrounding in Normal and Visual modes
      delete = prefix .. 'd', -- Delete surrounding
      find = prefix .. 'f', -- Find surrounding (to the right)
      find_left = prefix .. 'F', -- Find surrounding (to the left)
      highlight = prefix .. 'h', -- Highlight surrounding
      replace = prefix .. 'r', -- Replace surrounding
      update_n_lines = prefix .. 'n', -- Update `n_lines`
    },
  },
}
