-- Display configuration.
-- List monitors and supported modes with: hyprctl monitors all
--
-- Ported from the pre-Quattro monitors.conf + workspaces.conf.

-- Both displays here are standard-density, so GTK gets no extra multiplier.
-- Omarchy's stock value is 2, which targets retina-class panels (13" 2.8K,
-- 27" 5K, 32" 6K). NOTE: changing this needs a Hyprland RELAUNCH, not a reload.
local omarchy_gdk_scale = 1
local omarchy_monitor_scale = "auto"

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

-- Fallback for any display not named below; "auto" is a fine guess for unknown
-- hardware, just not for the two panels configured explicitly underneath.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Laptop panel, anchored at the origin.
-- Pinned to scale 1 rather than "auto": this is a 16.2" 1920x1080 panel (~136
-- DPI, standard density) and Quattro's "auto" resolves it to 2x, which leaves
-- only 960x540 of logical space and makes everything look zoomed in.
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = 1 })

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
