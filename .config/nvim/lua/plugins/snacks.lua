return {
	"folke/snacks.nvim",
	event = "UIEnter",
	priority = 1000,
	-- HACK: Keymaps
	keys = {
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
			fps = 240,
			easing = "linear",
			duration = {
				step = 10,
				total = 500,
			},
		},

		-- INFO: Smooth scroll
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
		words = { enabled = false },

		-- INFO: Picker (Buffers / Smart file picker)
		picker = { enabled = true },

		-- INFO: Bigfile saver
		bigfile = {
			enabled = true,
			notify = true,
			size = 1.5 * 1024 * 1024, -- 1.5mb
		},

		notifier = {
			enabled = true,
			timeout = 1000,
			margin = { top = 1, right = 2, bottom = 0 },
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
				keys = {
					{
						icon = "󰅨 ",
						key = "p",
						desc = "Projects",
						action = ":lua require('plugins.custom.projects').setup()",
					},
					{ icon = "󰊢 ", key = "g", desc = "Lazy git", action = ":lua Snacks.lazygit() " },
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				header = [[
           ▄ ▄                   
       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     
       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     
    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     
  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  
  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄
▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █
█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █
    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    
	 
[malick.dev]
				]],
			},
		},
	},
}
