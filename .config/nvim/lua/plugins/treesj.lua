return {
	"Wansmer/treesj",
	event = "VeryLazy",
	lazy = true,
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`

	-- HACK: Config
	config = function()
		local treesj = require("treesj")
		treesj.setup({ max_join_length = 300, use_default_keymaps = false })

		-- INFO: Keymaps
		vim.keymap.set("n", "<leader>w", function()
			require("treesj").toggle()
		end, { desc = "split / join" })
	end,
}
