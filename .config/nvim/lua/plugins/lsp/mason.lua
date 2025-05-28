return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	lazy = true,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- UI
		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- LSPs
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"cssls",
				"emmet_ls",
				"jsonls",
				"html",
			},
			automatic_enable = false,
		})

		-- Formatters
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"prettierd",
				"stylua",
				"pyproject-fmt",
				"shfmt",
				"beautysh",
			},
		})
	end,
}
