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
"call minpac#add('xolox/vim-easytags') SLOW
call minpac#add('majutsushi/tagbar')
call minpac#add('grassdog/tagman.vim')
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

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#padawan#auto_update = 1

let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')
"let g:padawan#composer_command = 'composer'

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Show line numbers
set number

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

let g:jsx_ext_required = 0

set tags=./tags,./.git/tags,~/.vimtags

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" Theme
let g:tagman_auto_generate = 0

nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

" Search / completion
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'

" Status bar configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

" EditorConfig configuration
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_core_mode = "external_command"

" Startify
let g:startify_change_to_dir = 0

let g:pdv_template_dir = $HOME ."/.config/nvim/pack/minpac/start/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

packloadall

" Theme configuration
set background=dark
let g:airline_detect_paste = 1 " Show PASTE if in paste mode
let g:airline#extensions#tabline#enabled = 1 " Show airline for tabs too

" Always show statusbar
set laststatus=2

" Search configuration
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:phpcomplete_enhance_jump_to_definition = 1

if executable('pt')
    let g:ctrlp_user_command = 'pt %s -l --nocolor --global-gitignore --ignore=tags -g ""'
    let g:ctrlp_use_caching = 0
    set grepprg=pt\ --nogroup\ --nocolor\ --global-gitignore\ --ignore=tags
endif

" Key mapping
map <C-n> :NERDTreeTabsToggle<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_command = 'CtrlPMixed'

nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

" 256 colours
" colours
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
elseif !has("gui_running")
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif

set encoding=utf-8
set expandtab shiftwidth=4 tabstop=4

let os = substitute(system("uname"), "\n", "", "")
if (os == "Windows_NT")
    set shell=powershell.exe\ -noprofile\ -executionpolicy\ bypass\ -nologo

    " Fix bullshit that causes backspace to work like delete
    " Only happens in xterm mode
    inoremap <Char-0x07F> <BS>
    nnoremap <Char-0x07F> <BS>

    silent! colorscheme gruvbox
else
    silent! colorscheme wal
endif

" Autoindex
filetype indent on
set smartindent
autocmd BufRead,BufWritePre *.sh normal gg=G

" NERDTree configuration
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_console_startup = 0

" This callback will be executed when the entire command is completed
function! BackgroundCommandClose(channel)
  " Read the output from the command into the quickfix window
  execute "cfile! " . g:backgroundCommandOutput
  " Open the quickfix window
  copen
  unlet g:backgroundCommandOutput
endfunction

function! RunBackgroundCommand(command)
  " Make sure we're running VIM version 8 or higher.
  if v:version < 800
    echoerr 'RunBackgroundCommand requires VIM version 8 or higher'
    return
  endif

  if exists('g:backgroundCommandOutput')
    echo 'Already running task in background'
  else
    echo 'Running task in background'
    " Launch the job.
    " Notice that we're only capturing out, and not err here. This is because, for some reason, the callback
    " will not actually get hit if we write err out to the same file. Not sure if I'm doing this wrong or?
    let g:backgroundCommandOutput = tempname()
    call job_start(a:command, {'close_cb': 'BackgroundCommandClose', 'out_io': 'file', 'out_name': g:backgroundCommandOutput})
  endif
endfunction

" So we can use :BackgroundCommand to call our function.
command! -nargs=+ -complete=shellcmd RunBackgroundCommand call RunBackgroundCommand(<q-args>)

" Synastic
hi clear SignColumn
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:airline#extensions#ale#enabled = 1
let g:ale_php_langserver_use_global = 1
let g:ale_php_langserver_executable = globpath(&rtp,'vendor/felixfbecker/language-server/bin/php-language-server.php',1)
let g:ale_completion_enabled = 1

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" enable python 2
let g:loaded_python_provider=1
let g:vdebug_options.path_maps = {"/app": "/home/deevus/Projects/vimily/bonjoro"}
let g:vdebug_options.debug_file = "~/vdebug.log"

set nocompatible
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', ['.git/', '*~', 'node_modules/', 'vendor/'])
"nmap <C-P> :Denite file/rec buffer<CR>
