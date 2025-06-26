return {
	"MeanderingProgrammer/render-markdown.nvim",
	event = { "BufReadPre", "BufNewFile" },
	ft = { "markdown", "Avante" },

	opts = {
		file_types = { "markdown", "Avante" },
		checkbox = { -- {{{
			enabled = true,
			right_pad = 1,

			checked = {
				icon = " ",
			},
			unchecked = {
				icon = "󰄱 ",
			},
			indeterminate = {
				icon = " ",
			},

			custom = {
				todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
			},
		}, -- }}}
	},
}
