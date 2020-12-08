local ts = require 'nvim-treesitter.configs'

ts.setup {
  ensure_installed = "all",

  highlight = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
  },

  indent = {
    enable = true,
  },
}
