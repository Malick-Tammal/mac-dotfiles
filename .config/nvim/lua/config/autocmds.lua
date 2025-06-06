vim.api.nvim_create_autocmd({ "LspProgress" }, {
	callback = function(context)
		vim.notify(context)
		-- or vim.print(context) if you want something less invasive
	end,
})
