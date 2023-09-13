local null_ls = require("null-ls")

require('gitsigns').setup({})
require('refactoring').setup({})

null_ls.setup({
    sources = {
        -- formatting
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.eslint_d,

        -- diagnostics 
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.commitlint,
        null_ls.builtins.diagnostics.dotenv_linter,
        null_ls.builtins.diagnostics.editorconfig_checker,
        null_ls.builtins.diagnostics.sqlfluff.with({
            extra_args = { "--dialect", "postgres" }, -- change to your dialect
        }),

        -- completion 
        null_ls.builtins.completion.spell,
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.completion.tags,

        -- code actions
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.eslint_d,
    },
})
