return {
	"Wansmer/treesj",
	event = "VeryLazy",
	lazy = true,
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
	config = function()
		require("treesj").setup({
			max_join_length = 300,
		})
	end,
}
