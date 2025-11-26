
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('config.lazy')
require('lualine').setup{

  extensions = {
    'fzf',
    'neo-tree'
  },
  options = {theme = 'onelight'}

}
require('mappings')

-- Map comma to leader key
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

--vim.o.t_color = 256
vim.o.background = 'light'
vim.o.termguicolors = true
vim.o.cmdheight = 0
vim.cmd.colorscheme "catppuccin-latte"

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

local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('zls', {
  capabilities = capabilities
})
vim.lsp.config('ruby_lsp', {
  capabilities = capabilities
})
vim.lsp.config('solargraph', {
  capabilities = capabilities
})
vim.lsp.config('clangd', {
  capabilities = capabilities
})

vim.lsp.enable({
  "ruby_lsp",
  "solargraph",
  "purescriptls",
  "hls",
  "clangd",
  "zls",
})


