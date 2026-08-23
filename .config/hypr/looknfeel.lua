-- Personal look'n'feel overrides.
--
-- Ported from the pre-Quattro looknfeel.conf. The gaps and layout blocks in
-- that file were entirely commented out, so rounding is the only real override.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
  decoration = {
    -- Quattro defaults to 0 (square corners).
    rounding = 8,
  },
})
