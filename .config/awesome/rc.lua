-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Timer
local timer = require("gears.timer")

-- Dpi
local dpi = beautiful.xresources.apply_dpi

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Start Picom
awful.util.spawn_with_shell("picom --config ~/.config/picom.conf")
awful.spawn.once("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &")
awful.spawn.once("sh /home/younix/.config/awesome/scripts/start_dropbox &")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("/home/younix/.config/awesome/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
-- }}}

-- {{{ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
        -- awful.layout.suit.tile.left,
        -- awful.layout.suit.tile.bottom,
        -- awful.layout.suit.tile.top,
        -- awful.layout.suit.fair,
        -- awful.layout.suit.fair.horizontal,
        -- awful.layout.suit.spiral,
        -- awful.layout.suit.spiral.dwindle,
        -- awful.layout.suit.max,
        -- awful.layout.suit.max.fullscreen,
        -- awful.layout.suit.magnifier,
        -- awful.layout.suit.corner.nw,
        awful.layout.suit.floating,
    })
end)
-- }}}

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper {
        screen = s,
        widget = {
             horizontal_fit_policy = "fit",
             vertical_fit_policy   = "fit",
             image                 = beautiful.wallpaper,
             widget                = wibox.widget.imagebox,
         },
    }
end)
-- }}}

-- -- System Tray
local systray = wibox.widget.systray()
systray:set_base_size(dpi(28))
-- -- End System Tray

-- -- System Dashboard
-- Battery
local battery_progress = wibox.widget {
    max_value             = 1,
    value                 = 0.65,
    forced_height         = dpi(20),
    forced_width          = dpi(175),
    shape                 = gears.shape.rounded_bar,
    color                 = beautiful.green,
    background_color      = beautiful.gray,
    widget                = wibox.widget.progressbar,
}

local rotated_battery_progress = {
    battery_progress,
    forced_height = dpi(175),
    forced_width  = dpi(20),
    direction     = 'east',
    layout        = wibox.container.rotate,
}

local battery_text = wibox.widget {
    widget = wibox.widget.textbox,
    valign = "center"
}

local battery_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "MesloLGS "..tostring(dpi(34)),
    markup = "<span foreground='"..beautiful.cyan.."'></span>",
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/battery --dec", function(stdout)
            battery_progress.value = tonumber(stdout)
        end)

        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/battery --num", function(stdout)
            battery_text:set_markup("<span font-weight='bold' foreground='"..beautiful.green.."'>"..stdout.."</span>")
        end)

        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/battery --icon", function(stdout)
            battery_icon:set_markup("<span foreground='"..beautiful.green.."'>"..stdout.."</span>")
        end)
    end
}

local battery_popup = wibox.widget {
    {
        rotated_battery_progress,
        margins = {
            left = dpi(5),
            right = dpi(5),
            top = dpi(20),
        },
        widget = wibox.layout.margin,
    },
    {
        battery_text,
        margins = {
            left = dpi(5),
            right = dpi(5),
            top = dpi(8),
        },
        widget = wibox.layout.margin,
    },
    layout = wibox.layout.fixed.vertical,
}

local battery = wibox.widget {
    layout = wibox.layout.fixed.horizontal,
    spacing = dpi(8),
    battery_icon,
}
-- End Battery

-- Brightness
local brightness_progress = wibox.widget {
    max_value             = 1,
    value                 = 0.65,
    forced_height         = dpi(20),
    forced_width          = dpi(175),
    shape                 = gears.shape.rounded_bar,
    color                 = beautiful.yellow,
    background_color      = beautiful.gray,
    widget                = wibox.widget.progressbar,
}

local rotated_brightness_progress = {
    brightness_progress,
    forced_height = dpi(175),
    forced_width  = dpi(20),
    direction     = 'east',
    layout        = wibox.container.rotate,
}

local brightness_text = wibox.widget {
    widget = wibox.widget.textbox,
    valign = "center",
}

local brightness_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "MesloLGS "..tostring(dpi(26)),
    markup = "<span foreground='"..beautiful.yellow.."'></span>",
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/brightness --dec", function(stdout)
            brightness_progress.value = tonumber(stdout)
        end)

        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/brightness --num", function(stdout)
            brightness_text:set_markup("<span font-weight='bold' foreground='"..beautiful.yellow.."'>"..stdout.."</span>")
        end)

        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/brightness --icon", function(stdout)
            brightness_icon:set_markup("<span foreground='"..beautiful.yellow.."'>"..stdout.."</span>")
        end)
    end
}

