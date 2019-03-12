
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

nmap <C-p> :Files <CR>

nnoremap <Leader>r :set relativenumber! <CR>

nnoremap <C-]> :call LanguageClient_textDocument_definition() <CR>
nnoremap <Leader>s :call LanguageClient_textDocument_documentSymbol() <CR>

" Create method/class/property comment
nnoremap <Leader>d :call pdv#DocumentWithSnip() <CR>

"nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
"nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" Key mapping
"map <C-n> :NERDTreeTabsToggle<CR>
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_command = 'CtrlPMixed'

"nmap <C-P> :Denite file/rec buffer<CR>
