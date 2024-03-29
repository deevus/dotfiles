local vim = vim;

local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path })
end

-- Get platform dependant build script
local function tabnine_build_path()
  if vim.loop.os_uname().sysname == "Windows_NT" then
    return "pwsh.exe -file .\\dl_binaries.ps1"
  else
    return "./dl_binaries.sh"
  end
end

require 'paq' {
  'savq/paq-nvim',

  'scrooloose/nerdcommenter',      -- Comments
  'tpope/vim-surround',            -- Quoting/surrounding text eg. csw'
  'xolox/vim-misc',                -- Autoload vim scripts for xolox plugins
  'tpope/vim-fugitive',            -- Adds git command
  'editorconfig/editorconfig-vim', -- Editorconfig - Text editor config. Eg. indentation, tabs etc
  'mhinz/vim-startify',            -- Start page for vim

  'mtth/scratch.vim',              -- :Scratch pad

  -- Status line
  'hoob3rt/lualine.nvim',
  'kyazdani42/nvim-web-devicons',
  'ryanoasis/vim-devicons',

  -- Color schemes
  'cormacrelf/vim-colors-github', -- Github colorscheme - great for diffs!
  'dracula/vim',
  'xiyaowong/nvim-transparent',

  -- Async
  'joonty/vim-do',      -- Async shell commands
  'tpope/vim-dispatch', -- Background tasks - should use this
  'Shougo/vimproc.vim', -- Async execution - Do I need this?

  'akinsho/toggleterm.nvim',

  -- Telescope
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'EthanJWright/vs-tasks.nvim',

  -- Git
  'samoshkin/vim-mergetool', -- Used with vim-colors-github for git merging/diffing
  'pwntester/octo.nvim',     -- issues and PRs
  'ruanyl/vim-gh-line',      -- open current line on GitHub

  -- Motions
  -- 'easymotion/vim-easymotion'; -- Vim motions - Need to use more
  'ggandor/lightspeed.nvim',

  -- Config
  'MarcWeber/vim-addon-local-vimrc', -- Loads .vimrc in project directory
  'svermeulen/vimpeccable',

  -- Linting
  'vsushkov/vim-phpcs', -- PHP

  -- Docs
  'heavenshell/vim-jsdoc', -- JSDoc

  -- Utils
  'danro/rename.vim',
  'karb94/neoscroll.nvim',   -- Smooth scrolling
  'chiedo/vim-case-convert', -- Case conversion

  -- Syntax --
  { 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate' },
  'nvim-treesitter/nvim-treesitter-context',
  'amadeus/vim-mjml',
  'quabug/vim-gdscript',

  -- """""""""""""" VIM """"""""""""""""
  'vim-jp/syntax-vim-ex', -- Vimscript

  -- """""""""""""" PHP """"""""""""""""
  'stanangeloff/php.vim', -- PHP
  'jwalton512/vim-blade', -- PHP blade
  'joonty/vdebug',

  -- """""""""""""" JS """"""""""""""""
  'pangloss/vim-javascript',
  'MaxMEllon/vim-jsx-pretty', -- JSX/React
  'eliba2/vim-node-inspect',  -- Node inspect
  'jparise/vim-graphql',      -- GraphQL
  'quramy/vim-js-pretty-template',

  -- """""""""""""" OTHER """"""""""""""""
  'PProvost/vim-ps1',                                                      -- Powershell
  'hail2u/vim-css3-syntax',                                                -- CSS3
  'kylef/apiblueprint.vim',                                                -- API Blueprint
  { 'cespare/vim-toml',          branch = 'main',           as = 'toml' }, -- toml
  'keith/swift.vim',                                                       -- Swift
  'farmergreg/vim-lastplace',                                              -- Remember last edit position
  'vuciv/vim-bujo',                                                        -- Bullet journal
  'mbbill/undotree',
  'ThePrimeagen/harpoon',

  'sheerun/vim-polyglot',
  'wuelnerdotexe/vim-astro',

  -- Completion --
  'rcarriga/nvim-notify',
  'folke/noice.nvim', -- Dependencies: nvim-notify, nui.nvim, nvim-treesitter
  'neovim/nvim-lspconfig',
  'junegunn/fzf', -- Fuzzy find files
  'junegunn/fzf.vim',
  'ojroques/nvim-lspfuzzy',
  'kosayoda/nvim-lightbulb',
  'L3MON4D3/LuaSnip',
  'folke/lua-dev.nvim',
  'tikhomirov/vim-glsl',
  'stevearc/dressing.nvim',
  'akinsho/flutter-tools.nvim',
  --{'codota/tabnine-nvim', build=tabnine_build_path()};
  'mfussenegger/nvim-jdtls',
  {
    'williamboman/mason.nvim',
    build = function()
      vim.cmd(":MasonUpdate")
    end
  },
  'williamboman/mason-lspconfig.nvim',

  -- nvim-cmp
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
  'saecki/crates.nvim', -- Cargo.toml crates completion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-cmdline',
  --{'tzachar/cmp-tabnine', build='./install.sh'};
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/nvim-cmp',
  'MunifTanjim/nui.nvim',
  'dpayne/CodeGPT.nvim',
  'folke/trouble.nvim',
  'github/copilot.vim',

  -- Indent --
  '2072/PHP-Indenting-for-VIm',

  -- Code review --
  'junkblocker/patchreview-vim',
  'codegram/vim-codereview',

  -- Project Management --
  'ahmedkhalf/project.nvim',

  -- Null-ls --
  'nvimtools/none-ls.nvim',
  'lewis6991/gitsigns.nvim',
  'ThePrimeagen/refactoring.nvim',

  -- Sudo --
  'lambdalisue/suda.vim',
}

require("project_nvim").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

require("flutter-tools").setup {};
require("toggleterm").setup {};

-- Set tsx files to TypeScript.tsx filetype for better syntax highlighting
vim.api.nvim_exec([[
  autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
]], true)

-- VDebug/XDebug configuration
vim.api.nvim_set_var('vdebug_options', {
  port = 9003,                                -- XDebug 3
  path_maps = { ['/app'] = vim.fn.getcwd() }, -- Can we generalise this?
})

-- JSDoc configuration
vim.api.nvim_set_var('jsdoc_lehre_path', 'lehre')

-- Startify configuration
vim.api.nvim_set_var('startify_change_to_dir', false)
