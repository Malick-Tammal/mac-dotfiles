return {
	"kylechui/nvim-surround",
	version = "^3.0.0",
	event = "VeryLazy",
	lazy = true,

	config = function()
		require("nvim-surround").setup()
	end,
}
