local ts = require 'nvim-treesitter.configs'


ts.setup {
  ensure_installed = "all",

  highlight = {
    enable = true,
    disable = {"php"}
  },

  incremental_selection = {
    enable = true,
  },

  indent = {
    enable = false,
  },
}

require'treesitter-context'.setup{}
