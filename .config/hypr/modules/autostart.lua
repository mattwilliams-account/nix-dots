-------------------
---- AUTOSTART ----
-------------------
-- Autostart necessary processes (like notifications daemons, status bars, etc.)
hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprland-session.target")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("dms start")
end)
