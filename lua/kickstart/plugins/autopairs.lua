-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {
        enable_check_bracket_line = false,
        ignored_next_char = '',
      }
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      local Rule = require 'nvim-autopairs.rule'
      local cond = require 'nvim-autopairs.conds'
      local npairs = require 'nvim-autopairs'
      npairs.get_rules("'")[1].not_filetypes = { 'clojure', 'fennel', 'scheme', 'lisp', 'ocaml', 'ml' }
      npairs.add_rule(Rule('<', '>', {
        -- if you use nvim-ts-autotag, you may want to exclude these filetypes from this rule
        -- so that it doesn't conflict with nvim-ts-autotag
        '-html',
        '-javascriptreact',
        '-typescriptreact',
      }):with_pair(
        -- regex will make it so that it will auto-pair on
        -- `a<` but not `a <`
        -- The `:?:?` part makes it also
        -- work on Rust generics like `some_func::<T>()`
        cond.before_regex('%a+:?:?$', 3)
      ):with_move(function(opts)
        return opts.char == '>'
      end))
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          ['html'] = {
            enable_close = false,
          },
        },
      }
    end,
  },
}
