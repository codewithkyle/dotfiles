-- Display configuration.
-- List monitors and supported modes with: hyprctl monitors all
--
-- Ported from the pre-Quattro monitors.conf + workspaces.conf.

local omarchy_gdk_scale = 2
local omarchy_monitor_scale = "auto"

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

-- Fallback for any display not named below.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Laptop panel, anchored at the origin.
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = omarchy_monitor_scale })

-- External ultrawide, placed to the LEFT of the laptop panel.
--
-- The old monitors.conf said "-1920x0", which assumed eDP-1 occupied 1920
-- logical pixels. Under Quattro eDP-1 auto-scales to 2x, so it is only 960
-- logical pixels wide and "-1920x0" would overlap it. Anchoring the ultrawide's
-- RIGHT edge at x=0 puts it cleanly left of the laptop at any eDP-1 scale:
-- 3440 logical px wide at scale 1 means position -3440.
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "-3440x0", scale = 1 })

-- Workspace-to-monitor pinning (was workspaces.conf).
hl.workspace_rule({ workspace = "1", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1" })
