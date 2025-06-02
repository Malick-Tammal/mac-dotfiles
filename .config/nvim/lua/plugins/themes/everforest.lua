return {
	"neanias/everforest-nvim",

	-- INFO: Config
	config = function()
		require("everforest").setup({
			-- Options (hard/ medium / soft)
			background = "hard",
			transparent_background_level = 0,
			ui_contrast = "high",
			float_style = "dim",

			-- Settings custom highlights
			on_highlights = function(hl, palette)
				hl.BufferLineFill = { bg = palette.bg_dim }
				hl.BufferLineIndicatorSelected = { bg = palette.orange, fg = palette.bg3 }
				hl.TelescopeResultsTitle = { bg = palette.green, fg = palette.bg3 }
				hl.TelescopePreviewTitle = { bg = palette.orange, fg = palette.bg3 }
				hl.TelescopePromptTitle = { bg = palette.yellow, fg = palette.bg3 }
				hl.TelescopeSelection = { fg = palette.orange }
				hl.CmpNormal = { bg = palette.bg_dim }

				HlOrange = palette.orange
			end,
		})
		vim.cmd("colorscheme everforest")
	end,
}
