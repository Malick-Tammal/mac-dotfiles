return {
	{
		"mason-org/mason-lspconfig.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "templ", "cssls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		lazy = true,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
		end,
	},
}
