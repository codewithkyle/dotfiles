-- Personal keybinding overrides.
--
-- Ported from the pre-Quattro bindings.conf. Omarchy Quattro moved its own app
-- launchers to SUPER + SHIFT + <key>, which frees the plain SUPER + <key> row
-- but also means five of these keys now collide with Quattro window-management
-- defaults. Those are unbound first -- see the note above each one.
--
-- See current bindings with: omarchy menu keybindings --print

-- SUPER + RETURN (terminal) is intentionally NOT redefined here.
-- omarchy-launch-terminal already opens in the active terminal's directory,
-- which is exactly what the old `--working-directory="$(omarchy-cmd-terminal-cwd)"`
-- binding did by hand. The Quattro default now covers it.

-- Was: Full screen (SUPER + ALT + F still does full width, SUPER + CTRL + F tiled)
hl.unbind("SUPER + F")
o.bind("SUPER + F", "File manager", { omarchy = "nautilus" })

-- Browser. SUPER + B is free in Quattro; SUPER + SHIFT + B was "Browser".
o.bind("SUPER + B", "Browser", { omarchy = "browser --ozone-platform=x11 --force-device-scale-factor=1 --high-dpi-support=0" })

-- Was: Browser (Quattro keeps private on SUPER + SHIFT + ALT + B)
hl.unbind("SUPER + SHIFT + B")
o.bind("SUPER + SHIFT + B", "Browser (private)", { omarchy = "browser --private --ozone-platform=x11 --force-device-scale-factor=1 --high-dpi-support=0" })

-- Free in Quattro (its Spotify binding lives on SUPER + SHIFT + M)
o.bind("SUPER + M", "Music", { webapp = "https://music.youtube.com" })

-- Was: Toggle window grouping (SUPER + ALT + G still moves a window out of a group)
hl.unbind("SUPER + G")
o.bind("SUPER + G", "Google Drive", { webapp = "https://drive.google.com" })

-- Free in Quattro (its editor binding lives on SUPER + SHIFT + N)
o.bind("SUPER + N", "Editor", { omarchy = "editor" })

-- Was: Toggle window floating/tiling
hl.unbind("SUPER + T")
o.bind("SUPER + T", "Activity", { tui = "btop" })

-- Free in Quattro (its lazydocker binding lives on SUPER + SHIFT + D)
o.bind("SUPER + D", "Docker", { tui = "ducker" })

-- Was: Pop window out (float & pin)
hl.unbind("SUPER + O")
o.bind("SUPER + O", "Obsidian", { launch = "obsidian -disable-gpu --enable-wayland-ime", focus = "^obsidian$" })

-- Free in Quattro (its ChatGPT binding lives on SUPER + SHIFT + A)
o.bind("SUPER + A", "ChatGPT", { webapp = "https://chatgpt.com" })
