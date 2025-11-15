
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('config.lazy')
--require('config.treesitter')

require('lualine').setup{
  extensions = {
    'fzf',
    'neo-tree'
  }
}
require('mappings')

-- Map comma to leader key
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

--vim.o.t_color = 256
vim.o.background = 'light'
vim.o.termguicolors = true
vim.cmd('colorscheme catppuccin-latte')

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
opt.swapfile = false

-- Set relative line numbers
vim.api.nvim_set_option('number', true)
vim.api.nvim_set_option('relativenumber', true)

-- LSP configs
vim.lsp.enable({
  "clangd",
  "ruby_lsp",
})

vim.lsp.config("clangd", {
  cmd = { "clangd" }, -- ensure it's in PATH
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac', -- AutoTools
    '.git',
  },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { 'utf-8', 'utf-16' },
  },
  ---@param init_result ClangdInitializeResult
  on_init = function(client, init_result)
    if init_result.offsetEncoding then
      client.offset_encoding = init_result.offsetEncoding
    end
  end,
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdSwitchSourceHeader', function()
      switch_source_header(bufnr, client)
    end, { desc = 'Switch between source/header' })

    vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdShowSymbolInfo', function()
      symbol_info(bufnr, client)
    end, { desc = 'Show symbol info' })
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})



-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
