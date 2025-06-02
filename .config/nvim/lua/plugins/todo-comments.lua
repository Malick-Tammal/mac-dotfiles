return {
	"folke/todo-comments.nvim",
	lazy = true,
	event = "VeryLazy",
	-- TODO: configure it
	-- NOTE: Options
	opts = {
		keywords = {
			FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
			HACK = { icon = " ", color = "warning" },
			PERF = { icon = "󰓅 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
		},
		highlight = {
			multiline = false,
		},
	},
}
