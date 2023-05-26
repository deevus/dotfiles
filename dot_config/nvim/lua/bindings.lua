local telescope = require 'telescope.builtin'
local extensions = require 'telescope'.extensions
local projects = extensions.projects

vim.keymap.set("n", "<C-p>", function()
  telescope.find_files()
end)

vim.keymap.set("n", '<C-o>', function() 
  projects.find_project_files()
end)

vim.keymap.set("n", '<leader>p', function() 
  telescope.find_files()
end)

vim.keymap.set("n", '<leader>g', function() 
  telescope.live_grep()
end)

vim.keymap.set("n", '<leader>b', function() 
  telescope.buffers()
end)

vim.keymap.set("n", '<leader>s', '<cmd>FzfPreviewBufferTags<cr>')
vim.keymap.set("n", '<leader>B', '<cmd>FzfPreviewAllBuffers<cr>')
vim.keymap.set("n", '<leader>l', '<cmd>FzfPreviewLines<cr>')
vim.keymap.set("n", '<leader>R', '<cmd>FzfPreviewProjectMruFiles<cr>')
vim.keymap.set("n", '<leader>q', '<cmd>FzfPreviewQuickFix<cr>')
vim.keymap.set("n", '<leader>r', '<cmd>set relativenumber!<cr>')

vim.keymap.set("n", '<Leader>ta', function()
  extensions.vstask.tasks()
end)
vim.keymap.set("n", '<Leader>ti', function()
  extensions.vstask.inputs()
end)
vim.keymap.set("n", '<Leader>th', function()
  extensions.vstask.history()
end)
vim.keymap.set("n", '<Leader>tl', function()
  extensions.vstask.launch()
end)
