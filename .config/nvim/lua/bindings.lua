local vim = vim
local vimp = require('vimp')
local opts = { silent=true }

local telescope = require 'telescope.builtin'

vimp.nnoremap(opts, '<C-p>', function() 
  telescope.find_files()
end)

vimp.nnoremap(opts, '<leader>p', function() 
  telescope.find_files()
end)

vimp.nnoremap(opts, '<leader>g', function() 
  telescope.live_grep()
end)

vimp.nnoremap(opts, '<leader>b', function() 
  telescope.buffers()
end)

vimp.nnoremap(opts, '<leader>s', '<cmd>FzfPreviewBufferTags<cr>')
vimp.nnoremap(opts, '<leader>B', '<cmd>FzfPreviewAllBuffers<cr>')
vimp.nnoremap(opts, '<leader>l', '<cmd>FzfPreviewLines<cr>')
vimp.nnoremap(opts, '<leader>R', '<cmd>FzfPreviewProjectMruFiles<cr>')
vimp.nnoremap(opts, '<leader>q', '<cmd>FzfPreviewQuickFix<cr>')
vimp.nnoremap(opts, '<leader>r', '<cmd>set relativenumber!<cr>')
