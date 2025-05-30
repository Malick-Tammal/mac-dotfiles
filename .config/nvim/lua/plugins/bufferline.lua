return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",

	-- HACK: Config
	config = function()
		vim.opt.termguicolors = true
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {

				-- INFO: Explorer
				offsets = {
					{
						filetype = "neo-tree",
						text = function()
							local title = "󰲂 Explorer "
							local path = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
							return title .. '"' .. path .. '"'
						end,
						separator = true,
						text_align = "center",
					},
				},
				themable = true,
				indicator = {
					-- icon = "  ",
					icon = "  ",
					style = "icon",
				},
				buffer_close_icon = "󱎘 ",
				modified_icon = "󰤌 ",
				tab_size = 25,
				color_icons = true,
				separator_style = "thin",
				-- numbers = "ordinal", -- Show numbers

				hover = { enabled = true, reveal = { "close" } },

				-- INFO: Diagnostics
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = function()
						if level:match("error") then
							return " "
						elseif level:match("warn") then
							return " "
						elseif level:match("hint") then
							return "󰠠 "
						elseif level:match("info") then
							return " "
						end
					end
					return " " .. icon() .. count
				end,

				-- INFO: Groups

				-- groups = {
				-- 	options = {
				-- 		toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
				-- 	},
				-- 	items = {
				-- 		{
				-- 			name = "Tests", -- Mandatory
				-- 			highlight = { underline = false, sp = "#db9c7b" }, -- Optional
				-- 			priority = 2, -- determines where it will appear relative to other groups (Optional)
				-- 			icon = " ", -- Optional
				-- 			auto_close = true,
				-- 			matcher = function(buf)
				-- 				return buf.name:match("%.md") or buf.name:match("%.txt")
				-- 			end,
				-- 		},
				-- 	},
				-- },
			},
		})
	end,
}
