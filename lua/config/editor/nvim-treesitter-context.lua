-- https://github.com/nvim-treesitter/nvim-treesitter-context

return function()
  local tsc = require('treesitter-context')
  Snacks.toggle({
    name = 'Treesitter Context',
    get = tsc.enabled,
    set = function(state)
      if state then
        tsc.enable()
      else
        tsc.disable()
      end
    end,
  }):map('<leader>tc')
  local opts = {
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
  }
  return opts
end
