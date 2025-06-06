return {
	"kevinhwang91/nvim-ufo",
	event = "VeryLazy",
	dependencies = {
		{ "kevinhwang91/promise-async" },
	},

	config = function()
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
			preview = {
				win_config = {
					winhighlight = "Normal:Folded",
					winblend = 0,
				},
			},
		})
	end,
}
