local vars = require("variables")

-- Personal Bluefin/KatsOS monitor and display configuration.
hl.monitor({
    output = "DP-2",
    mode = "3840x2160@144",
    position = "auto",
    scale = "1.5",
    vrr = 2,
    bitdepth = 10,
    cm = "hdr",
})

hl.monitor({
    output = "DP-3",
    mode = "3840x2160@144",
    position = "auto",
    scale = "1.5",
    vrr = 2,
    bitdepth = 10,
    cm = "hdr",
})

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
    render = {
        cm_auto_hdr = 0,
    },
})

hl.env("XCURSOR_SIZE", "32")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_SCALE_FACTOR", "1")

-- Keep workspaces 1-10 on DP-2 and 11-20 on DP-3.
for i = 1, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "DP-2",
        default = i == 1,
    })
end

for i = 11, 20 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "DP-3",
        default = i == 11,
    })
end

-- Preserve the old relative workspace selection behavior on Super+0-9.
for i = 1, 10 do
    local key = tostring(i % 10)
    local bind = vars.kbGoToWs .. " + " .. key
    hl.unbind(bind)
    hl.bind(bind, hl.dsp.focus({ workspace = "r~" .. i }))
end

-- Personal app binding kept separate from upstream keybinds so future
-- Caelestia updates can replace the managed defaults cleanly.
hl.bind("SUPER + G", hl.dsp.exec_cmd(vars.gituiclient))
