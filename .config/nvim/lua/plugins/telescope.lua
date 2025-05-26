return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	event = "VeryLazy",
	lazy = true,

	-- HACK: Config
	config = function()
		local tele = require("telescope")
		tele.setup({
			extensions = {
				fzf = {},
			},
		})
		tele.load_extension("fzf")
	end,
}
