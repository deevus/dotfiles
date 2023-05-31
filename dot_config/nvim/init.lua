require 'packages'
require 'lsp'
require 'set'

local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufRead", "BufWritePre"}, {
    pattern = {"*.sh"},
    command = "normal gg=G"
})

autocmd({"filetype"}, {
    pattern = {"text"},
    command = "setlocal textwidth=78"
})

-- save/load folds automatically
vim.api.nvim_exec([[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* silent! mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
]], true)

require 'bindings'
require '_telescope'
require 'neovide'
require 'colors'
