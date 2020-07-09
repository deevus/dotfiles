" Tags

Plug 'neovim/nvim-lsp'

" Snippets
Plug 'SirVer/ultisnips' " Snippets - Never use
Plug 'algotech/ultisnips-php' " Ultisnips for PHP
Plug 'honza/vim-snippets'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy find files
"Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim', { 'do': ':FzfPreviewInstall' }
Plug 'bogado/file-line' " Used in fzf-preview for opening a file to a specific line

"Plug 'ncm2/float-preview.nvim'
"Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

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
