-- Personal input overrides. Settings here replace Omarchy's defaults.
--
-- Ported from the pre-Quattro input.conf. Most of that file is now redundant:
-- Quattro's defaults already set repeat_rate = 40, numlock_by_default = true,
-- touchpad.scroll_factor = 0.4, and the per-app terminal scroll rules
-- (Alacritty/kitty/foot 1.5, ghostty 0.2). Only the repeat delay still differs.
hl.config({
  input = {
    -- Quattro defaults to 250; the old input.conf used a longer 600ms hold.
    repeat_delay = 600,
  },
})

-- NOTE: kb_options.
-- The old input.conf set exactly "compose:caps". Quattro defaults to
-- "compose:caps,shift:both_capslock_cancel", which keeps Caps-as-compose and
-- puts actual Caps Lock on both-Shifts-together (self-clearing on a misfire).
-- That is a superset of the old behaviour, so it is left at the default.
-- Uncomment to go back to the old value exactly:
-- hl.config({ input = { kb_options = "compose:caps" } })
