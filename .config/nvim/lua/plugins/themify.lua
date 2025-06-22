-----------------------------------------------------------
--  HACK: Theme Switcher (Themify)
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

		local function setHl(palette, colorScheme)
			if colorScheme == "tokyonight" then
				-- Buffer line
				vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { bg = palette.red, fg = palette.bg })
				vim.api.nvim_set_hl(0, "BufferLineNeoTree", { bg = palette.bg_dark1, fg = palette.warning })
				vim.api.nvim_set_hl(0, "BufferLineFill", { bg = palette.black })

				-- Telescope
				vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = palette.red, fg = palette.bg })
				vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = palette.yellow, fg = palette.bg })
				vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = palette.orange, fg = palette.bg })
				vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = palette.orange })

				-- Cmp ( Completion menu )
				vim.api.nvim_set_hl(0, "CmpPmenu", { bg = palette.bg })
				vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = palette.bg })
				vim.api.nvim_set_hl(0, "PmenuSel", { bg = palette.red, fg = palette.bg })
				vim.api.nvim_set_hl(0, "CmpMenuBorder", { bg = "none" })

				-- Highlight relative number
				vim.api.nvim_set_hl(0, "LineNr", { fg = palette.blue2 })

				-- Indent line and highlight active
				vim.api.nvim_set_hl(0, "SnacksIndent", { fg = palette.grey0 })
				vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = palette.orange })

				-- Notify
				vim.api.nvim_set_hl(0, "NotifyINFOBody", { bg = palette.none })
				vim.api.nvim_set_hl(0, "NotifyINFOBorder", { bg = palette.none, fg = palette.info })
				vim.api.nvim_set_hl(0, "NotifyERRORBody", { bg = palette.none })
				vim.api.nvim_set_hl(0, "NotifyERRORBorder", { bg = palette.none, fg = palette.error })
				vim.api.nvim_set_hl(0, "NotifyWARNBody", { bg = palette.none })
				vim.api.nvim_set_hl(0, "NotifyWARNBorder", { bg = palette.none, fg = palette.warning })

			--
			-- 		  bg = "#222436",
			-- bg_dark = "#1e2030",
			-- bg_dark1 = "#191B29",
			-- bg_float = "#1e2030",
			-- bg_highlight = "#2f334d",
			-- bg_popup = "#1e2030",
			-- bg_search = "#3e68d7",
			-- bg_sidebar = "#1e2030",
			-- bg_statusline = "#1e2030",
			-- bg_visual = "#2d3f76",
			-- black = "#1b1d2b",
			-- blue = "#82aaff",
			-- blue0 = "#3e68d7",
			-- blue1 = "#65bcff",
			-- blue2 = "#0db9d7",
			-- blue5 = "#89ddff",
			-- blue6 = "#b4f9f8",
			-- blue7 = "#394b70",
			-- border = "#1b1d2b",
			-- border_highlight = "#589ed7",
			-- comment = "#636da6",
			-- cyan = "#86e1fc",
			-- dark3 = "#545c7e",
			-- dark5 = "#737aa2",
			-- diff = {
			--   add = "#273849",
			--   change = "#252a3f",
			--   delete = "#3a273a",
			--   text = "#394b70"
			-- },
			-- error = "#c53b53",
			-- fg = "#c8d3f5",
			-- fg_dark = "#828bb8",
			-- fg_float = "#c8d3f5",
			-- fg_gutter = "#3b4261",
			-- fg_sidebar = "#828bb8",
			-- git = {
			--   add = "#b8db87",
			--   change = "#7ca1f2",
			--   delete = "#e26a75",
			--   ignore = "#545c7e"
			-- },
			-- green = "#c3e88d",
			-- green1 = "#4fd6be",
			-- green2 = "#41a6b5",
			-- hint = "#4fd6be",
			-- info = "#0db9d7",
			-- magenta = "#c099ff",
			-- magenta2 = "#ff007c",
			-- none = "NONE",
			-- orange = "#ff966c",
			-- purple = "#fca7ea",
			-- rainbow = { "#82aaff", "#ffc777", "#c3e88d", "#4fd6be", "#c099ff", "#fca7ea", "#ff966c", "#ff757f" },
			-- red = "#ff757f",
			-- red1 = "#c53b53",
			-- teal = "#4fd6be",
			-- terminal = {
			--   black = "#1b1d2b",
			--   black_bright = "#444a73",
			--   blue = "#82aaff",
			--   blue_bright = "#9ab8ff",
			--   cyan = "#86e1fc",
			--   cyan_bright = "#b2ebff",
			--   green = "#c3e88d",
			--   green_bright = "#c7fb6d",
			--   magenta = "#c099ff",
			--   magenta_bright = "#caabff",
			--   red = "#ff757f",
			--   red_bright = "#ff8d94",
			--   white = "#828bb8",
			--   white_bright = "#c8d3f5",
			--   yellow = "#ffc777",
			--   yellow_bright = "#ffd8ab"
			-- },
			-- terminal_black = "#444a73",
			-- todo = "#82aaff",
			-- warning = "#ffc777",
			-- yellow = "#ffc777"
			else
				-- Buffer line
				vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { bg = palette.orange, fg = palette.bg_dim })
				vim.api.nvim_set_hl(0, "BufferLineNeoTree", { bg = palette.bg0, fg = palette.grey2 })
				vim.api.nvim_set_hl(0, "BufferLineFill", { bg = palette.bg_dim })

				-- Telescope
				vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = palette.green, fg = palette.bg3 })
				vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = palette.orange, fg = palette.bg3 })
				vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = palette.yellow, fg = palette.bg3 })
				vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = palette.orange })

				-- Cmp ( Completion menu )
				vim.api.nvim_set_hl(0, "CmpPmenu", { bg = palette.bg_dim })
				vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = palette.bg_dim })
				vim.api.nvim_set_hl(0, "PmenuSel", { bg = palette.green, fg = palette.bg3 })

				vim.api.nvim_set_hl(0, "CmpMenuBorder", { bg = "none" })

				-- Highlight relative number
				vim.api.nvim_set_hl(0, "LineNr", { fg = palette.aqua })

				-- Indent line and highlight active
				vim.api.nvim_set_hl(0, "SnacksIndent", { fg = palette.grey0 })
				vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = palette.orange })
			end
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
			{
				"folke/tokyonight.nvim",

				before = function()
					local palette = require("tokyonight.colors").setup()

					colors = palette
				end,

				-- Settings colors
				after = function()
					setHl(colors, "tokyonight")
				end,
			},
		})
	end,
}
