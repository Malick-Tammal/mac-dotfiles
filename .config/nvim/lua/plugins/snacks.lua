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
			"<leader>g",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
			mode = "n",
		},

		{
			"<leader>cd",
			function()
				Snacks.dim()
			end,
			desc = "Dim",
			mode = "n",
		},

		{
			"<leader>cD",
			function()
				Snacks.dim.disable()
			end,
			desc = "UnDim",
			mode = "n",
		},

		{
			"<leader>t",
			function()
				Snacks.terminal()
			end,
			desc = "Terminal",
			mode = "n",
		},
	},

	-- HACK: Config

	---@type snacks.Config
	opts = {
		-- INFO: Animation
		animate = {
			fps = 60,
			easing = "linear",
			duration = {
				step = 10,
				total = 500,
			},
		},

		-- INFO: Scroll animation
		scroll = { enabled = true },

		-- INFO: Dimming
		dim = {
			enabled = true,
		},

		-- INFO: Indent
		indent = {
			enabled = true,
			priority = 1,
		},

		-- INFO: Word highlight
		words = { enabled = true },

		-- INFO: Picker (Buffers / Smart file picker)
		picker = { enabled = true },

		-- INFO: Bigfile saver
		bigfile = {
			enabled = true,
			notify = true,
			size = 1.5 * 1024 * 1024, -- 1.5mb
		},

		-- INFO: Quick file rendering
		quickfile = { enabled = true },

		-- INFO: Terminal
		terminal = {
			enabled = true,
		},

		-- INFO: Dashboard (welcome screen)
		dashboard = {
			preset = {
				header = [[
███╗   ███╗ █████╗ ██╗     ██╗ ██████╗██╗  ██╗
████╗ ████║██╔══██╗██║     ██║██╔════╝██║ ██╔╝
██╔████╔██║███████║██║     ██║██║     █████╔╝ 
██║╚██╔╝██║██╔══██║██║     ██║██║     ██╔═██╗ 
██║ ╚═╝ ██║██║  ██║███████╗██║╚██████╗██║  ██╗
      ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝ ╚═════╝╚═╝  ╚═╝ .dev
				]],
			},

			keys = {
				{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
				{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
				{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
				{
					icon = " ",
					key = "c",
					desc = "Config",
					action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
				},
				{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
			},
		},
	},
}
