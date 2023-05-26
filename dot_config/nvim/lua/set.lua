-- options vim.api.nvim_set_option
vim.o.number = true
vim.o.background = 'dark'
vim.o.laststatus = 2 -- always show statusbar

vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.cache/nvim/undo"
vim.o.undofile = true

vim.go.t_Co = '256'
vim.o.hlsearch = true

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true
vim.o.autoindent = true

-- disable powerline as it is not working with neovim 0.5
vim.g.powerline_loaded = 1

if (vim.api.nvim_eval('has("multi_byte")')) then
  vim.o.encoding = 'utf-8'
  vim.g.fileencoding = 'utf-8'
  vim.g.fileencodings = 'ucs-bom,utf-8,latin1'
end

vim.o.termguicolors = true

vim.o.secure = true
vim.o.compatible = false

