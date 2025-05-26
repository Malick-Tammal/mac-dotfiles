return {
	"hashivim/vim-terraform",
	init = function()
		-- INFO: Notify when file saved
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			pattern = "*,*",
			command = "echo expand('%:t') . ' Saved!'",
		})
	end,
}
