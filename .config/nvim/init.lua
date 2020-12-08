local vim = vim;

require 'packages'
require 'lsp'

-- options vim.api.nvim_set_option
vim.o.number = true
vim.o.background = 'dark'
vim.o.laststatus = 2 -- always show statusbar
vim.o.backup = true
vim.o.t_Co = '256'
vim.o.hlsearch = true

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

if (vim.api.nvim_eval('has("multi_byte")')) then
  vim.o.encoding = 'utf-8'
  vim.g.fileencoding = 'utf-8'
  vim.g.fileencodings = 'ucs-bom,utf-8,latin1'
end

vim.o.termguicolors = true

vim.o.autoindent = true
vim.o.smartindent = true

vim.api.nvim_exec([[
  " For all text files set 'textwidth' to 78 characters.
  autocmd filetype text setlocal textwidth=78

  filetype indent on
  filetype plugin on

  autocmd BufRead,BufWritePre *.sh normal gg=G

  colorscheme embark
]], true)

vim.o.compatible = false

-- global vars vim.api.nvim_set_var

vim.api.nvim_exec([[
  runtime _bindings.vim
]], true)

vim.o.secure = true

require 'syntax'
