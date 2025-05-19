return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	lazy = true,
	opts = {
		preset = "helix",
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Which-key 'I know you forget'",
		},
	},
}
