return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'nvim-neotest/neotest-jest',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'marilari88/neotest-vitest',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-jest' {},
        require 'neotest-vitest' {},
      },
    }
  end,
  keys = {
    { '<leader>n', '', desc = '+test' },
    {
      '<leader>nt',
      function() require('neotest').run.run(vim.fn.expand '%') end,
      desc = 'Run File',
    },
    {
      '<leader>nT',
      function() require('neotest').run.run(vim.uv.cwd()) end,
      desc = 'Run All Test Files',
    },
    {
      '<leader>nr',
      function() require('neotest').run.run() end,
      desc = 'Run Nearest',
    },
    {
      '<leader>ndr',
      function() require('neotest').run.run { strategy = 'dap' } end,
      desc = '[D]ebug Nea[r]est',
    },
    {
      '<leader>nl',
      function() require('neotest').run.run_last() end,
      desc = 'Run Last',
    },
    {
      '<leader>ndl',
      function() require('neotest').run.run_last { strategy = 'dap' } end,
      desc = '[D]ebug [L]ast',
    },
    {
      '<leader>ns',
      function() require('neotest').summary.toggle() end,
      desc = 'Toggle Summary',
    },
    {
      '<leader>no',
      function() require('neotest').output.open { enter = true, auto_close = true } end,
      desc = 'Show Output',
    },
    {
      '<leader>nO',
      function() require('neotest').output_panel.toggle() end,
      desc = 'Toggle Output Panel',
    },
    {
      '<leader>nS',
      function() require('neotest').run.stop() end,
      desc = 'Stop',
    },
    {
      '<leader>nw',
      function() require('neotest').watch.toggle(vim.fn.expand '%') end,
      desc = 'Toggle Watch',
    },
  },
}
