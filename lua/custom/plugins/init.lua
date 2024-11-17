-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      allowed_dirs = { '~/dev/*/*', '~/.config/nvim/' },
      -- log_level = 'debug',
    },
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    keys = {
      { '-', ':Oil<CR>', desc = 'Open parent directory', silent = true },
    },
  },
  {
    'dmmulroy/ts-error-translator.nvim',
    config = function()
      require('ts-error-translator').setup {}
    end,
  },
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neo-tree/neo-tree.nvim',
    },
    config = function()
      require('lsp-file-operations').setup()
    end,
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
      'nvim-telescope/telescope.nvim', -- optional
      'isakbm/gitgraph.nvim',
    },
    config = function()
      require('neogit').setup {
        integrations = {
          diffview = true,
        },
      }
      -- So neogit will refresh buffers on branch change
      vim.o.autoread = true
      vim.api.nvim_create_autocmd('CursorHold', {
        pattern = '*',
        command = 'silent! checktime',
      })
    end,
    keys = {
      { '<leader>gg', '<cmd>Neogit<cr>', desc = '[G]it open Neo[G]it' },
    },
  },
  {
    'linrongbin16/gitlinker.nvim',
    cmd = 'GitLink',
    opts = {},
    keys = {
      { '<leader>gy', '<cmd>GitLink<cr>', mode = { 'n', 'v' }, desc = '[G]it [Y]ank link' },
      { '<leader>gY', '<cmd>GitLink!<cr>', mode = { 'n', 'v' }, desc = '[G]it Open link' },
    },
  },
  {
    'chrisgrieser/nvim-early-retirement',
    config = true,
    event = 'VeryLazy',
    opts = {
      retirementAgeMins = 120,
      minimumBufferNum = 10,
      deleteBufferWhenFileDeleted = true,
    },
  },
  {
    'https://github.com/nvim-treesitter/nvim-treesitter-context',
    config = function()
      vim.keymap.set('n', '[c', function()
        require('treesitter-context').go_to_context(vim.v.count1)
      end, { silent = true })
    end,
  },
  { 'sindrets/diffview.nvim', opts = { default_args = { DiffviewOpen = { '--imply-local' } } } },
  {
    'dundalek/parpar.nvim',
    dependencies = { 'gpanders/nvim-parinfer', 'julienvincent/nvim-paredit' },
    config = function()
      local paredit = require 'nvim-paredit'
      require('parpar').setup {
        paredit = {
          -- pass any nvim-paredit options here
          keys = {
            -- custom bindings are automatically wrapped
            ['<C-h>'] = { paredit.api.slurp_backwards, 'Slurp backwards' },
            ['<C-j>'] = { paredit.api.barf_backwards, 'Barf backwards' },
            ['<C-k>'] = { paredit.api.barf_forwards, 'Barf forwards' },
            ['<C-l>'] = { paredit.api.slurp_forwards, 'Slurp forwards' },
          },
        },
      }
    end,
  },
  {
    'Olical/conjure',
    config = function()
      -- Disable the documentation mapping
      vim.g['conjure#mapping#doc_word'] = false
      -- Rebind it from K to <prefix>ck
      vim.g['conjure#mapping#doc_word'] = 'ck'
      -- Rebind it from <prefix>gd to <prefix>cd
      vim.g['conjure#mapping#def_word'] = 'cD'
      -- Disable auto_require
      vim.g['conjure#client#clojure#nrepl#eval#auto_require'] = false
      -- Disable auto_repl for clojure
      vim.g['conjure#client#clojure#nrepl#connection#auto_repl#enabled'] = false
      -- Set fennel client to nfnl
      vim.g['conjure#filetype#fennel'] = 'conjure.client.fennel.nfnl'
    end,
  },
  {
    'Olical/nfnl',
    ft = 'fennel',
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
      vim.g.rainbow_delimiters = {
        highlight = {
          'RainbowDelimiterCyan',
          'RainbowDelimiterGreen',
          'RainbowDelimiterBlue',
          'RainbowDelimiterYellow',
          'RainbowDelimiterRed',
          'RainbowDelimiterViolet',
        },
      }
    end,
  },
}
