return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	lazy = true,

	-- HACK: Config

	opts = {
		options = {
			mode = "buffers",

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
					highlight = "BufferLineNeoTree",
				},
			},
			themable = true,
			indicator = {
				icon = "  ",
				style = "icon",
			},
			show_close_icon = true,
			show_buffer_close_icons = true,
			buffer_close_icon = "󱎘 ",
			close_icon = " ",
			modified_icon = "󰤌 ",
			close_command = "lua MiniBufremove.delete()",
			right_command = "lua MiniBufremove.delete()",
			tab_size = 20,
			color_icons = true,
			separator_style = "thin",
			-- numbers = "ordinal", -- Show numbers

			hover = { enabled = true, reveal = { "close" } },

			-- INFO: Diagnostics
			diagnostics = "nvim_lsp",

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
	},
}
