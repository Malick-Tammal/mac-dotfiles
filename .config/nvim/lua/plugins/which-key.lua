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
			{ "<leader>?", group = " Which Key?", icon = { icon = "󰌏", color = "blue" } },

			-- Neotree
			{ "<leader>n", group = " Toggle NeoTree", icon = { icon = " ", color = "blue" } },

			-- Delete
			{ "<leader>d", group = "Delete (Black Hole)", icon = { icon = "󰗨", color = "blue" } },

			-- Split
			{ "<leader>s", group = "Split", icon = { icon = "󰯌", color = "red" } },
			{ "<leader>sh", desc = "Horizontally", icon = { icon = "󰯌", color = "blue" } },
			{ "<leader>sv", desc = "Vertically", icon = { icon = "󰯌", color = "blue" } },
			{ "<leader>se", desc = "50/50", icon = { icon = "󰯌", color = "blue" } },
			{ "<leader>sx", desc = "Close", icon = { icon = "󰯌", color = "blue" } },

			-- Mason
			{ "<leader>m", group = "Mason", icon = { icon = "󰉩", color = "blue" } },

			-- Exit
			{ "<leader>q", group = "Quit", icon = { icon = "󰩈", color = "red" } },
			{ "<leader>qq", desc = "Quit without saving!", icon = { icon = "󰈆", color = "red" } },
			{ "<leader>qw", desc = "Quit and save!", icon = { icon = "󰈆", color = "red" } },

			-- Buffers
			{ "<leader>b", group = "Buffers", icon = { icon = "", color = "red" } },
			{ "<leader>bb", desc = "New", icon = { icon = "", color = "blue" } },
			{ "<leader>bx", desc = "Close", icon = { icon = "", color = "blue" } },

			-- Telescop
			{ "<leader>f", desc = "Telescope", icon = { icon = "", color = "red" } },

			-- Tabs
			{ "<leader>t", desc = "Tabs", icon = { icon = "󱃢", color = "red" } },

			-- Diagnostics
			{ "<leader>e", desc = "Diagnostics", icon = { icon = "󰮄", color = "red" } },

			-- Code
			{ "<leader>c", desc = "Code", icon = { icon = "", color = "red" } },
			{ "<leader>cs", desc = "Save", icon = { icon = "󰆓", color = "red" } },
			{ "<leader>cn", desc = "Save without format", icon = { icon = "󰽂", color = "red" } },
			{ "<leader>cf", desc = "Format", icon = { icon = "󰉿", color = "red" } },
		})
		wk.setup({
			preset = "helix",
			icons = {
				group = " ",
			},
		})
	end,
}
