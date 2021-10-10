local vim = vim
local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('i', '<c-j>', '<cmd>lua require"completion".nextSource()<CR>', opts)
vim.api.nvim_set_keymap('i', '<c-k>', '<cmd>lua require"completion".prevSource()<CR>', opts)
