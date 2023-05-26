if (vim.api.nvim_eval('&diff') > 0) then
  vim.cmd.colorscheme("github")
else
  vim.cmd.colorscheme("dracula")
end