local brightness_popup = wibox.widget {
    {
        rotated_brightness_progress,
        margins = {
            left = dpi(5),
            right = dpi(5),
            top = dpi(20),
        },
        widget = wibox.layout.margin,
    },
    {
        brightness_text,
        margins = {
            left = dpi(5),
            right = dpi(5),
            top = dpi(8),
        },
        widget = wibox.layout.margin,
    },
    layout = wibox.layout.fixed.vertical,
}

local brightness = wibox.widget {
    layout = wibox.layout.fixed.horizontal,
    spacing = dpi(8),
    brightness_icon,
    buttons = {
        awful.button({}, 4, function()
            awful.spawn("brightnessctl s +5%")
        end),
        awful.button({}, 5, function()
            awful.spawn("brightnessctl s 5%-")
        end),
    }
}
-- End Brightness

-- Volume
local volume_progress = wibox.widget {
    max_value             = 1,
    value                 = 0.65,
    forced_height         = dpi(20),
    forced_width          = dpi(175),
    shape                 = gears.shape.rounded_bar,
    color                 = beautiful.cyan,
    background_color      = beautiful.gray,
    widget                = wibox.widget.progressbar,
}

local rotated_volume_progress = {
    volume_progress,
    forced_height = dpi(175),
    forced_width  = dpi(20),
    direction     = 'east',
    layout        = wibox.container.rotate,
}

local volume_text = wibox.widget {
    widget = wibox.widget.textbox,
}

local volume_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "Font Awesome 5 Free "..tostring(dpi(16)),
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/volume --deci", function(stdout)
            volume_progress.value = tonumber(stdout)
        end)

        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/volume --num", function(stdout)
            volume_text:set_markup("<span font-weight='bold' foreground='"..beautiful.cyan.."'>"..stdout.."</span>")
        end)

        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/volume --icon", function(stdout)
            volume_icon:set_markup("<span foreground='"..beautiful.cyan.."'>"..stdout.."</span>")
        end)
    end
}

local volume_popup = wibox.widget {
    {
        rotated_volume_progress,
        margins = {
            left = dpi(5),
            right = dpi(5),
            top = dpi(20),
        },
        widget = wibox.layout.margin,
    },
    {
        volume_text,
        margins = {
            left = dpi(5),
            right = dpi(5),
            top = dpi(8),
        },
        widget = wibox.layout.margin,
    },
    layout = wibox.layout.fixed.vertical,
}

local volume = wibox.widget {
    layout = wibox.layout.fixed.horizontal,
    spacing = dpi(8),
    volume_icon,
    -- volume_text,
    buttons = {
        awful.button({}, 1, function()
            awful.spawn("sh /home/younix/.config/awesome/scripts/volume --toggle")
        end),
        awful.button({}, 4, function()
            awful.spawn("sh /home/younix/.config/awesome/scripts/volume --inc")
        end),
        awful.button({}, 5, function()
            awful.spawn("sh /home/younix/.config/awesome/scripts/volume --dec")
        end),
    }
}
-- End Volume

-- Network
local network_text = wibox.widget {
    widget = wibox.widget.textbox,
    align = "center",
    forced_width = dpi(20),
    markup = "<span font-weight='bold' foreground='"..beautiful.magenta.."'>Connecting</span>"
}

local network_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "Font Awesome 5 Free "..tostring(dpi(14)),
    markup = "<span foreground='"..beautiful.magenta.."'></span>",
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/network --text", function(stdout)
            network_text:set_markup("<span font-weight='bold' foreground='"..beautiful.magenta.."'>"..stdout.."</span>")
        end)

        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/network --icon", function(stdout)
            network_icon:set_markup("<span foreground='"..beautiful.magenta.."'>"..stdout.."</span>")
        end)
    end
}

local network = wibox.widget {
    layout = wibox.layout.fixed.horizontal,
    spacing = dpi(8),
    network_icon,
    -- network_text,
    buttons = {
        awful.button({}, 1, function()
            awful.spawn("alacritty -e nmtui")
        end),
    },
}
-- End Network

local sysdashboard_popup = awful.popup {
    widget = {
        {
            {
                network_text,
                margins = {
                    top = dpi(20),
                    bottom = dpi(-25),
                },
                widget  = wibox.container.margin,
            },
            {
                {
                    battery_popup,
                    brightness_popup,
                    volume_popup,
                    layout = wibox.layout.fixed.horizontal,
                },
                margins = {
                    bottom = dpi(13),
                },
                widget  = wibox.container.margin,
            },
            layout = wibox.layout.fixed.vertical,
        },
        margins = {
            left = dpi(17),
            right = dpi(17),
        },
        widget  = wibox.container.margin,
    },
    preferred_positions = "bottom",
    preferred_anchors = "back",
    offset = {
        x = dpi(-12),
        y = dpi(12),
    },
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
	type = 'dock',
}

