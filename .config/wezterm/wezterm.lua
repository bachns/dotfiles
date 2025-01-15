local wezterm = require("wezterm")

local config = wezterm.config_builder()

--config.automatically_reload_config = true
config.default_cursor_style = "BlinkingBlock"
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.color_scheme = "Night Owl (Gogh)"
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 13

config.background = {
	{
		source = {
			File = "/Users/bachns/.config/wezterm/bg-monterey.jpg",
		},
		hsb = {
			hue = 1.0,
			saturation = 1.02,
			brightness = 0.25,
		},
		width = "100%",
		height = "100%",
	},
	{
		source = {
			Color = "#282c35",
		},
		width = "100%",
		height = "100%",
		opacity = 0.55,
	},
}

config.window_padding = {
	left = 3,
	right = 3,
	top = 3,
	bottom = 3,
}

config.initial_cols = 120
config.initial_rows = 32

return config
