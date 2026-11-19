local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
    return
end

copilot.setup({
    suggestion = {
        -- Show ghost text as you type instead of waiting for <M-]>
        auto_trigger = true,
        -- Truncate suggestions to N lines (incl. current line). Enough for an
        -- if/for block, not a whole function. Lines past this are discarded.
        max_lines = 5,
        -- ms to wait after a keystroke before requesting. Default is already
        -- near-zero; the network round-trip is the real latency.
        debounce = 15,
        keymap = {
            accept = "<C-l>",      -- accept whole suggestion
            accept_line = "<M-l>", -- accept just the next line
            accept_word = "<M-w>", -- accept just the next word
        },
    },
})
