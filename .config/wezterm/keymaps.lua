local wezterm = require("wezterm")
local action = wezterm.action

local config = {
	keys = {
		-- {
		-- 	key = "T",
		-- 	mods = "CMD",
		-- 	action = action.EmitEvent("toggle-opacity"),
		-- },
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
	-- wezterm.on("toggle-opacity", function(window, pane)
	-- 	local overrides = window:get_config_overrides() or {}
	-- 	if not overrides.window_background_opacity then
	-- 		overrides.window_background_opacity = 1.0
	-- 	else
	-- 		overrides.window_background_opacity = nil
	-- 	end
	-- 	window:set_config_overrides(overrides)
	-- end),
}

return config
