local vim = vim;
local util = require 'util'

local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require 'paq' {
  'savq/paq-nvim';

  'scrooloose/nerdcommenter'; -- Comments
  'tpope/vim-surround'; -- Quoting/surrounding text eg. csw'
  'xolox/vim-misc'; -- Autoload vim scripts for xolox plugins
  'tpope/vim-fugitive'; -- Adds git command
  'editorconfig/editorconfig-vim'; -- Editorconfig - Text editor config. Eg. indentation, tabs etc
  'mhinz/vim-startify'; -- Start page for vim

  'mtth/scratch.vim'; -- :Scratch pad

  -- Status line
  'hoob3rt/lualine.nvim';
  'kyazdani42/nvim-web-devicons';
  'ryanoasis/vim-devicons';

  -- Color schemes
  'cormacrelf/vim-colors-github'; -- Github colorscheme - great for diffs!
  'dracula/vim';
  'xiyaowong/nvim-transparent';

  -- Async
  'joonty/vim-do'; -- Async shell commands
  'tpope/vim-dispatch'; -- Background tasks - should use this
  'Shougo/vimproc.vim'; -- Async execution - Do I need this?

  -- Telescope
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';
  {'nvim-telescope/telescope-fzf-native.nvim', run='make'};

  -- Git
  'samoshkin/vim-mergetool'; -- Used with vim-colors-github for git merging/diffing
  'pwntester/octo.nvim'; -- issues and PRs

  -- Motions
  'easymotion/vim-easymotion'; -- Vim motions - Need to use more

  -- Config
  'MarcWeber/vim-addon-local-vimrc'; -- Loads .vimrc in project directory
  'svermeulen/vimpeccable';

  -- Linting
  'vsushkov/vim-phpcs'; -- PHP

  -- Docs
  'heavenshell/vim-jsdoc'; -- JSDoc

  -- Utils
  'danro/rename.vim';
  'karb94/neoscroll.nvim'; -- Smooth scrolling

  -- Syntax --
  {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'};
  'amadeus/vim-mjml';

  -- """""""""""""" VIM """"""""""""""""
  'vim-jp/syntax-vim-ex'; -- Vimscript

  -- """""""""""""" PHP """"""""""""""""
  'stanangeloff/php.vim'; -- PHP
  'jwalton512/vim-blade'; -- PHP blade
  'joonty/vdebug';

  -- """""""""""""" JS """"""""""""""""
  'pangloss/vim-javascript';
  'MaxMEllon/vim-jsx-pretty'; -- JSX/React
  'eliba2/vim-node-inspect'; -- Node inspect

  -- """""""""""""" OTHER """"""""""""""""
  'PProvost/vim-ps1'; -- Powershell
  'hail2u/vim-css3-syntax'; -- CSS3
  'kylef/apiblueprint.vim'; -- API Blueprint
  'cespare/vim-toml'; -- toml
  'keith/swift.vim'; -- Swift
  'farmergreg/vim-lastplace'; -- Remember last edit position
  'vuciv/vim-bujo'; -- Bullet journal

  'sheerun/vim-polyglot';

  -- Completion --
  'neovim/nvim-lspconfig';
  'junegunn/fzf'; -- Fuzzy find files
  'junegunn/fzf.vim';
  'ojroques/nvim-lspfuzzy';
  'kosayoda/nvim-lightbulb';
  'yuki-ycino/fzf-preview.vim';
  'bogado/file-line'; -- Used in fzf-preview for opening a file to a specific line
  'L3MON4D3/LuaSnip';

  -- nvim-cmp
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-buffer';
  {'tzachar/cmp-tabnine', run='./install.sh'};
  'saadparwaiz1/cmp_luasnip';
  'hrsh7th/nvim-cmp';

  -- Indent --
  '2072/PHP-Indenting-for-VIm';

  -- Code review --
  'junkblocker/patchreview-vim';
  'codegram/vim-codereview';
}

-- Set tsx files to TypeScript.tsx filetype for better syntax highlighting
vim.api.nvim_exec([[
  autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
]], true)

-- VDebug/XDebug configuration
vim.api.nvim_set_var('vdebug_options', { 
  port = 9003; -- XDebug 3
  path_maps = { ['/app'] = vim.fn.getcwd() }; -- Can we generalise this?
})

-- JSDoc configuration
vim.api.nvim_set_var('jsdoc_lehre_path', 'lehre')

-- Startify configuration
vim.api.nvim_set_var('startify_change_to_dir', false)
