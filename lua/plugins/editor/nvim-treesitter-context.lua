-- https://github.com/nvim-treesitter/nvim-treesitter-context

return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'VeryLazy',
  opts = function()
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
    return {
      max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
    }
  end,
}
