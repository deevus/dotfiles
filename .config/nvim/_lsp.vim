lua << EOF
local nvim_lsp = require 'nvim_lsp';

local function get_pass(key) 
    local handle = io.popen("pass show " .. key);
    local result = handle:read("*l");
    handle:close();

    return vim.trim(result);
end

nvim_lsp.tsserver.setup({});

nvim_lsp.intelephense.setup({
    init_options = {
        licenceKey = get_pass("Software/Intelephense");
        storagePath = os.getenv("HOME") .. "/.cache/intelephense";
    };

    settings = {
        intelephense = {
            files = {
                maxSize = 5000000;
            };
            diagnostics = {
              undefinedTypes = false;
            };
        };
    };
});

nvim_lsp.sumneko_lua.setup({});

nvim_lsp.pyls.setup({});
EOF

"autocmd Filetype javascript.jsx,lua,php,typescriptreact,typescript,python setl omnifunc=v:lua.vim.lsp.omnifunc
nnoremap <silent> ;dc <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ;df <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ;h  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ;i  <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> ;s  <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> ;td <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> ;rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ;rf <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> ;p  <cmd>lua vim.lsp.buf.peek_definition()<CR>
nnoremap <silent> ;f  <cmd>lua vim.lsp.buf.formatting()<CR>

"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

autocmd BufEnter * lua require'completion'.on_attach()
autocmd BufEnter * lua require'diagnostic'.on_attach()
