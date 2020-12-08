local vim = vim;
local util = require 'util'

if (not util.path.exists('~/.local/share/nvim/site/pack/paqs')) then
  local cmd = io.popen('sh', 'w')

  local script = ([[
    git clone https://github.com/savq/paq-nvim.git ~/.local/share/nvim/site/pack/paqs/start/paq-nvim
  ]])

  cmd:write(script)
  cmd:close()
end

local paq = require 'paq-nvim'.paq

paq 'savq/paq-nvim'

paq 'scrooloose/nerdcommenter' -- Comments
paq 'tpope/vim-surround' -- Quoting/surrounding text eg. csw'
paq 'xolox/vim-misc' -- Autoload vim scripts for xolox plugins
paq 'tpope/vim-fugitive' -- Adds git command
paq 'editorconfig/editorconfig-vim' -- Editorconfig - Text editor config. Eg. indentation, tabs etc
paq 'mhinz/vim-startify' -- Start page for vim
vim.api.nvim_set_var('startify_change_to_dir', false)

paq 'godlygeek/tabular' -- Aligning text - really useful - :Tabu/=
paq 'mtth/scratch.vim' -- :Scratch pad

-- Status line
paq 'vim-airline/vim-airline'
paq 'vim-airline/vim-airline-themes'

-- Color schemes
paq 'tomasr/molokai'
paq 'danilo-augusto/vim-afterglow'
paq 'tomasiser/vim-code-dark'
paq 'mhinz/vim-janah'
paq 'liuchengxu/space-vim-dark'
paq 'altercation/vim-colors-solarized'
paq 'morhetz/gruvbox'
paq 'dylanaraps/wal'
paq 'cormacrelf/vim-colors-github' -- Github colorscheme - great for diffs!
paq 'ayu-theme/ayu-vim'
paq 'yassinebridi/vim-purpura'
paq 'skbolton/embark'

-- Async
paq 'joonty/vim-do' -- Async shell commands
paq 'tpope/vim-dispatch' -- Background tasks - should use this
paq 'Shougo/vimproc.vim' -- Async execution - Do I need this?

-- Merging
paq 'samoshkin/vim-mergetool' -- Used with vim-colors-github for git merging/diffing

-- Motions
paq 'easymotion/vim-easymotion' -- Vim motions - Need to use more

-- Config
paq 'MarcWeber/vim-addon-local-vimrc' -- Loads .vimrc in project directory

-- Linting
paq 'vsushkov/vim-phpcs' -- PHP

-- Docs
paq {'heavenshell/vim-jsdoc', branch='1.0.0'} -- JSDoc
vim.api.nvim_set_var('jsdoc_lehre_path', 'lehre')

-- Utils
paq 'danro/rename.vim'

-- Syntax --
paq 'nvim-treesitter/nvim-treesitter'

-- """""""""""""" VIM """"""""""""""""
paq 'vim-jp/syntax-vim-ex' -- Vimscript

-- """""""""""""" PHP """"""""""""""""
paq 'stanangeloff/php.vim' -- PHP
paq 'jwalton512/vim-blade' -- PHP blade

-- """""""""""""" JS """"""""""""""""
paq 'pangloss/vim-javascript'
paq 'MaxMEllon/vim-jsx-pretty' -- JSX/React

-- """""""""""""" TS """"""""""""""""
--paq 'leafgarland/typescript-vim' -- Typescript
--paq 'jason0x43/vim-js-indent'

-- """""""""""""" OTHER """"""""""""""""
paq 'PProvost/vim-ps1' -- Powershell
paq 'hail2u/vim-css3-syntax' -- CSS3
paq 'kylef/apiblueprint.vim' -- API Blueprint
paq 'cespare/vim-toml' -- toml
paq 'keith/swift.vim' -- Swift
paq 'sheerun/vim-polyglot'

vim.api.nvim_exec([[
  autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
]], true)

-- Completion --
paq 'neovim/nvim-lspconfig'
paq 'junegunn/fzf' -- Fuzzy find files

paq 'yuki-ycino/fzf-preview.vim'

paq 'bogado/file-line' -- Used in fzf-preview for opening a file to a specific line
paq 'haorenW1025/completion-nvim'

vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'
