-- install plugins first with packer
require("plugins")

require("appearance")
require("autocomplete")
require("git")
require("keymapping")
require("lsp")
require("treesitter")

vim.opt.expandtab=true
vim.opt.number=true
vim.opt.shiftwidth=4
vim.opt.tabstop=4
