return {
	"hashivim/vim-terraform",
	lazy = true,
	event = "VeryLazy",
	init = function()
		-- INFO: Notify when file saved
		-- vim.api.nvim_create_autocmd({ "BufWrite" }, {
		-- 	pattern = "*,*",
		-- 	command = "echo expand('%:t') . ' Saved!'",
		-- })
	end,
}
