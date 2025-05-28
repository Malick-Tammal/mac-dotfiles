return {
	-- HACK: Gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},

				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "hard", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = true,
			})

			-- vim.cmd("colorscheme gruvbox"),
		end,
	},

	-- HACK: Kanagawa
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({

				-- vim.cmd("colorscheme kanagawa-dragon"),
			})
		end,
	},

	-- HACK: Tokyonight
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({

				-- vim.cmd("colorscheme tokyonight-night"),
			})
		end,
	},

	-- HACK: Rose pine
	{
		"rose-pine/neovim",
		config = function()
			require("rose-pine").setup({})

			-- vim.cmd("colorscheme rose-pine")
		end,
	},

	-- HACK: Onedark
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				-- INFO: Options (darker / dark / deep / cool / warmer / warm)
				style = "warmer",
				code_style = {
					comments = "italic",
					keywords = "bold",
					functions = "bold",
					strings = "bold",
					variables = "bold",
				},
			})

			-- vim.cmd("colorscheme onedark")
		end,
	},

	-- HACK: Everforest
	{
		"neanias/everforest-nvim",
		config = function()
			require("everforest").setup({
				-- INFO: Options (hard/ medium / soft)
				background = "hard",
				transparent_background_level = 1,
				ui_contrast = "hard",
				diagnostic_text_highlight = true,
			})

			vim.cmd("colorscheme everforest")
		end,
	},
}
