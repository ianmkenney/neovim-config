-- needs to be set manually or else PaperColor theme
-- isn't correct
vim.cmd("set termguicolors")

-- default to light theme, but PaperColor supports
-- "dark" as well
vim.o.background = "light"

vim.cmd("colorscheme PaperColor")

vim.cmd("set foldmethod=indent")
