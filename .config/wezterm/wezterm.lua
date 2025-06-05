local wezterm = require("wezterm")
local action = wezterm.action

local config = {
	-- INFO: Theme
	color_scheme = "Everforest Dark Hard (Gogh)",

	-- INFO: Window
	window_decorations = "INTEGRATED_BUTTONS",
	window_padding = {
		left = 20,
		right = 0,
		top = 80,
		bottom = 0,
	},
	window_background_opacity = 0.7,
	macos_window_background_blur = 40,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,

	-- INFO: Font
	font = wezterm.font("MesloLGL Nerd Font", { weight = "Bold" }),
	font_size = 15,
	window_frame = {
		font = wezterm.font("MesloLGL Nerd Font", { weight = "Bold" }),
	},

	-- INFO: Keybinds
	keys = {
		{
			key = "T",
			mods = "CMD",
			action = action.EmitEvent("toggle-opacity"),
		},
		{
			key = "O",
			mods = "CMD",
			action = action.SpawnCommandInNewWindow({
				args = { os.getenv("SHELL"), "-c", "open ." },
			}),
		},
		{
			key = "H",
			mods = "CMD",
			action = action.SpawnCommandInNewWindow({
				args = { os.getenv("SHELL"), "-c", "open ." },
			}),
		},
	},
	-- Toggle opacity function
	wezterm.on("toggle-opacity", function(window, pane)
		local overrides = window:get_config_overrides() or {}
		if not overrides.window_background_opacity then
			overrides.window_background_opacity = 1.0
		else
			overrides.window_background_opacity = nil
		end
		window:set_config_overrides(overrides)
	end),

	-- INFO: Performence
	front_end = "OpenGL",
	animation_fps = 250,
	max_fps = 250,

	-- INFO: Close confirm message
	window_close_confirmation = "NeverPrompt",
}

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup({
	options = {
		icons_enabled = true,
		theme = "Everforest Dark Hard (Gogh)",
		tabs_enabled = true,
		theme_overrides = {},
		section_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
		component_separators = {
			left = wezterm.nerdfonts.pl_left_soft_divider,
			right = wezterm.nerdfonts.pl_right_soft_divider,
		},
		tab_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
	},
	sections = {
		tabline_a = {},
		tabline_b = {},
		tabline_c = {},
		tab_active = {
			"process",
			{ "parent", padding = { right = 4 } },
			{ "cwd", padding = { right = 4 } },
		},
		tab_inactive = { "index", "process" },
		tabline_x = {},
		tabline_y = {},
	},
	extensions = {},
})
return config
