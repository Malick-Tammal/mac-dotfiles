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
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--color", "never", "--no-require-git" },
				},
			},
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
			},
		})

		-- INFO: Extensions
		tele.load_extension("fzf")
	end,
}
