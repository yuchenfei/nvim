local M = {}

---@param mode string|string[]?
---@return string|string[]
function M.parse_mode(mode)
  if not mode then
    return 'n'
  end
  if type(mode) == 'string' then
    return vim.split(mode, '') -- e.g., "in" -> {"i", "n"}
  end
  return mode -- Assume it's already in a valid table format
end

---@class KeymapDefinition
---@field [1] string # The left-hand side of the keymap (lhs, required).
---@field [2] string|fun() # The right-hand side of the keymap (rhs, optional).
---@field mode string|string[]? # The mode(s) in which the keymap applies (optional, defaults to "n").
---@field [string] any # Any additional options valid for vim.keymap.set.

---@param keymaps KeymapDefinition[] # List of keymap definitions.
function M.set_keymaps(keymaps, buffer)
  for _, map in ipairs(keymaps) do
    local lhs, rhs, mode, opts = nil, nil, nil, {}

    for k, v in pairs(map) do
      if type(k) == 'number' then
        if k == 1 then
          lhs = v -- First positional argument is lhs
        elseif k == 2 then
          rhs = v -- Second positional argument can be rhs
        end
      elseif k == 'mode' then
        mode = v -- Named argument for mode
      else
        opts[k] = v -- Other options
      end
    end

    mode = M.parse_mode(mode)

    if buffer then
      opts.buffer = buffer
    end

    ---@diagnostic disable-next-line: param-type-mismatch
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

return M
