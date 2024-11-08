local colorbuddy = require("colorbuddy")

colorbuddy.colorscheme("my-color-scheme")

local Color = colorbuddy.Color
local Group = colorbuddy.Group
local colors = colorbuddy.colors
local groups = colorbuddy.groups
local styles = colorbuddy.styles


Color.new("oldWhite", "#C8C093")
Color.new("fujiWhite", "#DCD7BA")
Color.new("sakuraPink", "#D27E99")
Color.new("springGreen", "#98BB6C")
Color.new("yellow", "#f8fe7a")
Color.new("crystalBlue", "#7E9CD8")
Color.new("waveAqua1", "#6A9589")
Color.new("waveAqua2", "#7AA89F")
Color.new("waveBlue1", "#223249")
Color.new("waveBlue2", "#2D4F67")
Color.new("fujiGray", "#727169")
Color.new("oniViolet", "#957FB8")
Color.new("surimiOrange", "#FFA066")
Color.new("waveRed", "#E46876")
Color.new("boatYellow", "#C0A36E")
Color.new("roninYellow", "#FF9E3B")
Color.new("samuraiRed", "#E82424")
Color.new("dragonBlue", "#658594")
Color.new("autumnGreen", "#76946A")
Color.new("autumnRed", "#C34043")
Color.new("autumnYellow", "#DCA561")
Color.new("peachRed", "#FF5D62")
Color.new("background", "#141b23")
-- Color.new("yellow", "#f0c674")
-- Color.new("red", "#cc6666")

Group.new("Normal", colors.fujiWhite, colors.background, styles.none)
-- Group.new("InvNormal", colors.waveBlue1, colors.waveBlue1)
Group.new("NormalFloat", groups.Normal.fg, colors.waveBlue1)
Group.new("FloatBorder", groups.Normal.fg, groups.NormalFloat)

Group.new("LspReferenceRead", nil, colors.waveBlue1)
Group.new("LspReferenceWrite", groups.LspReferenceRead)
-- Group.new("EndOfBuffer", colors.waveBlue1)
Group.new("PMenu", colors.fujiWhite, colors.waveBlue1, styles.none)
Group.new("PMenuSbar", nil, colors.fujiGray)
Group.new("PMenuSel", groups.PMenu.bg, groups.PMenu.fg)
Group.new("PMenuThumb", nil, groups.PMenu.fg)

Group.new("String", colors.waveAqua1, nil, styles.none)
Group.new("Number", colors.sakuraPink, nil, styles.none)
Group.new("Structure", colors.waveRed, nil, styles.none)
Group.new("Keyword", colors.oniViolet, nil, styles.none)
Group.new("Keyword.Faded", groups.nontext.fg:light(), nil, styles.none)

Group.new("Function", colors.crystalBlue, nil, styles.none)
Group.new("Function.Bracket", groups.Normal.fg, groups.Normal)
Group.new("Type", colors.waveAqua2, nil, styles.italic)
Group.new("Type.Builtin", groups.Type, nil, styles.bold)
Group.new("Statement", colors.peachRed, nil, styles.none)
Group.new("Conditional", colors.oniViolet, nil, styles.none)
Group.new("Constant", colors.surimiOrange, nil, styles.bold)
Group.new("Boolean", colors.surimiOrange, nil, styles.none)
Group.new("Operator", colors.boatYellow, nil, styles.none)
Group.new("Include", colors.surimiOrange, nil, styles.none)
Group.new("Label", colors.boatYellow, nil, styles.none)
Group.new("Identifier", groups.Normal)
Group.new("Variable", groups.Normal)
Group.new("Variable.Builtin", colors.waveRed, nil, styles.none)
Group.new("Special", colors.waveRed, nil, styles.none)
Group.new("SpecialChar", colors.boatYellow, nil, styles.none)
Group.new("Folded", colors.fujiGray:dark(), colors.fujiGray:light())
Group.new("MatchParen", colors.peachRed)
Group.new("Search", colors.surimiOrange, colors.waveBlue2)

Group.new("Comment", colors.fujiGray, nil, styles.italic)
-- Group.new("Error", colors.samuraiRed, nil, styles.bold)
-- Group.new("Todo", colors.yellow, colors.red, styles.none) -- not working??
-- Group.new("Warning", colors.roninYellow)

Group.new("DiagnosticError", colors.samuraiRed, nil, styles.bold)
Group.new("DiagnosticWarn", colors.roninYellow, nil, styles.bold)
Group.new("DiagnosticHint", colors.dragonBlue, nil, styles.bold)
Group.new("DiagnosticInfo", colors.waveAqua1, nil, styles.bold)

Group.new("DiffAdd", colors.autumnGreen, nil, styles.none)
Group.new("DiffDelete", colors.autumnRed, nil, styles.none)
Group.new("DiffChange", colors.autumnYellow, nil, styles.none)

Group.new("Cursor", groups.Normal.bg, groups.Normal.fg)
Group.new("CursorLine", nil, groups.Normal.bg:light(0.05))

Group.new("LineNr", colors.fujiGray, colors.background, nil)
Group.new("StatusLine", colors.fujiWhite, colors.background, nil)
-- Group.new("CommandMode", colors.oldWhite, colors.waveAqua1, styles.bold)
-- Group.new("NormalMode", colors.fujiWhite, colors.samuraiRed, styles.bold)
-- Group.new("InsertMode", groups.Visual, groups.Visual)

Group.new("Visual", nil, colors.waveBlue1, nil)
Group.new("VisualMode", groups.Visual, groups.Visual)
Group.new("VisualLineMode", groups.Visual, groups.Visual)
Group.new("TerminalMode", colors.fujiGray, colors.waveBlue1, styles.bold)
Group.new("ReplaceMode", colors.background, colors.roninYellow, styles.bold + styles.underline)

Group.new("HelpDoc", groups.Normal, groups.Normal, styles.bold + styles.italic)
