local wezterm = require("wezterm")
local action = wezterm.action

local config = wezterm.config_builder()

-- INFO: Theme
config.color_scheme = "Everforest Dark Hard (Gogh)"

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
	{
		key = "H",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "V",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "X",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "J",
		mods = "CMD",
		action = wezterm.action({ ActivatePaneDirection = "Next" }),
	},
	{
		key = "K",
		mods = "CMD",
		action = wezterm.action({ ActivatePaneDirection = "Prev" }),
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "DownArrow",
		mods = "CMD",
		action = action.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "UpArrow", mods = "CMD", action = action.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "RightArrow",
		mods = "CMD",
		action = action.AdjustPaneSize({ "Right", 5 }),
	},
}

-- TIP: Toggle opacity function
wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 1.0
	else
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

-- INFO: Window
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
	left = 20,
	right = 10,
	top = 30,
	bottom = 10,
}
config.window_background_opacity = 0.8
config.macos_window_background_blur = 40
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 1600
config.tab_and_split_indices_are_zero_based = false

-- INFO: Font
config.font = wezterm.font("MesloLGL Nerd Font", { weight = "Bold" })
config.font_size = 15
config.window_frame = {
	font = wezterm.font("MesloLGL Nerd Font", { weight = "Bold" }),
}

-- INFO: Performence
config.front_end = "OpenGL"
config.animation_fps = 250
config.max_fps = 250

-- INFO: Close confirm message
config.window_close_confirmation = "NeverPrompt"

config.colors = {
	tab_bar = {
		background = "#1E2326",
	},
}

-- INFO: Tabline plugin
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		icons_enabled = true,
		theme = "Everforest Dark Hard (Gogh)",
		tabs_enabled = true,
		theme_overrides = {},
		section_separators = {
			left = "",
			right = "",
		},
		component_separators = {
			left = "",
			right = "",
		},
		tab_separators = {
			left = "",
			right = "",
		},
	},
	sections = {
		tabline_a = {},
		tabline_b = {},
		tabline_c = {},
		tab_active = {
			"index",
			{ "parent", padding = 0 },
			"/",
			{ "cwd", padding = { left = 0, right = 1 } },
			{ "zoomed", padding = 0 },
		},
		tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
		tabline_x = { "battery" },
		tabline_y = { "datetime" },
		tabline_z = { "  Malick.dev " },
	},
	extensions = {},
})

return config
