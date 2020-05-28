
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
"inoremap <C-U> <C-G>u<C-U>

nmap <C-p> :FzfPreviewProjectFiles <CR>
nmap <Leader>p :FzfPreviewProjectFiles <CR>
nmap <Leader>g :FzfPreviewProjectGrep <CR>
nmap <Leader>b :FzfPreviewBuffers <CR>
nmap <Leader>B :FzfPreviewAllBuffers <CR>
nmap <Leader>l :FzfPreviewLines <CR>
nmap <Leader>R :FzfPreviewProjectMruFiles <CR>
nmap <Leader>q :FzfPreviewQuickFix <CR>
nmap <Leader>v :Vista!! <CR>

nnoremap <Leader>r :set relativenumber! <CR>

nnoremap <C-]> :call LanguageClient_textDocument_definition() <CR>
nnoremap <Leader>s :call LanguageClient_textDocument_documentSymbol() <CR>
nnoremap <Leader>a :call LanguageClient_textDocument_references() <CR>

" Create method/class/property comment
nnoremap <Leader>d :call pdv#DocumentWithSnip() <CR>

"nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
"nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:UltiSnipsExpandTrigger = '<CR>'
