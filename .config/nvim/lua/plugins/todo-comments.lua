return {
	"folke/todo-comments.nvim",
	lazy = true,
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	-- TODO: configure it
	-- NOTE: Options
	opts = {
		keywords = {
			HACK = { icon = " ", color = "warning" },
			PERF = { icon = "󰓅 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
	},
}
