local mark = require'harpoon.mark'
local ui = require'harpoon.ui'

vim.keymap.set("n", "<leader>ha", function ()
  mark.add_file()
end)

vim.keymap.set("n", "<leader>hd", function ()
  mark.rm_file()
end)

vim.keymap.set("n", "<leader>hh", function ()
  ui.toggle_quick_menu()
end)

vim.keymap.set("n", "<leader>hn", function ()
  ui.nav_next()
end)

vim.keymap.set("n", "<leader>hp", function ()
  ui.nav_prev()
end)
