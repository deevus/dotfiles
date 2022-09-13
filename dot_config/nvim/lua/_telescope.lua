require('telescope').setup{
    defaults = {
      file_ignore_patterns = {
        "%.*~$",
      }
    },

    previews = {
      treesitter = false,
    },
}

require('telescope').load_extension('fzf')
