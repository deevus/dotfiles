set exrc

runtime _packages.vim

let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')

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

  set autoindent " always set autoindenting on

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

let g:jsx_ext_required = 0

set tags=./tags,./.git/tags,~/.vimtags

" Status bar configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

" EditorConfig configuration
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Startify
let g:startify_change_to_dir = 0

let g:pdv_template_dir = $HOME ."/.config/nvim/plugged/pdv/templates_snip"

" Theme configuration
set background=dark
let g:airline_detect_paste = 1 " Show PASTE if in paste mode
let g:airline#extensions#tabline#enabled = 1 " Show airline for tabs too

" Always show statusbar
set laststatus=2

" 256 colours
" colours
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
elseif !has("gui_running")
    " set term=xterm
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
    silent! set termguicolors
    silent! colorscheme embark
endif

" Autoindex
filetype indent on
filetype plugin on
set smartindent
autocmd BufRead,BufWritePre *.sh normal gg=G

 "Syntastic
hi clear SignColumn
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:airline#extensions#ale#enabled = 1
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

set nocompatible
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

if &diff
    colorscheme github

    let g:airline_theme = "github"
    let g:lightline = { 'colorscheme': 'github' }
endif

let g:mergetool_layout = 'bmr'
let g:mergetool_prefer_revision = 'local'

packloadall

runtime _bindings.vim
runtime _lsp.vim

set secure
