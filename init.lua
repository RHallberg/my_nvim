
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')

require('lualine').setup{

  extensions = {
    'fzf',
    'neo-tree'
  }

}
require('mappings')

-- Map comma to leader key
vim.g.mapleader = ","

--vim.o.t_color = 256
vim.o.background = 'light'
vim.o.termguicolors = true
vim.cmd('colorscheme PaperColor')

local opt = vim.opt  -- to set options
-- Yank and paste to/from system clipboard
vim.api.nvim_set_option('clipboard', 'unnamedplus')
-- Two spaces for indentation
opt.shiftwidth = 2                  -- Size of an indent
opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- Completion options (for deoplete)
opt.expandtab = true                -- Use spaces instead of tabs
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.joinspaces = false              -- No double spaces with join
opt.list = true                     -- Show some invisible characters
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Relative line numbers
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = 2                  -- Size of an indent
opt.sidescrolloff = 8               -- Columns of context
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = 2                     -- Number of spaces tabs count for
opt.wrap = false

-- Set relative line numbers
vim.api.nvim_set_option('number', true)
vim.api.nvim_set_option('relativenumber', true)

-- LSP configs
local lspconfig = require('lspconfig')
lspconfig.ruby_lsp.setup{}
lspconfig.purescriptls.setup{}
lspconfig.hls.setup({})
lspconfig.clangd.setup{}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
