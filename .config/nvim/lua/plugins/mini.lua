return {
	"echasnovski/mini.nvim",
	version = "*",
	specs = {
		{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
	},
	config = function()
		-- INFO: Replace Davicons with mini icons
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
		-- INFO: Auto pairs
		require("mini.pairs").setup()
	end,
}
