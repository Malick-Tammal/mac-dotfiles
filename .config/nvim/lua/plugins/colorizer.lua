return {
	"norcalli/nvim-colorizer.lua",
	event = "VeryLazy",
	lazy = true,
	config = function()
		local colorizer = require("colorizer")
		colorizer.setup()
	end,
}