local sysdashboard = wibox.widget {
    layout = wibox.layout.fixed.horizontal,
    spacing = dpi(8),
    battery,
    brightness,
    volume,
    network,
}
-- -- End System Dashboard

-- -- Clock
local clock = wibox.widget {
    widget = wibox.widget.textbox,
}

timer {
    timeout = 30,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("date +'%I:%M'", function(stdout)
            clock:set_text(stdout)
        end)
    end
}

clock:connect_signal('button::press', function() awful.spawn("google-chrome-stable 'https://calendar.google.com/calendar'") end)
-- -- End Clock

-- -- Calendar
local styles = {}
styles.month   = { padding  = dpi(5),
}
styles.focus   = { fg_color = beautiful.orange,
                   markup   = function(t) return '<b>' .. t .. '</b>' end,
}
styles.header  = { fg_color = beautiful.magenta,
                   markup   = function(t) return '<b>' .. t .. '</b>' end,
}
styles.weekday = { fg_color = beautiful.blue,
                   markup   = function(t) return '<b>' .. t .. '</b>' end,
}

local function decorate_cell(widget, flag, date)
    if flag=='monthheader' and not styles.monthheader then
        flag = 'header'
    end
    local props = styles[flag] or {}
    if props.markup and widget.get_text and widget.set_markup then
        widget:set_markup(props.markup(widget:get_text()))
    end
    -- Change bg color for weekends
    local d = {year=date.year, month=(date.month or 1), day=(date.day or 1)}
    local weekday = tonumber(os.date('%w', os.time(d)))
    local ret = wibox.widget {
        {
            widget,
            margins = dpi(3),
            widget  = wibox.container.margin
        },
        shape              = props.shape,
        fg                 = props.fg_color,
        bg                 = props.bg_color or default_bg,
        widget             = wibox.container.background
    }
    return ret
end

local cal = wibox.widget {
    date           = os.date('*t'),
    long_weekdays  = true,
    start_sunday   = true,
    font           = beautiful.font,
    fn_embed       = decorate_cell,
    widget         = wibox.widget.calendar.month
}

local cal_popup = awful.popup {
    widget = {
        cal,
        margins = dpi(15),
        widget  = wibox.container.margin,
    },
    shape = gears.shape.rounded_rect,
    preferred_positions = "bottom",
    preferred_anchors = "middle",
    offset       = {
        y = dpi(12),
    },
    visible      = false,
    ontop        = true,
	type = 'dock',
}
-- -- End Calendar

-- -- Sidebar Widgets
-- User Info
local user_text = wibox.widget {
    widget = wibox.widget.textbox,
    align = "center",
    font = "SFMono "..tostring(dpi(15))
}

awful.spawn.easy_async("whoami", function(stdout)
    user_text:set_markup("<span font-weight='bold' foreground='"..beautiful.fg_normal.."'>"..stdout.."</span>")
end)

local user_image = wibox.widget {
    image  = "/home/younix/.config/awesome/images/profile.jpg",
    forced_width = dpi(185),
    forced_height = dpi(185),
    clip_shape = gears.shape.rounded_rect,
    widget = wibox.widget.imagebox,
}
-- End User Info

-- Uptime
local uptime_text = wibox.widget {
    widget = wibox.widget.textbox,
    wrap = true,
    valign = "center",
}

timer {
    timeout = 30,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("uptime -p", function(stdout)
            uptime_text:set_markup("<span font-weight='bold' foreground='"..beautiful.fg_normal.."'>"..stdout.."</span>")
        end)
    end
}

local uptime_icon = wibox.widget {
    widget = wibox.widget.textbox,
    wrap = true,
    markup = "<span foreground='"..beautiful.magenta.."'>ﲾ</span>",
    font = "SFMono "..tostring(dpi(28)),
    valign = "center",
}
-- End Uptime

-- CPU
local cpu_progress = wibox.widget {
    max_value             = 1,
    value                 = 0.65,
    forced_height         = dpi(10),
    forced_width          = dpi(215),
    shape                 = gears.shape.rounded_bar,
    color                 = beautiful.orange,
    background_color      = beautiful.gray,
    widget                = wibox.widget.progressbar,
}

