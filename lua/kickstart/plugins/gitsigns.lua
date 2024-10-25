-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Toggles
        map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = '[G]it toggle show [b]lame line' })
        map('n', '<leader>gD', gitsigns.toggle_deleted, { desc = '[G]it toggle show [D]eleted' })
      end,
    },
  },
}
