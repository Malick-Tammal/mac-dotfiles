return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	-- enabled = false,
	config = function()
		require("notify").setup({
			background_colour = "#000000",
			render = "compact",
			stages = "slide",
			fps = 240,
			max_height = 8,
			max_width = 150,
			timeout = 1000,
			level = 2,
			time_formats = {
				notification = " %H:%M",
				notification_history = " %H:%M",
			},
		})
		vim.notify = require("notify")
	end,
}
