" Tags

Plug 'neovim/nvim-lsp'

"Plug 'majutsushi/tagbar' " ctags viewer
"Plug 'ludovicchabant/vim-gutentags' " ctags generator

"Plug 'ajh17/VimCompletesMe' " Tab completion
"Plug 'ervandew/supertab' " Tab completion

"Plug 'w0rp/ale' " Async linting engine using LSP
"Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

"Plug 'tbodt/deoplete-tabnine', {'do': './install.sh'}

"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'bash install.sh',
    "\ }

" Snippets
Plug 'SirVer/ultisnips' " Snippets - Never use
Plug 'algotech/ultisnips-php' " Ultisnips for PHP
Plug 'honza/vim-snippets'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy find files
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim'
Plug 'bogado/file-line' " Used in fzf-preview for opening a file to a specific line

" let g:fzf_preview_grep_cmd = 'pt --nogroup'
let g:fzf_preview_floating_window_winblend = 0 " disable transparency

"Plug 'ncm2/float-preview.nvim'
"Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --all
    !./install.py --clangdcompleter
  endif
endfunction

"Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
"Plug 'zxqfl/tabnine-vim'

"let g:LanguageClient_serverCommands = {
    "\ 'php': ['php', '~/.config/composer/vendor/bin/php-language-server.php'],
    "\ 'javascript': ['javascript-typescript-stdio'],
    "\ 'javascript.jsx': ['javascript-typescript-stdio'],
    "\ 'typescript': ['javascript-typescript-stdio'],
    "\ 'html': ['html-languageserver', '--stdio'],
    "\ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    "\ 'c': ['cquery', '--log-file=/tmp/cq.log'],
    "\ }

Plug 'liuchengxu/vista.vim'
let g:vista_default_executive = 'nvim_lsp'
let g:vista_update_on_text_changed = 1
let g:vista_fzf_preview = []

Plug 'haorenW1025/completion-nvim'
Plug 'haorenW1025/diagnostic-nvim'

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_chain_complete_list = {
            \ 'php' : {
            \   'default': [
            \       {'complete_items': ['lsp', 'snippet']},
            \       {'mode': '<c-p>'},
            \       {'mode': '<c-n>'}],
            \   }
            \  }

let g:completion_trigger_character = ['*']
let g:completion_enable_snippet = 'UltiSnips'
