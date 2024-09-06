-- bootstap packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

ensure_packer()

return require('packer').startup(function(use)
    use 'L3MON4D3/LuaSnip'
    use 'NLKNguyen/papercolor-theme'
    use 'airblade/vim-gitgutter'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'neovim/nvim-lspconfig'
    use 'nvim-orgmode/orgmode'
    use 'nvim-treesitter/nvim-treesitter'
    use 'saadparwaiz1/cmp_luasnip'
    use 'tpope/vim-fugitive'
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = {
            { 'nvim-lua/plenary.nvim' }
        }
    }
end)
