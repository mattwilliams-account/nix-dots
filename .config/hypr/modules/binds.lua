---------------------
---- MY PROGRAMS ----
---------------------
local terminal = "kitty"
local fileManager = "dolphin"
local menu = "rofi -show drun"
local browser = "helium-browser"

---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local secMod = "SUPER + SHIFT" -- Sets "Windows + Shift as secondary modifier"
local ctrMod = "SUPER + CTRL" -- sets "Windows + ctrl as alternative modifier"
-----------------------------
--- APPLICATION LAUNCHERS ---
-----------------------------
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal), { description = "open terminal" })
hl.bind(
	mainMod .. " + H",
	hl.dsp.exec_cmd("dms ipc call clipboard toggle"),
	{ description = "shows clipboard history" }
)
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("dms ipc call processlist focusOrToggle"),
	{ description = "toggles processlist" }
)
hl.bind(
	mainMod .. " + comma",
	hl.dsp.exec_cmd("dms ipc call settings focusOrToggle"),
	{ description = "toggles dms settings menu" }
)
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("dms ipc call notepad toggle"), { description = "toggles notpad" })
hl.bind(
	secMod .. " + N",
	hl.dsp.exec_cmd("dms ipc call notifications toggle"),
	{ description = "toggles notifications" }
)
hl.bind(
	mainMod .. " + Y",
	hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"),
	{ description = "toggles wallpaper selection menu" }
)
hl.bind(
	mainMod .. " + TAB",
	hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"),
	{ description = "toggles workspace overview" }
)
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("dms ipc call powermenu toggle"), { description = "toggles powermenu" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser), { description = "spawns browser" })
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu), { description = "spawns finder menu" })
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager), { description = "spawns fileManager" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("rofi -show emoji"), { description = "spawns emoji picker" })
hl.bind(secMod .. " + C", hl.dsp.exec_cmd("dms color pick --rgb --autocopy"), { description = "spawns color picker" })

-------------------
--- CHEAT SHEET ---
------------------
hl.bind(
	secMod .. " + slash",
	hl.dsp.exec_cmd("dms ipc call keybinds toggle hyprland"),
	{ description = "spawns keybind cheatsheet" }
)

----------------
--- SECURITY ---
----------------
hl.bind(secMod .. " + L", hl.dsp.exec_cmd("dms ipc call lock lock"), { description = "locks user session" })
hl.bind(secMod .. " + E", hl.dsp.exec_cmd("exit"), { description = "exit escape shortcut" })

----------------------
--- AUDIO CONTROLS ---
----------------------
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("dms ipc call audio increment 3"),
	{ description = "increases audio by 3" }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("dms ipc call audio decrement 3"),
	{ description = "lowers audio by 3" }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("dms ipc call audio mute"), { description = "mutes output audio" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("dms ipc call audio micmute"), { description = "mutes input(mic) audio" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("dms ipc call mpris playPause"), { description = "pauses active media" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("dms ipc call mpris playPause"), { description = "resumes paused media" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("dms ipc call mpris previous"), { description = "rewinds to previous media" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("dms ipc call mpris next"), { description = "skips to next media" })
hl.bind(
	ctrMod .. " + XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("dms ipc call mpris increment 3"),
	{ description = "alternative call to increase audio" }
)
hl.bind(
	ctrMod .. " + XF86AudioLowerVolume",
	hl.dsp.exec_cmd("dms ipc call mpris decrement 3"),
	{ description = "alternative call to decrement audio" }
)
hl.bind(secMod .. " + M", hl.dsp.exec_cmd("dms ipc call audio micmute"), { description = "mute mic" })

---------------------------
--- BRIGHTNESS CONTROLS ---
---------------------------
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("dms ipc call brightness increment 5 "),
	{ description = "increments brightness by 5" }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("dms ipc call brightness decrement 5 "),
	{ description = "decrements brightness by 5" }
)

-----------------------
--- WINDOW MOVEMENT ---
-----------------------
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "kill active window" })
hl.bind(mainMod .. " + V", hl.dsp.window.fullscreen({ mode = 1 }), { description = "maximize focused window" })
hl.bind(
	secMod .. " + F",
	hl.dsp.window.fullscreen({ mode = 0 }),
	{ description = "exculsive fullscreen focused window" }
)
hl.bind(
	secMod .. " + T",
	hl.dsp.exec_cmd("togglefloating"),
	{ description = "toggle floating behavior for focused window" }
)
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("togglegroup"), { description = "toggle group for focused window" })
hl.bind(
	secMod .. " + W",
	hl.dsp.exec_cmd("dms ipc call window-rules toggle"),
	{ description = "idrk tbh something with dms" }
)

-- secondaryMod + Arrow Keys: Move active window
hl.bind(secMod .. " + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(secMod .. " + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(secMod .. " + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(secMod .. " + down", hl.dsp.window.move({ direction = "d" }))

------------------------
--- FOCUS NAVIGATION ---
------------------------
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }), { description = "move focus left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "move focus right" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }), { description = "move focus up" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }), { description = "move focus down" })
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(secMod .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

------------------
----MISC RULES ---
------------------
hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})
