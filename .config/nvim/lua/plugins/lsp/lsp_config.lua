return {
	-- HACK: LSPs config
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- import lspconfig plugin
			local lspconfig = require("lspconfig")

			-- import cmp-nvim-lsp plugin
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			-- Autocompletion
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- HACK: LSPs

			-- Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				filetypes = {
					"lua",
				},
				settings = {
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})

			-- JS / TS / JSX
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				filetypes = {
					"javascript",
					"javascriptreact",
					"typescript",
				},
			})

			-- HTML
			lspconfig.templ.setup({
				capabilities = capabilities,
				filetypes = {
					"html",
				},
			})

			-- CSS / SCSS
			lspconfig.cssls.setup({
				capabilities = capabilities,
				filetypes = {
					"css",
					"scss",
				},
			})

			-- Json / Jsonc
			lspconfig.jsonls.setup({
				capabilities = capabilities,
				filetypes = {
					"json",
					"jsonc",
				},
			})

			-- Emmet
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
				filetypes = {
					"css",
					"html",
					"javascript",
					"javascriptreact",
					"sass",
					"scss",
					"typescriptreact",
				},
			})
		end,
	},

	-- HACK: Diagnostic config
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "modern",
				transparent_bg = false,
				signs = {
					diag = "󱓻",
				},
				options = {
					use_icons_from_diagnostic = true,

					multilines = {
						-- Enable multiline diagnostic messages
						enabled = true,
						-- Always show messages on all lines for multiline diagnostics
						always_show = false,
					},
				},
				disabled_ft = {}, -- List of filetypes to disable the plugin
			})

			-- Change the Diagnostic symbols
			vim.diagnostic.config({
				underline = false,
				virtual_text = false,
				update_in_insert = false,
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = "󰠠 ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			})
		end,
	},
}
