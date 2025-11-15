
vim.g.mapleader = ","

-- Change to normal mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, desc = "Go to normal mode"})

-- Copy filename to clipboard
vim.api.nvim_set_keymap('n', '<leader>cc', ':let @+=expand("%")<CR>', {noremap = true, silent = true, desc = "Copy filename"})

-- NeoTreeRevealToggle
vim.api.nvim_set_keymap('n', '<leader>tt', ':NeoTreeRevealToggle<CR>', { noremap = true, desc = "Toggle neotree file browser" })


-- Toggle word wrap
vim.keymap.set("n", "<leader>tw", function()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.wo.linebreak = false
  else
    vim.wo.wrap = true
    vim.wo.linebreak = true
  end
end, { desc = "Toggle word wrap" })

---- FZF
-- fzf files
vim.api.nvim_set_keymap('n', '<leader>ff',
    "<cmd>lua require('fzf-lua').files()<CR>",
    { noremap = true, silent = true, desc = "Fuzzy find files"})

-- fzf file content
vim.api.nvim_set_keymap('n', '<leader>fd',
    "<cmd>lua require('fzf-lua').live_grep()<CR>",
    { noremap = true, silent = true, desc = "Fuzzy find text in files"})

-- fzf git status/staging
vim.api.nvim_set_keymap('n', '<leader>gf',
    "<cmd>lua require('fzf-lua').git_status()<CR>",
    { noremap = true, silent = true, desc = "Git staging view"})

-- fzf file buffers
vim.api.nvim_set_keymap('n', '<leader>fb',
    "<cmd>lua require('fzf-lua').buffers()<CR>",
    { noremap = true, silent = true, desc = "fuzzy find buffers"})

-- fzf keymaps
vim.api.nvim_set_keymap('n', '<leader>km',
    "<cmd>lua require('fzf-lua').keymaps()<CR>",
    { noremap = true, silent = true, desc = "fuzzy find keymaps"})

---- tabs
vim.api.nvim_set_keymap('n', '<C-t>n', ':tabnew<CR>', { noremap = true, desc = "Open new tab"})
vim.api.nvim_set_keymap('n', '<C-t>h', ':tabprevious<CR>', { noremap = true, desc = "Go to previous tab" })
vim.api.nvim_set_keymap('n', '<C-t>l', ':tabnext<CR>', { noremap = true, desc = "Go to next tab"})
vim.api.nvim_set_keymap('n', '<C-t>c', ':tabclose<CR>', { noremap = true, desc = "Close current tab"})

-- Session
vim.api.nvim_set_keymap('n', '<leader>oo', ':Obsession<CR>', { noremap = true, desc = "Start session"})

-- cycle through buffers
--back
vim.api.nvim_set_keymap('n', '<leader>a', ':bprevious<CR>', { noremap = true, desc = "Previous buffer"})
--forwards
vim.api.nvim_set_keymap('n', '<leader>d', ':bnext<CR>', { noremap = true, desc = "Next buffer"})

-- Git
-- git blame
vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<CR>', { noremap = true, silent = true, desc = "Git blame"})

-- open git
vim.api.nvim_set_keymap('n', '<leader>go', ':GBrowse<CR>', { noremap = true, silent = true, desc = "Open git file (normal mode)"})
vim.api.nvim_set_keymap('v', '<leader>go', ':GBrowse<CR>', { noremap = true, silent = true, desc = "Open remote file (visual mode)"})
--  For gbrowse
vim.api.nvim_create_user_command(
  'Browse',
  function (opts)
    vim.fn.system { 'open', opts.fargs[1] }
  end,
  { nargs = 1 }
)

-- Remove trailing spaces
vim.api.nvim_set_keymap('n', '<leader>ts', [[:lua DeleteTrailingSpaces()<CR>]], { noremap = true, silent = true, desc = "Remove trailing spaces"})
function DeleteTrailingSpaces()
    local cursor_position = vim.fn.getpos('.')

    vim.cmd([[ %s/\s\+$//e ]])

    vim.fn.setpos('.', cursor_position)
end

-- Linter code action
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "LSP Code Action" })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Function declaration"})
    -- Go to definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition"})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf})
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf})
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = ev.buf})
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename definition"})
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action (for example linting)"})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf})
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = ev.buf})
  end,
})
