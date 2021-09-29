local vim = vim
local nvim_lsp = require 'lspconfig'

nvim_lsp['lspfuzzy'] = require('lspfuzzy')

local on_attach = function(client, buffer)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', ';dc', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', ';df', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', ';h',  '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', ';i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', ';s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', ';td', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', ';rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', ';rf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', ';p', '<cmd>lua vim.lsp.buf.peek_definition()<CR>', opts)
  buf_set_keymap('n', ';f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', ';ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  buf_set_keymap('n', '<Leader>.', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<Leader>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

  vim.api.nvim_exec([[
    "let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
    "autocmd CursorHold * silent! lua vim.lsp.buf.hover()

    autocmd CursorHold * silent! lua vim.lsp.util.show_line_diagnostics()
    autocmd CursorHold  * silent! lua vim.lsp.buf.document_highlight()
    autocmd CursorHoldI * silent! lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved * silent! lua vim.lsp.buf.clear_references()
    autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

    " Use <Tab> and <S-Tab> to navigate through popup menu
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " Set completeopt to have a better completion experience
    set completeopt=menuone,noinsert,noselect

    " Avoid showing message extra message when using completion
    set shortmess+=c
  ]], false)


  require'completion'.on_attach {}
end

local function get_pass(key)
    local handle = io.popen("pass show " .. key); local result = handle:read("*l");
    handle:close();

    return vim.trim(result);
end

local servers = {'tsserver', 'sumneko_lua', 'vimls', 'cssls', 'lspfuzzy', 'pylsp', 'intelephense', 'jsonls', 'sourcekit'}

local server_opts = {
  intelephense = {
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
  },

  jsonls = {
    cmd = { 'vscode-json-languageserver' },
  },

  sourcekit = {
    cmd = { 'sourcekit-lsp' },
  },

  sumneko_lua = {
    cmd = { 'lua-language-server' },
  },
}

for _, lsp in ipairs(servers) do
  local opts = server_opts[lsp] or {}

  local default_opts = {
    on_attach = on_attach,

    flags = {
      debounce_text_changes = 150,
    },
  }

  for k,v in pairs(default_opts) do opts[k] = v end

  nvim_lsp[lsp].setup(opts)
end
