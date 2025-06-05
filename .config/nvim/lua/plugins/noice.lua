return {
	"folke/noice.nvim",
	event = "UIEnter",
	opts = {
		presets = {
			bottom_search = true,
			lsp_doc_border = true,
			long_message_to_split = true,
		},
		health = {
			checker = false,
		},
		lsp = {
			signature = {
				auto_open = { enabled = false },
			},
		},
	},
}
