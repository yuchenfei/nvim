-- Better Around/Inside textobjects
-- https://github.com/echasnovski/mini.ai
--
-- See :h MiniAi-textobject-builtin
-- - va)  - [V]isually select [A]round [)]paren
-- - yinq - [Y]ank [I]nside [N]ext [Q]uote
-- - ci'  - [C]hange [I]nside [']quote

local M = {}

M.plugin = {
  'echasnovski/mini.ai',
  event = 'VeryLazy',
  opts = function()
    local MiniAi = require('mini.ai')
    return {
      -- Number of lines within which textobject is searched
      n_lines = 500,
      custom_textobjects = {
        f = MiniAi.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }), -- function
        c = MiniAi.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }), -- class
        e = { -- Word with case
          { '%u[%l%d]+%f[^%l%d]', '%f[%S][%l%d]+%f[^%l%d]', '%f[%P][%l%d]+%f[^%l%d]', '^[%l%d]+%f[^%l%d]' },
          '^().*()$',
        },
        o = MiniAi.gen_spec.treesitter({ -- code block
          a = { '@block.outer', '@conditional.outer', '@loop.outer' },
          i = { '@block.inner', '@conditional.inner', '@loop.inner' },
        }),
        u = MiniAi.gen_spec.function_call(), -- u for "Usage"
        U = MiniAi.gen_spec.function_call({ name_pattern = '[%w_]' }), -- without dot in function name
      },
    }
  end,
  config = function(_, opts)
    require('mini.ai').setup(opts)
    vim.schedule(function() M.register_mini_ai_whichkey() end)
  end,
}

function M.register_mini_ai_whichkey()
  -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/mini.lua
  -- https://github.com/folke/which-key.nvim/blob/main/lua/which-key/plugins/presets.lua
  local objects = {
    -- Brackets
    { '(', desc = '() block' },
    { ')', desc = '() block with ws' },
    { '[', desc = '[] block' },
    { ']', desc = '[] block with ws' },
    { '{', desc = '{} block' },
    { '}', desc = '{} block with ws' },
    { '<', desc = '<> block' },
    { '>', desc = '<> block with ws' },
    { 'b', desc = ')]} block' },
    -- Quotes
    { '"', desc = '" string' },
    { "'", desc = "' string" },
    { '`', desc = '` string' },
    { 'q', desc = 'quote "\'`' },
    -- User prompt
    { '?', desc = 'user prompt' },
    -- Other
    { ' ', desc = 'whitespace' },
    { '_', desc = 'underscore' },
    -- Code
    { 'a', desc = 'argument' },
    { 'c', desc = 'class' },
    { 'e', desc = 'CamelCase / snake_case' },
    { 'f', desc = 'function' },
    { 'i', desc = 'indent' }, -- mini.indentscope
    { 'o', desc = 'block, conditional, loop' },
    { 't', desc = 'tag' },
    { 'u', desc = 'use/call' },
    { 'U', desc = 'use/call without dot' },
  }

  local ret = { mode = { 'o', 'x' } }
  ---@type table<string, string>
  local mappings = vim.tbl_extend('force', {}, {
    around = 'a',
    inside = 'i',
    around_next = 'an',
    inside_next = 'in',
    around_last = 'al',
    inside_last = 'il',
  })
  mappings.goto_left = nil
  mappings.goto_right = nil

  for name, prefix in pairs(mappings) do
    name = name:gsub('^around_', ''):gsub('^inside_', '')
    ret[#ret + 1] = { prefix, group = name }
    for _, obj in ipairs(objects) do
      local desc = obj.desc
      if prefix:sub(1, 1) == 'i' then
        desc = desc:gsub(' with ws', '')
      end
      ret[#ret + 1] = { prefix .. obj[1], desc = obj.desc }
    end
  end
  require('which-key').add(ret, { notify = false })
end

return M.plugin
