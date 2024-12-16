-- https://github.com/zbirenbaum/copilot.lua

return function()
  local opts = {
    panel = { enabled = false },
    suggestion = { enabled = false },
    filetypes = {
      markdown = true,
    },
  }
  return opts
end
