-----------------------------------------------------------
--  HACK: Theme Switcher
-----------------------------------------------------------
return {
	"lmantw/themify.nvim",

	lazy = false,
	priority = 999,

	--
	--  INFO: Themes
	--

	config = function()
		-- TODO: Setting Highlights ( changing some ui colors )
		local function setHl(palette)
			-- Buffer line
			vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { bg = palette.orange, fg = palette.bg3 })

			-- Telescope
			vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = palette.green, fg = palette.bg3 })
			vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = palette.orange, fg = palette.bg3 })
			vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = palette.yellow, fg = palette.bg3 })
			vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = palette.orange })

			-- Cmp ( Completion menu )
			vim.api.nvim_set_hl(0, "CmpPmenu", { bg = palette.bg_dim })
			vim.api.nvim_set_hl(0, "PmenuSel", { bg = palette.green, fg = palette.bg3 })
		end

		local colors

		require("themify").setup({
			{
				--
				--  TODO: Everforest
				--

				"neanias/everforest-nvim",

				before = function()
					require("everforest").setup({
						-- Options (hard/ medium / soft)
						background = "hard",
						transparent_background_level = 0,
						ui_contrast = "high",
						float_style = "dim",

						on_highlights = function(hl, palette)
							colors = palette
						end,
					})
				end,

				-- Settings colors
				after = function()
					setHl(colors)
				end,
			},

			--
			--  TODO: Gruvbox material
			--

			{
				"sainnhe/gruvbox-material",

				before = function()
					vim.g.gruvbox_material_background = "hard"

					vim.api.nvim_create_autocmd("ColorScheme", {
						group = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {}),
						pattern = "gruvbox-material",
						callback = function()
							local config = vim.fn["gruvbox_material#get_configuration"]()
							local palette = vim.fn["gruvbox_material#get_palette"](
								config.background,
								config.foreground,
								config.colors_override
							)

							for k, v in pairs(palette) do
								palette[k] = v[1]
							end

							colors = palette
						end,
					})
				end,

				-- Settings colors
				after = function()
					setHl(colors)
				end,
			},
		})
	end,
}
