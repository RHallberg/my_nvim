
vim.g.mapleader = ","

-- Change to normal mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, desc = "Go to normal mode"})

-- Copy filename to clipboard
vim.api.nvim_set_keymap('n', '<leader>cc', ':let @+=expand("%")<CR>', {noremap = true, silent = true, desc = "Copy filename"})

-- NeoTreeRevealToggle
vim.api.nvim_set_keymap('n', '<leader>tt', ':NeoTreeRevealToggle<CR>', { noremap = true, desc = "Toggle neotree file browser" })

-- Oil
vim.api.nvim_set_keymap('n', '<leader>oo', ':Oil<CR>', { noremap = true, desc = "Open oil file browser" })

---- FZF
-- fzf files
vim.api.nvim_set_keymap('n', '<leader>fa',
    "<cmd>lua require('fzf-lua').files({cwd = 'app/'})<CR>",
    { noremap = true, silent = true, desc = "Fuzzy find files in app"})

vim.api.nvim_set_keymap('n', '<leader>fs',
    "<cmd>lua require('fzf-lua').files({cwd = 'spec/'})<CR>",
    { noremap = true, silent = true, desc = "Fuzzy find files in spec"})

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
vim.api.nvim_set_keymap('n', '<leader>wn', ':tabnew<CR>', { noremap = true, desc = "Open new tab"})
vim.api.nvim_set_keymap('n', '<leader>wq', ':tabprevious<CR>', { noremap = true, desc = "Go to previous tab" })
vim.api.nvim_set_keymap('n', '<leader>we', ':tabnext<CR>', { noremap = true, desc = "Go to next tab"})
vim.api.nvim_set_keymap('n', '<leader>wc', ':tabclose<CR>', { noremap = true, desc = "Close current tab"})

--- Teminal
-- Open terminal
vim.api.nvim_set_keymap('n', '<leader>ot', ':terminal<CR>', { noremap = true, desc = "Open terminal"})
-- Exit terminal mode
vim.api.nvim_set_keymap('t', 'jk', '<C-\\><C-n>', { noremap = true, desc = "Exit terminal mode"})

-- Writing files
vim.api.nvim_set_keymap('n', '<leader><C-s>', ':w<CR>', { noremap = true, desc = "Write file"})
vim.api.nvim_set_keymap('n', '<leader><C-q>', ':wqa!<CR>', { noremap = true, desc = "Write file"})

-- Session
vim.api.nvim_set_keymap('n', '<leader>os', ':Obsession<CR>', { noremap = true, desc = "Start session"})

-- Quit quick
vim.api.nvim_set_keymap('n', '<leader>qq', ':qa<CR>', { noremap = true, desc = "Quit all"})

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

-- Run tests
vim.keymap.set('n', '<leader>s', ':TestNearest<CR>', { noremap = true, silent = true, desc = "Run nearest test" })
vim.keymap.set('n', '<leader>S', ':TestFile<CR>', { noremap = true, silent = true, desc = "Run test file" })

-- Display warning/error
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {noremap = true, silent = true, desc = "Diagnostic"})

-- Toggle diagnostic lines
vim.keymap.set('n', '<leader>td', function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })

-- Linter code action
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "LSP Code Action" })

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<C-j>', 'copilot#Accept("<CR>")', { silent = true, expr = true, desc = "Accept Copilot suggestion" })

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
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename definition"})
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action (for example linting)"})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf})
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = ev.buf})
  end,
})