local cpu_text = wibox.widget {
    widget = wibox.widget.textbox,
    markup = "<span font-weight='bold' foreground='"..beautiful.orange.."'></span>",
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/system --cpu", function(stdout)
            if tonumber(stdout) <= 9 then
                cpu_progress.value = tonumber(".0"..stdout)
                cpu_text:set_markup("<span font-weight='bold' foreground='"..beautiful.orange.."'>0"..stdout.."</span>")
            elseif tonumber(stdout) == 100 then
                cpu_progress.value = tonumber(1)
                cpu_text:set_markup("<span font-weight='bold' foreground='"..beautiful.orange.."'>99</span>")
            else
                cpu_progress.value = tonumber("."..stdout)
                cpu_text:set_markup("<span font-weight='bold' foreground='"..beautiful.orange.."'>"..stdout.."</span>")
            end
        end)
    end
}

local cpu_icon = wibox.widget {
    widget = wibox.widget.textbox,
    markup = "<span font-weight='bold' foreground='"..beautiful.orange.."'></span>",
    font = "SFMono "..tostring(dpi(26)),
}
-- End CPU

-- RAM
local mem_progress = wibox.widget {
    max_value             = 1,
    value                 = 0.65,
    forced_height         = dpi(10),
    forced_width          = dpi(215),
    shape                 = gears.shape.rounded_bar,
    color                 = beautiful.cyan,
    background_color      = beautiful.gray,
    widget                = wibox.widget.progressbar,
}

local mem_text = wibox.widget {
    widget = wibox.widget.textbox,
    markup = "<span font-weight='bold' foreground='"..beautiful.cyan.."'></span>",
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/system --mem", function(stdout)
            if tonumber(stdout) <= 9 then
                mem_progress.value = tonumber(".0"..stdout)
                mem_text:set_markup("<span font-weight='bold' foreground='"..beautiful.cyan.."'>0"..stdout.."</span>")
            elseif tonumber(stdout) == 100 then
                mem_progress.value = tonumber(1)
                mem_text:set_markup("<span font-weight='bold' foreground='"..beautiful.cyan.."'>99</span>")
            else
                mem_progress.value = tonumber("."..stdout)
                mem_text:set_markup("<span font-weight='bold' foreground='"..beautiful.cyan.."'>"..stdout.."</span>")
            end
        end)
    end
}

local mem_icon = wibox.widget {
    widget = wibox.widget.textbox,
    markup = "<span font-weight='bold' foreground='"..beautiful.cyan.."'></span>",
    font = "SFMono "..tostring(dpi(26)),
}
-- End RAM

-- Weather
local weather_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "Font Awesome 5 Free "..tostring(dpi(20)),
}

local weather_stat = wibox.widget {
    widget = wibox.widget.textbox,
}

local weather_stat_range = wibox.widget {
    widget = wibox.widget.textbox,
    align = "center",
}

local sunrise =  wibox.widget {
    widget = wibox.widget.textbox,
    align = "center",
}

local sunrise_icon =  wibox.widget {
    widget = wibox.widget.textbox,
    font = "Font Awesome 5 Free "..tostring(dpi(30)),
    markup = "<span font-weight='bold' foreground='"..beautiful.orange.."'>瀞</span>",
}

local sunset =  wibox.widget {
    widget = wibox.widget.textbox,
    align = "center",
}

local sunset_icon =  wibox.widget {
    widget = wibox.widget.textbox,
    font = "Font Awesome 5 Free "..tostring(dpi(30)),
    markup = "<span font-weight='bold' foreground='"..beautiful.magenta.."'>漢</span>",
}

timer {
    timeout = 300,
    call_now  = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async("node /home/younix/.config/awesome/scripts/weather/app/cli.js get icon", function(icon)
            awful.spawn.easy_async("node /home/younix/.config/awesome/scripts/weather/app/cli.js get icon-color", function(hex)
                weather_icon:set_markup("<span font-weight='bold' foreground='#"..hex:gsub("[\n\r]", "").."'>"..icon:gsub("[\n\r]", "").."</span>")
            end)
        end)

        awful.spawn.easy_async("node /home/younix/.config/awesome/scripts/weather/app/cli.js get stat", function(stat)
            awful.spawn.easy_async("node /home/younix/.config/awesome/scripts/weather/app/cli.js get temp", function(temp)
                weather_stat:set_markup("<span font-weight='bold' foreground='"..beautiful.fg_normal.."'>"..stat:gsub("[\n\r]", "")..", "..temp:gsub("[\n\r]", "").."</span>")
            end)
        end)

        awful.spawn.easy_async("node /home/younix/.config/awesome/scripts/weather/app/cli.js get min-temp", function(min)
            awful.spawn.easy_async("node /home/younix/.config/awesome/scripts/weather/app/cli.js get max-temp", function(max)
                weather_stat_range:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>"..min:gsub("[\n\r]", "").." "..max:gsub("[\n\r]", "").."</span>")
            end)
        end)

        awful.spawn.easy_async("node /home/younix/.config/awesome/scripts/weather/app/cli.js get sunrise", function(rise)
            sunrise:set_markup("<span font-weight='bold'>"..rise:gsub("[\n\r]", "").."</span>")
        end)

        awful.spawn.easy_async("node /home/younix/.config/awesome/scripts/weather/app/cli.js get sunset", function(set)
            sunset:set_markup("<span font-weight='bold'>"..set:gsub("[\n\r]", "").."</span>")
        end)
    end
}
-- End Weather

