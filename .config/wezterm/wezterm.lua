local wezterm = require("wezterm")
local action = wezterm.action
local config = {}

-- INFO: Theme
config.color_scheme = "Everforest Dark Hard (Gogh)"

-- INFO: Window
config.window_decorations = "INTEGRATED_BUTTONS"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 20,
	right = 0,
	top = 80,
	bottom = 0,
}
config.window_background_opacity = 0.65
config.macos_window_background_blur = 30

-- INFO: Font
config.font = wezterm.font("MesloLGL Nerd Font", { weight = "Bold" })
config.font_size = 15
config.window_frame = {
	font = wezterm.font("MesloLGL Nerd Font", { weight = "Bold" }),
}

-- INFO: Keybinds
config.keys = {
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
}

-- Toggle opacity function
wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 1.0
	else
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

config.animation_fps = 60
config.max_fps = 60

return config
