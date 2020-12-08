local vim = vim
local nvim_lsp = require 'lspconfig'

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

nvim_lsp.vimls.setup({});

nvim_lsp.cssls.setup({});

nvim_lsp.jsonls.setup({});


vim.api.nvim_exec([[
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

nnoremap <silent> <Leader>. <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <Leader>, <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

autocmd BufEnter * lua require'completion'.on_attach()

"autocmd CursorHold * silent! lua vim.lsp.util.show_line_diagnostics()
"autocmd CursorHold * silent! lua vim.lsp.buf.hover()
autocmd CursorHold  * silent! lua vim.lsp.buf.document_highlight()
autocmd CursorHoldI * silent! lua vim.lsp.buf.document_highlight()
autocmd CursorMoved * silent! lua vim.lsp.buf.clear_references()
]], true)
