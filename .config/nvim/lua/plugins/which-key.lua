return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	lazy = true,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Which-key 'I know you forget'",
		},
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			-- Which Key (All info)
			{ "<leader>?", group = "Which Key?", icon = { icon = "󰌏 ", color = "blue" } },

			-- Neotree
			{ "<leader>n", group = "Explorer", icon = { icon = "󰲂 ", color = "yellow" } },

			-- Delete
			{ "<leader>x", group = "Delete (Black Hole)", icon = { icon = "󰗨", color = "red" } },

			-- Split
			{ "<leader>s", group = "Split", icon = { icon = "󰯌 ", color = "blue" } },
			{ "<leader>sh", desc = "Horizontally", icon = { icon = " ", color = "yellow" } },
			{ "<leader>sv", desc = "Vertically", icon = { icon = " ", color = "orange" } },
			{ "<leader>se", desc = "50/50", icon = { icon = " ", color = "blue" } },
			{ "<leader>sx", desc = "Close", icon = { icon = " ", color = "red" } },

			-- Mason
			{ "<leader>m", group = "Mason", icon = { icon = "󰉡 ", color = "orange" } },

			-- Quit
			{ "<leader>q", group = "Quit", icon = { icon = "󰩈 ", color = "red" } },
			{ "<leader>qq", desc = "Quit without saving!", icon = { icon = "󰽂 ", color = "red" } },
			{ "<leader>qw", desc = "Quit and save!", icon = { icon = "󰆓 ", color = "yellow" } },

			-- Buffers
			{ "<leader>b", group = "Buffers", icon = { icon = " ", color = "blue" } },
			{ "<leader>bb", desc = "New", icon = { icon = " ", color = "yellow" } },
			{ "<leader>bx", desc = "Close", icon = { icon = " ", color = "red" } },
			{ "<leader>bf", desc = "Find", icon = { icon = " ", color = "orange" } },

			-- Telescope
			-- { "<leader>f", desc = "Telescope", icon = { icon = "", color = "red" } },
			{ "<leader>h", desc = "Help tags", icon = { icon = "󰞋 ", color = "green" } },
			{ "<leader>G", desc = "Grep", icon = { icon = "󰈞 ", color = "cyan" } },

			-- Tabs
			{ "<leader>T", desc = "Tabs", icon = { icon = "󱃢 ", color = "purple" } },

			-- Diagnostics
			{ "<leader>d", desc = "Diagnostics", icon = { icon = " ", color = "green" } },
			{ "<leader>dt", desc = "Toggle", icon = { icon = " ", color = "yellow" } },

			-- Code
			{ "<leader>c", desc = "Code", icon = { icon = " ", color = "orange" } },
			{ "<leader>cs", desc = "Save", icon = { icon = "󰆓 ", color = "orange" } },
			{ "<leader>cn", desc = "Save without format", icon = { icon = "󰽂 ", color = "orange" } },
			{ "<leader>cf", desc = "Format", icon = { icon = "󰉿 ", color = "blue" } },
			-- Dimming
			{ "<leader>cd", desc = "Dim", icon = { icon = "󱜟 ", color = "yellow" } },
			{ "<leader>cD", desc = "UnDim", icon = { icon = "󰞏 ", color = "yellow" } },

			-- Finder
			{ "<leader><space>", desc = "Finder", icon = { icon = "󱘞 ", color = "orange" } },

			-- Zen mode
			{ "<leader>z", desc = "Zen mode", icon = { icon = " ", color = "cyan" } },

			-- Lazygit
			{ "<leader>g", desc = "Lazygit", icon = { icon = " ", color = "cyan" } },

			-- Terminal
			{ "<leader>t", desc = "Terminal", icon = { icon = " ", color = "purple" } },
		})
		wk.setup({
			preset = "helix",
			icons = {
				group = " ",
			},
		})
	end,
}
