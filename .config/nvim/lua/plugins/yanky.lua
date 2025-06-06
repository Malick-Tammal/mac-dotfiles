return {
	"gbprod/yanky.nvim",
	event = { "BufReadPre", "BufNewFile" },

	opts = {
		highlight = {
			on_put = false,
			on_yank = false,
			timer = 500,
		},
	},
}
