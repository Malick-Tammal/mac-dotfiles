return {
	"kylechui/nvim-surround",
	version = "^3.0.0",
	lazy = true,
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup()
	end,
}
