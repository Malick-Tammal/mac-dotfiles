return {
	"kyazdani42/nvim-web-devicons",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		require("nvim-web-devicons").setup({
			override_by_extension = {
				["src/"] = {
					icon = "",
					color = "#81e043",
					name = "Log",
				},
			},

			override_by_filename = {
				["src/"] = {
					icon = "",
					color = "#f1502f",
					name = "Gitignore",
				},
			},
		})
	end,
}
