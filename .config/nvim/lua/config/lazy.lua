-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {

		-- Plugins

		require("plugins.colortheme"),

		require("plugins.notify"),

		require("plugins.neotree"),

		require("plugins.lsp.mason"),

		require("plugins.lsp.conform"),

		require("plugins.lsp.lsp_config"),

		require("plugins.lsp.cmp"),

		require("plugins.treesitter"),

		require("plugins.incline"),

		{
			"echasnovski/mini.nvim",
			version = "*",
			config = function()
				require("mini.pairs").setup()
			end,
		},

		require("plugins.telescope"),

		require("plugins.bufferline"),

		{
			"nvim-tree/nvim-web-devicons",
		},

		require("plugins.which-key"),

		require("plugins.snacks"),

		{
			"numToStr/Comment.nvim",
			event = "VeryLazy",
			lazy = true,
			config = function()
				require("Comment").setup()
			end,
		},

		require("plugins.lualine"),

		require("plugins.noice"),

		require("plugins.terraform"),

		-- Auto update plugins
		checker = { enabled = false },
	},
	ui = {
		border = "rounded",
		size = {
			width = 0.8,
			height = 0.8,
		},
	},
})
