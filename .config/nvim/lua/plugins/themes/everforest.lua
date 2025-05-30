-- HACK: Everforest

return {
	"neanias/everforest-nvim",
	config = function()
		require("everforest").setup({
			-- INFO: Options (hard/ medium / soft)
			background = "hard",
			transparent_background_level = 0.5,
			ui_contrast = "high",
			float_style = "dim",
			on_highlights = function(hl, palette)
				hl.BufferLineIndicatorSelected = { bg = palette.orange, fg = palette.bg3 }
			end,
		})
		vim.cmd("colorscheme everforest")
	end,
}
