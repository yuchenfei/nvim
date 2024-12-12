-- https://github.com/echasnovski/mini.ai
--
-- - va)  - [V]isually select [A]round [)]paren
-- - yinq - [Y]ank [I]nside [N]ext [Q]uote
-- - ci'  - [C]hange [I]nside [']quote

return function()
  local opts = {
    -- Number of lines within which textobject is searched
    n_lines = 500,
  }
  return opts
end
