---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font             = "SFMono 12.5"

theme.bg_normal        = "#eff1f5"
theme.bg_focus         = "#eff1f5"
theme.bg_occupied      = "#eff1f5"
theme.bg_urgent        = "#eff1f5"
theme.bg_minimize      = "#eff1f5"
theme.bg_systray       = theme.bg_normal

theme.fg_normal        = "#4c4f69"
theme.fg_focus         = "#fe640b"
theme.fg_occupied      = "#2a6ef5"
theme.fg_urgent        = "#4c4f69"
theme.fg_minimize      = "#4c4f69"

theme.useless_gap         = dpi(6)
theme.border_width        = dpi(0)
theme.border_color_normal = "#bcc0cc"
theme.border_color_active = "#40a02b"
theme.border_color_marked = "#40a02b"

theme.black   = "#ccd0da"
theme.white   = "#4c4f69"
theme.red     = "#d20f39"
theme.green   = "#40a02b"
theme.yellow  = "#e49320"
theme.blue    = "#2a6ef5"
theme.magenta = "#7287fd"
theme.cyan    = "#209fb5"
theme.orange  = "#fe640b"
theme.gray    = "#bcc0cc"

theme.systray_icon_spacing = 5

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
theme.taglist_bg_focus = theme.bg_focus
theme.taglist_fg_focus = theme.fg_focus
theme.taglist_bg_occupied = theme.bg_occupied
theme.taglist_fg_occupied = theme.fg_occupied

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

theme.wallpaper = '/home/younix/Dropbox/Pictures/Wallpapers/catppuccin/light/wavy_lines_v02_5120x2880.png'

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = theme.bg_normal, fg = theme.red }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80