local previewers = require('telescope.previewers');

require('telescope').setup{
    previews = {
      treesitter = false,
    },
}

require('telescope').load_extension('fzf')