-- Theme Setter
local theme_catppuccin = wibox.widget {
    widget = wibox.widget.textbox,
    -- align  = 'center',
}

local theme_gruvbox = wibox.widget {
    widget = wibox.widget.textbox,
    align  = 'center',
}

local theme_nord = wibox.widget {
    widget = wibox.widget.textbox,
    align  = 'center',
}

local mode_light = wibox.widget {
    widget = wibox.widget.textbox,
    align  = 'center',
}

local mode_normal = wibox.widget {
    widget = wibox.widget.textbox,
    align  = 'center',
}

local mode_dark = wibox.widget {
    widget = wibox.widget.textbox,
    align  = 'center',
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("get-theme", function(stdout)
            if stdout == "catppuccin\n" then
                theme_catppuccin:set_markup("<span font-weight='bold' foreground='"..beautiful.green.."'>Catppuccin</span>")
                theme_gruvbox:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Gruvbox</span>")
                theme_nord:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Nord</span>")
            elseif stdout == "gruvbox\n" then
                theme_catppuccin:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Catppuccin</span>")
                theme_gruvbox:set_markup("<span font-weight='bold' foreground='"..beautiful.green.."'>Gruvbox</span>")
                theme_nord:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Nord</span>")
            elseif stdout == "nord\n" then
                theme_catppuccin:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Catppuccin</span>")
                theme_gruvbox:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Gruvbox</span>")
                theme_nord:set_markup("<span font-weight='bold' foreground='"..beautiful.green.."'>Nord</span>")
            end
        end)

        awful.spawn.easy_async("get-theme --mode", function(stdout)
            if stdout == "light\n" then
                mode_light:set_markup("<span font-weight='bold' foreground='"..beautiful.blue.."'>Light</span>")
                mode_normal:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Normal</span>")
                mode_dark:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Dark</span>")
            elseif stdout == "\n" then
                mode_light:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Light</span>")
                mode_normal:set_markup("<span font-weight='bold' foreground='"..beautiful.blue.."'>Normal</span>")
                mode_dark:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Dark</span>")
            elseif stdout == "dark\n" then
                mode_light:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Light</span>")
                mode_normal:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Normal</span>")
                mode_dark:set_markup("<span font-weight='bold' foreground='"..beautiful.blue.."'>Dark</span>")
            end
        end)
    end
}

theme_catppuccin:connect_signal('button::press', function()
    awful.spawn.easy_async_with_shell("get-theme --mode", function(stdout)
        awful.spawn.easy_async_with_shell("set-theme catppuccin "..stdout:gsub("[\n\r]", ""))
    end)
end)

theme_gruvbox:connect_signal('button::press', function()
    awful.spawn.easy_async_with_shell("get-theme --mode", function(stdout)
        awful.spawn.easy_async_with_shell("set-theme gruvbox "..stdout:gsub("[\n\r]", ""))
    end)
end)

theme_nord:connect_signal('button::press', function()
    awful.spawn.easy_async_with_shell("get-theme --mode", function(stdout)
        awful.spawn.easy_async_with_shell("set-theme nord "..stdout:gsub("[\n\r]", ""))
    end)
end)

mode_light:connect_signal('button::press', function()
    awful.spawn.easy_async_with_shell("get-theme", function(stdout)
        awful.spawn.easy_async_with_shell("set-theme "..stdout:gsub("[\n\r]", "") .." light")
    end)
end)

mode_normal:connect_signal('button::press', function()
    awful.spawn.easy_async_with_shell("get-theme", function(stdout)
        awful.spawn.easy_async_with_shell("set-theme "..stdout:gsub("[\n\r]", "") .."")
    end)
end)

mode_dark:connect_signal('button::press', function()
    awful.spawn.easy_async_with_shell("get-theme", function(stdout)
        awful.spawn.easy_async_with_shell("set-theme "..stdout:gsub("[\n\r]", "") .." dark")
    end)
end)
-- End Theme Setter

-- Quote
local quote_text = wibox.widget {
    widget = wibox.widget.textbox,
    align = "center",
}

local author_text = wibox.widget {
    widget = wibox.widget.textbox,
    align = "center",
}

