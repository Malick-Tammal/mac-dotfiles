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
			desc = "Finder",
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
			desc = "Zen Mode",
			mode = "n",
		},

		{
			"<leader>gl",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
			mode = "n",
		},
	},

	-- HACK: Config

	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = false },
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
