packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('tpope/vim-db')
call minpac#add('vim-jp/syntax-vim-ex')
call minpac#add('tpope/vim-surround')
call minpac#add('othree/yajs.vim')
call minpac#add('othree/javascript-libraries-syntax.vim')
call minpac#add('PProvost/vim-ps1')
call minpac#add('w0rp/ale')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('Quramy/tsuquyomi')
call minpac#add('styled-components/vim-styled-components')
call minpac#add('hail2u/vim-css3-syntax')
call minpac#add('mxw/vim-jsx')
call minpac#add('xolox/vim-misc')
call minpac#add('xolox/vim-shell')
call minpac#add('tpope/vim-obsession')
call minpac#add('stanangeloff/php.vim')
call minpac#add('lvht/phpcd.vim', {'do': {-> system('composer install')}})
call minpac#add('roxma/LanguageServer-php-neovim', {'do': {-> system('composer install && composer run-script parse-stubs')}})
call minpac#add('vsushkov/vim-phpcs')
call minpac#add('Shougo/deoplete.nvim', {'do': 'UpdateRemotePlugins'})
"call minpac#add('padawan-php/padawan.vim') PHPCD better
"call minpac#add('padawan-php/deoplete-padawan', {'do': {-> system('composer install')}})
call minpac#add('SirVer/ultisnips')
call minpac#add('tobyS/vmustache')
call minpac#add('tobyS/pdv')
call minpac#add('jwalton512/vim-blade')
call minpac#add('tpope/vim-fugitive') " Adds git commands
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('scrooloose/nerdtree') " File browser
call minpac#add('jistr/vim-nerdtree-tabs')
call minpac#add('xuyuanp/nerdtree-git-plugin')
call minpac#add('mattn/emmet-vim')
call minpac#add('yegappan/grep')
call minpac#add('mhinz/vim-startify')
call minpac#add('tpope/vim-dispatch')
call minpac#add('godlygeek/tabular')
call minpac#add('Shougo/vimproc.vim')
call minpac#add('Shougo/unite.vim')
call minpac#add('ajh17/VimCompletesMe')
call minpac#add('mtth/scratch.vim')
call minpac#add('vim-scripts/Tail-Bundle')
call minpac#add('joonty/vim-do')
call minpac#add('tomasr/molokai')
call minpac#add('ayu-theme/ayu-vim')
call minpac#add('danilo-augusto/vim-afterglow')
call minpac#add('tomasiser/vim-code-dark')
call minpac#add('mhinz/vim-janah')
call minpac#add('liuchengxu/space-vim-dark')
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('morhetz/gruvbox')
call minpac#add('dylanaraps/wal')
call minpac#add('chrisbra/Colorizer')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('FelikZ/ctrlp-py-matcher')
call minpac#add('ivalkeen/vim-ctrlp-tjump')
call minpac#add('vim-vdebug/vdebug')
call minpac#add('kylef/apiblueprint.vim')
call minpac#add('Shougo/denite.nvim')
call minpac#add('yardnsm/vim-import-cost', {'do': {-> system('yarn')}})
call minpac#add('cormacrelf/vim-colors-github')
call minpac#add('zxqfl/tabnine-vim')

" Tags

"call minpac#add('xolox/vim-easytags') SLOW
call minpac#add('majutsushi/tagbar')
"call minpac#add('grassdog/tagman.vim')
call minpac#add('ludovicchabant/vim-gutentags')