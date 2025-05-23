return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
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
				jsonc = { "prettier" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
				async = false,
			},

			notify_on_error = true,
			notify_no_formatters = true,
		})
	end,
}