timer {
    timeout = 300,
    call_now  = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/quotes update", function()
            awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/quotes quote", function(stdout)
                quote_text:set_markup("<span foreground='"..beautiful.fg_normal.."'>"..stdout:gsub("[\n\r]", "").."</span>")
            end)
    
            awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/quotes author", function(stdout)
                author_text:set_markup("<span font-weight='bold' foreground='"..beautiful.fg_normal.."'>"..stdout:gsub("[\n\r]", "").."</span>")
            end)
        end)
    end
}
-- End Quote

-- Power Menu
local lock_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "SFMono "..tostring(dpi(34)),
    markup = "<span font-weight='bold' foreground='"..beautiful.green.."'></span>"
}

local reboot_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "SFMono "..tostring(dpi(38)),
    markup = "<span font-weight='bold' foreground='"..beautiful.orange.."'></span>"
}

local power_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "SFMono "..tostring(dpi(42)),
    markup = "<span font-weight='bold' foreground='"..beautiful.red.."'></span>"
}

lock_icon:connect_signal("button::press", function()
    awful.util.spawn_with_shell("sh ~/.config/awesome/scripts/lockscreen")
end)

reboot_icon:connect_signal("button::press", function()
    awful.spawn("reboot")
end)

power_icon:connect_signal("button::press", function()
    awful.spawn("poweroff")
end)
-- End Power Menu
-- -- End Sidebar Widgets

-- -- Sidebar
local sidebar_width = dpi(325)
local sidebar_height = awful.screen.focused().geometry.height - dpi(38)

