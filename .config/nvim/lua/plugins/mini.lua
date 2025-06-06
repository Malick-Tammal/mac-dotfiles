return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	version = "*",
	specs = {
		{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
	},
	config = function()
		-- INFO: Replace Davicons with mini icons
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end

		require("mini.bufremove").setup()
		require("mini.comment").setup()
		require("mini.surround").setup({
			silent = true,
			mappings = {
				add = "ma", -- Add surrounding in Normal and Visual modes
				delete = "md", -- Delete surrounding
				find = "mf", -- Find surrounding (to the right)
				find_left = "mF", -- Find surrounding (to the left)
				highlight = "mh", -- Highlight surrounding
				replace = "mr", -- Replace surrounding
				update_n_lines = "mn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
			custom_surroundings = {
				t = {
					input = { "<(%w+)[^<>]->.-</%1>", "^<()%w+().*</()%w+()>$" },
					output = function()
						local tag_name = MiniSurround.user_input(" Tag name")
						if tag_name == nil then
							return nil
						end
						return { left = tag_name, right = tag_name }
					end,
				},
			},
		})
	end,
}
