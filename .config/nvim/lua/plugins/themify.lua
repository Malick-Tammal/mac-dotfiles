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

		local function setHl(palette)
			-- Buffer line
			vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { bg = palette.orange, fg = palette.bg_dim })
			vim.api.nvim_set_hl(0, "BufferLineNeoTree", { bg = palette.bg0, fg = palette.grey2 })
			vim.api.nvim_set_hl(0, "BufferLineFill", { bg = palette.bg_dim })
			-- vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = palette.bg_dim, fg = palette.grey2 })
			-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = palette.bg_dim, fg = palette.grey2 })
			-- vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = palette.bg0, fg = palette.grey2 })

			-- vim.api.nvim_set_hl(0, "BufferLineTab", { bg = palette.orange, fg = palette.bg3 })
			-- vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { bg = palette.orange, fg = palette.bg3 })
			-- vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = palette.orange, fg = palette.bg3 })
			-- vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bg = palette.orange, fg = palette.bg3 })
			-- vim.api.nvim_set_hl(0, "BufferLineBuffer", { bg = palette.orange, fg = palette.bg3 })
			-- vim.api.nvim_set_hl(0, "BufferLineCloseButtonSelected", { bg = palette.orange, fg = palette.bg3 })
			-- vim.api.nvim_set_hl(0, "BufferLineInfoSelected", { bg = palette.orange, fg = palette.bg3 })
			-- vim.api.nvim_set_hl(0, "BufferLineGroupLabel", { bg = palette.orange, fg = palette.bg3 })
			-- vim.api.nvim_set_hl(0, "BufferLineFileIcon", { bg = palette.orange })

			-- Telescope
			vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = palette.green, fg = palette.bg3 })
			vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = palette.orange, fg = palette.bg3 })
			vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = palette.yellow, fg = palette.bg3 })
			vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = palette.orange })

			-- Cmp ( Completion menu )
			vim.api.nvim_set_hl(0, "CmpPmenu", { bg = palette.bg_dim })
			vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = palette.bg_dim })
			vim.api.nvim_set_hl(0, "PmenuSel", { bg = palette.green, fg = palette.bg3 })

			-- Highlight relative number
			vim.api.nvim_set_hl(0, "LineNr", { fg = palette.aqua })

			-- vim.api.nvim_set_hl(0, "Comment", { fg = palette.grey1 })

			vim.api.nvim_set_hl(0, "SnacksIndent", { fg = palette.grey0 })
			vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = palette.orange })
		end

		-- aqua = "#83c092",
		-- bg0 = "#272e33",
		-- bg1 = "#2e383c",
		-- bg2 = "#374145",
		-- bg3 = "#414b50",
		-- bg4 = "#495156",
		-- bg5 = "#4f5b58",
		-- bg_blue = "#384b55",
		-- bg_dim = "#1e2326",
		-- bg_green = "#3c4841",
		-- bg_red = "#493b40",
		-- bg_visual = "#4c3743",
		-- bg_yellow = "#45443c",
		-- blue = "#7fbbb3",
		-- fg = "#d3c6aa",
		-- green = "#a7c080",
		-- grey0 = "#7a8478",
		-- grey1 = "#859289",
		-- grey2 = "#9da9a0",
		-- none = "NONE",
		-- orange = "#e69875",
		-- purple = "#d699b6",
		-- red = "#e67e80",
		-- statusline1 = "#a7c080",
		-- statusline2 = "#d3c6aa",
		-- statusline3 = "#e67e80",
		-- yellow = "#dbbc7f"

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