local sidebar = awful.popup {
    widget = {
        {
            {
                user_image,
                margins = {
                    top = dpi(50),
                    left = dpi(70),
                },
                widget  = wibox.container.margin,
            },
            {
                user_text,
                margins = {
                    top = dpi(8),
                },
                widget  = wibox.container.margin,
            },
            {
                {
                    uptime_icon,
                    {
                        uptime_text,
                        margins = {
                            left = dpi(15),
                            top = dpi(18),
                        },
                        widget  = wibox.container.margin,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                margins = {
                    left = dpi(20),
                    top = dpi(10),
                },
                widget  = wibox.container.margin,
            },
            {
                {
                    {
                        cpu_icon,
                        margins = {
                            right = dpi(5),
                        },
                        widget  = wibox.container.margin,
                    },
                    {
                        cpu_progress,
                        margins = {
                            left = dpi(10),
                            top = dpi(22),
                            bottom = dpi(22),
                        },
                        widget  = wibox.container.margin,
                    },
                    {
                        cpu_text,
                        margins = {
                            top = dpi(25),
                            left = dpi(10),
                        },
                        widget  = wibox.container.margin,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                margins = {
                    left = dpi(20),
                    top = dpi(-20),
                },
                widget  = wibox.container.margin,
            },
            {
                {
                    {
                        mem_icon,
                        margins = {
                            right = dpi(5),
                        },
                        widget  = wibox.container.margin,
                    },
                    {
                        mem_progress,
                        margins = {
                            left = dpi(10),
                            top = dpi(22),
                            bottom = dpi(22),
                        },
                        widget  = wibox.container.margin,
                    },
                    {
                        mem_text,
                        margins = {
                            top = dpi(25),
                            left = dpi(10),
                        },
                        widget  = wibox.container.margin,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                margins = {
                    left = dpi(20),
                    top = dpi(-20),
                },
                widget  = wibox.container.margin,
            },
            {
                {
                    {
                        weather_icon,
                        {
                            weather_stat,
                            margins = {
                                left = dpi(12),
                            },
                            widget  = wibox.container.margin,
                        },
                        layout = wibox.layout.fixed.horizontal,
                    },
                    margins = {
                        top = dpi(45),
                    },
                    widget  = wibox.container.margin,
                },
                widget = wibox.container.place,
            },
            {
                weather_stat_range,
                margins = {
                    top = dpi(5),
                    -- bottom = dpi(15),
                },
                widget  = wibox.container.margin,
            },
            {
                {
                    {
                        sunrise_icon,
                        {
                            sunrise,
                            margins = {
                                left = dpi(5),
                            },
                            widget  = wibox.container.margin,
                        },
                        layout = wibox.layout.fixed.horizontal,
                    },
                    {
                        sunset_icon,
                        {
                            sunset,
                            margins = {
                                left = dpi(5),
                            },
                            widget  = wibox.container.margin,
                        },
                        layout = wibox.layout.fixed.horizontal,
                    },
                    spacing = dpi(20),
                    layout = wibox.layout.fixed.horizontal,
                },
                widget = wibox.container.place,
            },
            {
                {
                    {
                        theme_catppuccin,
                        theme_gruvbox,
                        theme_nord,
                        spacing = dpi(12),
                        layout = wibox.layout.fixed.horizontal,
                    },
                    {
                        {
                            mode_dark,
                            mode_normal,
                            mode_light,
                            spacing = dpi(12),
                            layout = wibox.layout.fixed.horizontal,
                        },
                        margins = {
                            top = dpi(10),
                            left = dpi(25),
                        },
                        widget  = wibox.container.margin,
                    },
                    layout = wibox.layout.fixed.vertical,
                },
                margins = {
                    left = dpi(30),
                    top = dpi(45),
                    bottom = dpi(45),
                },
                widget  = wibox.container.margin,
            },
            {
                {
                    quote_text,
                    margins = {
                        left = dpi(15),
                        right = dpi(15),
                    },
                    forced_height = dpi(160),
                    widget  = wibox.container.margin,
                },
                author_text,
                forced_height = dpi(180),
                layout = wibox.layout.fixed.vertical,
            },
            {
                {
                    power_icon,
                    reboot_icon,
                    lock_icon,
                    spacing = dpi(45),
                    layout = wibox.layout.fixed.horizontal,
                },
                margins = {
                    left = dpi(65),
                    top = dpi(20),
                    bottom = dpi(20),
                },
                widget  = wibox.container.margin,
            },
            layout = wibox.layout.fixed.vertical,
        },
        expand = 'none',
        spacing = dpi(10),
        layout = wibox.layout.align.vertical,
    },
	bg = beautiful.bg_normal,
	minimum_width = sidebar_width,
	minimum_height = sidebar_height,
	maximum_width = sidebar_width,
	maximum_height = sidebar_height,
    preferred_positions = "bottom",
    preferred_anchors = "front",
    visible = false,
	ontop = true,
	type = 'dock',
}
-- -- End Sidebar

screen.connect_signal("request::desktop_decoration", function(s)
    if s == screen[1] then
        systray:set_screen(s)

        -- Each screen has its own tag table.
        awful.tag({ "one", "two", "three", "four" }, s, awful.layout.layouts[1])

        -- Create a promptbox for each screen
        s.mypromptbox = awful.widget.prompt()

        -- Create an imagebox widget which will contain an icon indicating which layout we're using.
        -- We need one layoutbox per screen.
        s.mylayoutbox = awful.widget.layoutbox {
            screen  = s,
            buttons = {
                awful.button({ }, 1, function () awful.layout.inc( 1) end),
                awful.button({ }, 3, function () awful.layout.inc(-1) end),
            }
        }

        -- Create a taglist widget
        s.mytaglist = awful.widget.taglist {
            screen  = s,
            filter  = awful.widget.taglist.filter.all,
            layout   = {
                spacing = dpi(8),
                layout  = wibox.layout.fixed.horizontal
            },
            buttons = {
                awful.button({ }, 1, function(t) t:view_only() end),
                awful.button({ modkey }, 1, function(t)
                                                if client.focus then
                                                    client.focus:move_to_tag(t)
                                                end
                                            end),
                awful.button({ }, 3, awful.tag.viewtoggle),
                awful.button({ modkey }, 3, function(t)
                                                if client.focus then
                                                    client.focus:toggle_tag(t)
                                                end
                                            end),
            }
        }

        s.sidebar_icon = wibox.widget {
            widget = wibox.widget.textbox,
            font = "SFMono "..tostring(dpi(34)),
            markup = "<span font-weight='bold' foreground='"..beautiful.gray.."'></span>"
        }

        -- Create the wibox
        s.mywibox = awful.wibar {
            position = "top",
            screen   = s,
            height = dpi(38),
            widget   = {
                layout = wibox.layout.align.horizontal,
                expand = "none",
                { -- Left widgets
                    layout = wibox.layout.fixed.horizontal,
                    wibox.layout.margin(s.sidebar_icon, dpi(10)),
                    wibox.layout.margin(s.mytaglist, dpi(10)),
                },
                { -- Middle widgets
                    layout = wibox.layout.fixed.horizontal,
                    clock,
                },
                { -- Right widgets
                    layout = wibox.layout.fixed.horizontal,
                    -- s.mylayoutbox,
                    wibox.layout.margin(systray, dpi(5), dpi(5), dpi(6), 0),
                    wibox.layout.margin(sysdashboard, dpi(5), dpi(10), 0, 0),
                },
            }
        }
        
        sysdashboard:connect_signal('mouse::enter', function()
            sysdashboard_popup.visible = true
            sysdashboard_popup:move_next_to(s.mywibox)
        end)
        
        sysdashboard:connect_signal('mouse::leave', function()
            sysdashboard_popup.visible = false
        end)

        clock:connect_signal('mouse::enter', function()
            cal_popup.visible = true
            cal_popup:move_next_to(s.mywibox)
        end)
        
        clock:connect_signal('mouse::leave', function()
            cal_popup.visible = false
        end)

        local toggle_sidebar = function()
            if not sidebar.visible then
                sidebar.visible = true
                sidebar:move_next_to(s.mywibox)
                s.sidebar_icon:set_markup("<span font-weight='bold' foreground='"..beautiful.green.."'></span>")
            else
                sidebar.visible = false
                s.sidebar_icon:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'></span>")
            end
        end

        awful.keyboard.append_global_keybindings({
            awful.key({ modkey,           }, "Tab", toggle_sidebar,
                    {description = "toggle sidebar", group = "awesome"}),
        })

        s.sidebar_icon:connect_signal('button::press', toggle_sidebar)
    else
        awful.tag({ "one" }, s, awful.layout.layouts[1])
    end
end)

-- -- Keybinds
-- Screen Shot
awful.keyboard.append_global_keybindings({
    awful.key({            }, "Print", function() 
        awful.util.spawn_with_shell("sleep 1 && scrot $(date +'%a:%b:%d-%H:%M:%S').png") 
        end,
        {description = "full screenshot", group = "awesome"}),

    awful.key({ "Shift"    }, "Print", function() 
        awful.util.spawn_with_shell("sleep 1 && scrot -s $(date +'%a:%b:%d-%H:%M:%S').png") 
        end,
        {description = "selection screenshot", group = "awesome"}),
})
-- End Screen Shot

-- Lock Screen Toggle
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "Escape", function() 
        awful.util.spawn_with_shell("sh ~/.config/awesome/scripts/lockscreen") 
        end,
        {description = "toggle info dashboard", group = "awesome"}),
})
-- End Lock Screen Toggle

-- Thunar Keybind
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "n", function () awful.spawn("thunar") end,
              {description = "file manager", group = "awesome"}),
})
-- End Thunar Keybind

