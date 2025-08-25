local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.default_cursor_style = "BlinkingBlock"
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.color_scheme = "Night Owl (Gogh)"
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 12

config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 10

config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}
config.initial_cols = 120
config.initial_rows = 32

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
			end
		end),
	},
}
config.keys = {
    -- activate pane selection mode with the default alphabet (labels are "a", "s", "d", "f" and so on)
    { key='8', mods='CTRL', action=act.PaneSelect },
    -- activate pane selection mode with numeric labels
    { key = '9', mods = 'CTRL', action=act.PaneSelect{alphabet = '1234567890'} },
    -- show the pane selection mode, but have it swap the active and selected panes
    { key='0', mods='CTRL', action=act.PaneSelect{mode='SwapWithActive'} },
    
    -- full screen
    { key="N", mods="CTRL", action = wezterm.action.ToggleFullScreen },
    
    -- arrow keys
    { key="h", mods="CTRL", action=wezterm.action.SendKey{key="LeftArrow"} },
    { key="l", mods="CTRL", action=wezterm.action.SendKey{key="RightArrow"} },
    { key="k", mods="CTRL", action=wezterm.action.SendKey{key="UpArrow"} },
    { key="j", mods="CTRL", action=wezterm.action.SendKey{key="DownArrow"} },
    
    -- move cursor word by word
    { key = "LeftArrow", mods = "OPT", action = wezterm.action{SendString="\x1bb"} },
    { key = "RightArrow", mods = "OPT", action = wezterm.action{SendString="\x1bf"} },

    -- rotate pane
    -- { key = 'b', mods = 'CTRL', action = act.RotatePanes 'CounterClockwise' },
    { key = 'n', mods = 'CTRL', action = act.RotatePanes 'Clockwise' },
}

return config
