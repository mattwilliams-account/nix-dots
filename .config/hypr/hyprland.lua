require("modules.monitors")
require("modules.binds")
require("modules.autostart")
require("modules.env")
require("modules.apperance")
require("modules.windows")
require("modules.colors")
--require("dms.colors")

--------------
--- COLORS ---
--------------
local colors_mod
local colors_ok
colors_ok, colors_mod = pcall(require, "modules.colors")

local function get_color(key)
	if colors_ok then
		return colors_mod.colors[key] .. "ff"
	end
	-- fallbacks
	local defaults = {
		primary = "#6750a4ff",
		surface_variant = "#49454fff",
	}
	return defaults[key] or "#ffffffff"
end

hl.config({
	general = {
		col = {
			active_border = get_color("primary"),
			inactive_border = get_color("surface_variant"),
		},
	},
})
--------------
---- INPUT ----
---------------
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
	},
})
----------------
--- DEVICES ----
----------------
--- diables ps5 touchpad from acting like fuck ass mouse
hl.device({
	name = "sony-interactive-entertainment-dualsense-wireless-controller-touchpad",
	enabled = false,
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
--hl.device({
--name = "epic-mouse-v1",
--sensitivity = -0.5,
--})
