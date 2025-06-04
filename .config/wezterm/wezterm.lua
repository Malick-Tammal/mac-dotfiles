local wezterm = require("wezterm")
local action = wezterm.action

local config = {
	-- INFO: Theme
	color_scheme = "Everforest Dark Hard (Gogh)",

	-- INFO: Window
	window_decorations = "INTEGRATED_BUTTONS",
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 20,
		right = 0,
		top = 80,
		bottom = 0,
	},
	window_background_opacity = 0.75,
	macos_window_background_blur = 30,

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

return config
