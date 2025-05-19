return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	config = function()
		require("telescope").setup({
			pickers = {
				find_files = {
					theme = "ivy",
				},
			},
		})
	end,
}
