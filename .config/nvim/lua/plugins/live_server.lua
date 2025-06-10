return {
	"barrett-ruth/live-server.nvim",
	event = "VeryLazy",
	build = "npm add -g live-server",
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = true,
}
