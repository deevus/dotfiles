let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

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

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

" Show line numbers
set number

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

set packpath^=~/.vim
packadd minpac

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.

" Syntax
call minpac#add('vim-jp/syntax-vim-ex')
call minpac#add('tpope/vim-surround')

" PHP
call minpac#add('stanangeloff/php.vim')
call minpac#add('shawncplus/phpcomplete.vim')
call minpac#add('padawan-php/padawan.vim')
call minpac#add('vsushkov/vim-phpcs')

" Source control
call minpac#add('tpope/vim-fugitive') " Adds git commands

" Misc
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('scrooloose/nerdtree') " File browser
call minpac#add('xuyuanp/nerdtree-git-plugin')
call minpac#add('mattn/emmet-vim')
call minpac#add('yegappan/grep')
call minpac#add('mhinz/vim-startify')
call minpac#add('tpope/vim-dispatch')
call minpac#add('godlygeek/tabular')
call minpac#add('Shougo/vimproc.vim')
call minpac#add('Shougo/unite.vim')
call minpac#add('Valloric/YouCompleteMe')
call minpac#add('ajh17/VimCompletesMe')

" Theme
call minpac#add('tomasr/molokai')
call minpac#add('ayu-theme/ayu-vim')
call minpac#add('danilo-augusto/vim-afterglow')
call minpac#add('tomasiser/vim-code-dark')
call minpac#add('mhinz/vim-janah')

" Status bar
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

" Search
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('FelikZ/ctrlp-py-matcher')

" Search / completion
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.php =
\ ['->', '::', '(', 'use ', 'namespace ', '\']
let g:padawan#composer_command = "composer"
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'

" Status bar configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" EditorConfig configuration
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_core_mode = "external_command"

packloadall

" Theme configuration
colorscheme janah
" let g:airline_theme='light'

" Search configuration
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:phpcomplete_enhance_jump_to_definition = 0

" Key mapping
map <C-n> :NERDTreeToggle<CR>
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
endif

" Autoindex
filetype indent on
set smartindent
autocmd BufRead,BufWritePre *.sh normal gg=G

" NERDTree configuration
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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
