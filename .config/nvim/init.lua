require 'packages'
require 'lsp'

-- options vim.api.nvim_set_option
vim.o.number = true
vim.o.background = 'dark'
vim.o.laststatus = 2 -- always show statusbar
vim.o.backup = true
vim.go.t_Co = '256'
vim.o.hlsearch = true

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- disable powerline as it is not working with neovim 0.5
vim.g.powerline_loaded = 1

if (vim.api.nvim_eval('has("multi_byte")')) then
  vim.o.encoding = 'utf-8'
  vim.g.fileencoding = 'utf-8'
  vim.g.fileencodings = 'ucs-bom,utf-8,latin1'
end

vim.o.termguicolors = true

vim.api.nvim_exec([[
  " For all text files set 'textwidth' to 78 characters.
  autocmd filetype text setlocal textwidth=78

  filetype indent on
  filetype plugin on

  autocmd BufRead,BufWritePre *.sh normal gg=G

  colorscheme dracula

  setglobal autoindent smartindent
]], true)

if (vim.api.nvim_eval('&diff') > 0) then
  vim.api.nvim_exec([[ colorscheme github ]], true)
end

vim.o.compatible = false

-- global vars vim.api.nvim_set_var

vim.api.nvim_exec([[
  runtime _bindings.vim
]], true)

vim.o.secure = true

-- save/load folds automatically
vim.api.nvim_exec([[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* silent! mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
]], true)

-- undofile
vim.api.nvim_exec([[
  if !isdirectory($HOME."/.cache/nvim/undo")
      call mkdir($HOME."/.cache/nvim/undo", "-p", 0700)
  endif
  set undodir=~/.cache/nvim/undo
  set undofile
]], true)


require 'syntax'
require '_telescope'
require 'theme'
