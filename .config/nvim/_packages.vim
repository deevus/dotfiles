if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))

  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'scrooloose/nerdcommenter' " Comments
"Plug 'tpope/vim-dadbod' " Database connections
Plug 'tpope/vim-surround' " Quoting/surrounding text eg. csw'
Plug 'xolox/vim-misc' " Autoload vim scripts for xolox plugins
"Plug 'xolox/vim-shell' " :Fullscreen
"Plug 'tpope/vim-obsession' " Vim sessions - window positions, folds etc :mksession :Obsess
"Plug 'tobyS/vmustache' " Required by pdv
"Plug 'tobyS/pdv' " PHP Documentor
"Plug 'tpope/vim-fugitive' " Adds git command
Plug 'editorconfig/editorconfig-vim' " Editorconfig - Text editor config. Eg. indentation, tabs etc
"Plug 'mattn/emmet-vim' " Emmet for vim
Plug 'mhinz/vim-startify' " Start page for vim
Plug 'godlygeek/tabular' " Aligning text - really useful - :Tabu/=
Plug 'mtth/scratch.vim' " :Scratch pad
"Plug 'vim-scripts/Tail-Bundle' " tail -f inside vim
"Plug 'vim-vdebug/vdebug' " Multi lang debug client
"Plug 'yardnsm/vim-import-cost', {'do': 'yarn'} " JS: Lists import cost of npm imports

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color schemes
Plug 'tomasr/molokai'
Plug 'danilo-augusto/vim-afterglow'
Plug 'tomasiser/vim-code-dark'
Plug 'mhinz/vim-janah'
Plug 'liuchengxu/space-vim-dark'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal'
Plug 'cormacrelf/vim-colors-github' " Github colorscheme - great for diffs!
Plug 'ayu-theme/ayu-vim'
Plug 'yassinebridi/vim-purpura'

" Async
Plug 'joonty/vim-do' " Async shell commands
Plug 'tpope/vim-dispatch' " Background tasks - should use this
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " Async execution - Do I need this?

" Merging
Plug 'samoshkin/vim-mergetool' " Used with vim-colors-github for git merging/diffing

" Motions
Plug 'easymotion/vim-easymotion' " Vim motions - Need to use more

" Config
Plug 'MarcWeber/vim-addon-local-vimrc' " Loads .vimrc in project directory

" Linting
Plug 'vsushkov/vim-phpcs' " PHP

" Docs
Plug 'heavenshell/vim-jsdoc', {'tag': '1.0.0', 'do': 'yarn global add lehre'} " JSDoc
let g:jsdoc_lehre_path = 'lehre'

runtime _syntax.vim
runtime _completion.vim

call plug#end()
