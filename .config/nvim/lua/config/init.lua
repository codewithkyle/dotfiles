require("config.set")
require("config.remap")

-- OSC 52 clipboard provider for tmux / SSH / herdr sessions, so yanks reach the
-- machine you are actually sitting at. Self-gating: outside those it returns
-- early, leaving the normal wl-copy clipboard untouched.
require("config.remote_clipboard").setup()
