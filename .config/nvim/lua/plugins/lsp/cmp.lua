return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",

	dependencies = {
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"onsails/lspkind.nvim",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"hrsh7th/cmp-nvim-lsp",
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu, menuone, preview",
			},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			window = {
				completion = {
					border = "rounded",
					winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenu,CursorLine:PmenuSel,Search:None",
				},
				documentation = {
					border = "rounded",
					winhighlight = "Normal:CmpDocNormal",
				},
			},

			preselect = cmp.PreselectMode.Item,

			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.complete(),
				["<C-d>"] = cmp.mapping.abort(),
			}),

			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			}),

			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = {
						menu = 50,
						abbr = 50,
					},
					ellipsis_char = "...",
				}),
			},

			experimental = {
				ghost_text = true,
			},
		})

		-- Change completion icons
		lspkind.init({
			symbol_map = {
				Snippet = "󰆧",
				Method = "",
			},
		})
	end,
}
