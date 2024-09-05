vim.g.mapleader = ' '

-- Quickfix

vim.keymap.set('n', 'gn', "<cmd>cn<cr>", {})
vim.keymap.set('n', 'gp', "<cmd>cp<cr>", {})

-- Telescope

local tsbuiltin = require("telescope.builtin")
local tsthemes = require("telescope.themes")

vim.keymap.set('n', '<leader>ff', tsbuiltin.find_files, {desc = "List files in your current working directory with telescope"})
vim.keymap.set('n', '<leader>fg', tsbuiltin.live_grep, {desc = "Search for a string in your current working directory with telescope"})
vim.keymap.set('n', '<leader>fb', tsbuiltin.buffers, {desc = "Search buffers with telescope"})
vim.keymap.set('n', '<leader>fh', tsbuiltin.help_tags, {desc = "Search help tags with telescope"})
vim.keymap.set('n', '<leader>=', function () tsbuiltin.spell_suggest(tsthemes.get_cursor()) end, {desc = "Suggest spelling with telescope"})
vim.keymap.set('n', '<leader>gc', tsbuiltin.git_commits, {desc = "Checkout commits using telescope"})
vim.keymap.set('n', '<leader>?', tsbuiltin.keymaps, {desc = "Search key mappings with telescope"})

-- buffers

vim.keymap.set('n', '<leader>bk', ":bdelete<cr>", {desc = "Delete the current buffer"})

-- windows

vim.keymap.set('n', '<leader>wk', ':quit<cr>', {desc = "Close the current window"})
vim.keymap.set('n', '<leader>w-', ':split<cr>', {desc = "Split the current window horizonatally"})
vim.keymap.set('n', '<leader>w|', ':vsplit<cr>', {desc = "Split the current window vertically"})

-- tabs

vim.keymap.set('n', '<leader>tn', ':tabnew<cr>', {desc = "Create a new tab"})
vim.keymap.set('n', '<leader>tk', ':tabclose<cr>', {desc = "Close the current tab"})

-- LSP

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    bufmap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>')
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    bufmap('n', '<leader>vh', '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>')
  end
})
