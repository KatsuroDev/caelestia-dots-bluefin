local vars = require("variables")

-- Personal Bluefin/KatsOS bindings kept separate from upstream keybinds so
-- future Caelestia updates can replace the managed defaults cleanly.
hl.bind("SUPER + G", hl.dsp.exec_cmd(vars.gituiclient))
