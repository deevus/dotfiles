if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))

  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-db'
Plug 'vim-jp/syntax-vim-ex'
Plug 'tpope/vim-surround'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'PProvost/vim-ps1'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'styled-components/vim-styled-components', {'branch': 'main'}
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
Plug 'tpope/vim-obsession'
Plug 'stanangeloff/php.vim'
Plug 'vsushkov/vim-phpcs'
Plug 'SirVer/ultisnips'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
Plug 'jwalton512/vim-blade'
Plug 'tpope/vim-fugitive' " Adds git command
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'yegappan/grep'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-dispatch'
Plug 'godlygeek/tabular'
Plug 'Shougo/vimproc.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'mtth/scratch.vim'
Plug 'vim-scripts/Tail-Bundle'
Plug 'joonty/vim-do'
Plug 'tomasr/molokai'
Plug 'ayu-theme/ayu-vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'tomasiser/vim-code-dark'
Plug 'mhinz/vim-janah'
Plug 'liuchengxu/space-vim-dark'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal'
Plug 'chrisbra/Colorizer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'vim-vdebug/vdebug'
Plug 'kylef/apiblueprint.vim'
Plug 'yardnsm/vim-import-cost', {'do': {-> system('yarn')}}
Plug 'cormacrelf/vim-colors-github'
Plug 'cespare/vim-toml'

" Tags

Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

runtime _completion.vim

call plug#end()
