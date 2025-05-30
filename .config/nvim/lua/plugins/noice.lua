return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},

	opts = {},
	config = function()
		local noice = require("noice")
		noice.setup({
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
		})
	end,
}
