return {
	"folke/snacks.nvim",
	event = "UIEnter",
	priority = 1000,

	-- HACK: Keymaps
	keys = {
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Find files",
		},

		{
			"<leader>g",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},

		{
			"<leader>u",
			function()
				Snacks.picker.buffers()
			end,
			desc = "List buffers",
		},
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
			mode = "n",
		},
		{
			"<leader>n",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
	},

	-- HACK: Config

	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = false },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
}
