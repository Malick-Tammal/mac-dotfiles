return {
	"b0o/incline.nvim",
	event = "VeryLazy",
	config = function()
		local helpers = require("incline.helpers")
		local devicons = require("nvim-web-devicons")
		require("incline").setup({
			window = {
				placement = {
					horizontal = "right",
					vertical = "bottom",
				},
				margin = {
					horizontal = 1,
					vertical = 2,
				},
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if filename == "" then
					filename = "[No Name]"
				end
				local ft_icon, ft_color = devicons.get_icon_color(filename)
				local modified = vim.bo[props.buf].modified
				return {
					ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
					" ",
					{ filename, gui = modified and "bold,italic" or "bold" },
					" ",
				}
			end,
		})
	end,
}
