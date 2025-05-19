return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- Web
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettier" },

				-- Config
				lua = { "stylua" },
				toml = { "pyproject-fmt" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				zsh = { "beautysh" },
			},

			format_on_save = {
				timeout_ms = 500,
			},

			format_after_save = {
				command = "echo fallback",
			},

			notify_on_error = true,
			notify_no_formatters = true,

			formatters = {
				my_formatters = {
					command = "echo malick",
				},
			},
		})
	end,
}
