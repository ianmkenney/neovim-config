local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lsp init

lspconfig.rust_analyzer.setup({
	settings = {
		['rust-analyzer'] = {},
	}
})

lspconfig.pylsp.setup({})

lspconfig.texlab.setup({})

lspconfig.lua_ls.setup({
    capabilities = lsp_capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'}
            }
        }
    }
})

lspconfig.marksman.setup({})

lspconfig.gopls.setup({})