-- General Awesome keys
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "w", function () awful.spawn("google-chrome-stable") end,
              {description = "web browser", group = "awesome"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey            }, "r", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
})

-- Volume
awful.keyboard.append_global_keybindings({
    awful.key({            }, "XF86AudioRaiseVolume", function () awful.spawn("sh /home/younix/.config/awesome/scripts/volume --inc") end,
              {description = "increase volume", group = "tag"}),
    awful.key({            }, "XF86AudioLowerVolume", function () awful.spawn("sh /home/younix/.config/awesome/scripts/volume --dec") end,
              {description = "lower volume", group = "tag"}),
    awful.key({            }, "XF86AudioMute", function () awful.spawn("sh /home/younix/.config/awesome/scripts/volume --toggle") end,
              {description = "toggle mute", group = "tag"}),
})

-- Brightness
awful.keyboard.append_global_keybindings({
    awful.key({            }, "XF86MonBrightnessUp", function () awful.spawn("brightnessctl s +5%") end,
              {description = "increase brightness", group = "tag"}),
    awful.key({            }, "XF86MonBrightnessDown", function () awful.spawn("brightnessctl s 5%-") end,
              {description = "lower brightness", group = "tag"}),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Control" }, "h",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey, "Control" }, "l",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    -- awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
    --           {description = "focus the next screen", group = "screen"}),
    -- awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
    --           {description = "focus the previous screen", group = "screen"}),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey, "Control"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select next", group = "layout"}),
})


awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control" },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numpad",
        description = "select layout directly",
        group       = "layout",
        on_press    = function (index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    }
})

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ modkey,           }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),
        awful.key({ modkey            }, "q",
            function (c) 
                c:kill()                         
            end,
            {description = "close", group = "client"}),
    })
end)

-- -- End Keybinds

-- -- Rules
-- Rounded corners
client.connect_signal("manage", function (c)
    c.shape = gears.shape.rounded_rect
end)

client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            focus     = awful.client.focus.filter,
            raise     = true,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }

    -- Floating clients.
    ruled.client.append_rule {
        id       = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            class    = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name    = {
                "Event Tester",  -- xev.
            },
            role    = {
                "AlarmWindow",    -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    }

    -- Add titlebars to normal clients and dialogs
    ruled.client.append_rule {
        id         = "titlebars",
        rule_any   = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = true      }
    }
end)
-- -- End Rules

-- Notifications
ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)

-- End Notifications

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)