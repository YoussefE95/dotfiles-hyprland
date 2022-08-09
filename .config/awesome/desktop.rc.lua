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

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })


-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
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

-- {{{ Wibar

-- Fuzzy clock
local fuzzy_clock = wibox.widget {
    widget = wibox.widget.textbox,
}

timer {
    timeout = 60,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("python3 /home/younix/.config/awesome/scripts/fuzzytime.py", function(stdout)
            fuzzy_clock:set_text(stdout)
        end)
    end
}
-- End Fuzzy Clock

-- System Tray
local systray = wibox.widget.systray()
systray:set_base_size(28)
systray:set_screen(screen[2])
-- End System Tray

-- -- System Dashboard
-- -- Battery
-- local battery_progress = wibox.widget {
--     max_value             = 1,
--     value                 = 0.65,
--     forced_height         = 20,
--     forced_width          = 175,
--     shape                 = gears.shape.rounded_bar,
--     color                 = beautiful.green,
--     background_color      = beautiful.gray,
--     widget                = wibox.widget.progressbar,
-- }

-- timer {
--     timeout = 1,
--     call_now  = true,
--     autostart = true,
--     callback = function() 
--         awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/battery --dec", function(stdout)
--             battery_progress.value = tonumber(stdout)
--         end)
--     end
-- }

-- local rotated_battery_progress = {
--     battery_progress,
--     forced_height = 175,
--     forced_width  = 20,
--     direction     = 'east',
--     layout        = wibox.container.rotate,
-- }

-- local battery_text = wibox.widget {
--     widget = wibox.widget.textbox,
--     valign = "center"
-- }

-- timer {
--     timeout = 5,
--     call_now  = true,
--     autostart = true,
--     callback = function() 
--         awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/battery --num", function(stdout)
--             battery_text:set_markup("<span font-weight='bold' foreground='"..beautiful.green.."'>"..stdout.."</span>")
--         end)
--     end
-- }

-- local battery_icon = wibox.widget {
--     widget = wibox.widget.textbox,
--     font = "MesloLGS 34",
--     markup = "<span foreground='"..beautiful.cyan.."'></span>",
-- }

-- timer {
--     timeout = 1,
--     call_now  = true,
--     autostart = true,
--     callback = function() 
--         awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/battery --icon", function(stdout)
--             battery_icon:set_markup("<span foreground='"..beautiful.green.."'>"..stdout.."</span>")
--         end)
--     end
-- }

-- local battery_popup = wibox.widget {
--     {
--         rotated_battery_progress,
--         margins = {
--             left = 5,
--             right = 5,
--             top = 20,
--         },
--         widget = wibox.layout.margin,
--     },
--     {
--         battery_text,
--         margins = {
--             left = 5,
--             right = 5,
--             top = 8,
--         },
--         widget = wibox.layout.margin,
--     },
--     layout = wibox.layout.fixed.vertical,
-- }

-- local battery = wibox.widget {
--     layout = wibox.layout.fixed.horizontal,
--     spacing = 8,
--     battery_icon,
-- }
-- -- End Battery

-- -- Brightness
-- local brightness_progress = wibox.widget {
--     max_value             = 1,
--     value                 = 0.65,
--     forced_height         = 20,
--     forced_width          = 175,
--     shape                 = gears.shape.rounded_bar,
--     color                 = beautiful.yellow,
--     background_color      = beautiful.gray,
--     widget                = wibox.widget.progressbar,
-- }

-- timer {
--     timeout = 1,
--     call_now  = true,
--     autostart = true,
--     callback = function() 
--         awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/brightness --dec", function(stdout)
--             brightness_progress.value = tonumber(stdout)
--         end)
--     end
-- }

-- local rotated_brightness_progress = {
--     brightness_progress,
--     forced_height = 175,
--     forced_width  = 20,
--     direction     = 'east',
--     layout        = wibox.container.rotate,
-- }

-- local brightness_text = wibox.widget {
--     widget = wibox.widget.textbox,
--     valign = "center",
-- }

-- timer {
--     timeout = 1,
--     call_now  = true,
--     autostart = true,
--     callback = function() 
--         awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/brightness --num", function(stdout)
--             brightness_text:set_markup("<span font-weight='bold' foreground='"..beautiful.yellow.."'>"..stdout.."</span>")
--         end)
--     end
-- }

-- local brightness_icon = wibox.widget {
--     widget = wibox.widget.textbox,
--     font = "MesloLGS 26",
--     markup = "<span foreground='"..beautiful.yellow.."'></span>",
-- }

-- timer {
--     timeout = 1,
--     call_now  = true,
--     autostart = true,
--     callback = function() 
--         awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/brightness --icon", function(stdout)
--             brightness_icon:set_markup("<span foreground='"..beautiful.yellow.."'>"..stdout.."</span>")
--         end)
--     end
-- }

-- local brightness_popup = wibox.widget {
--     {
--         rotated_brightness_progress,
--         margins = {
--             left = 5,
--             right = 5,
--             top = 20,
--         },
--         widget = wibox.layout.margin,
--     },
--     {
--         brightness_text,
--         margins = {
--             left = 5,
--             right = 5,
--             top = 8,
--         },
--         widget = wibox.layout.margin,
--     },
--     layout = wibox.layout.fixed.vertical,
-- }

-- local brightness = wibox.widget {
--     layout = wibox.layout.fixed.horizontal,
--     spacing = 8,
--     brightness_icon,
--     buttons = {
--         awful.button({}, 4, function()
--             awful.spawn("brightnessctl s +5%")
--         end),
--         awful.button({}, 5, function()
--             awful.spawn("brightnessctl s 5%-")
--         end),
--     }
-- }
-- -- End Brightness

-- Volume
local volume_progress = wibox.widget {
    max_value             = 1,
    value                 = 0.65,
    forced_height         = 20,
    forced_width          = 175,
    shape                 = gears.shape.rounded_bar,
    color                 = beautiful.cyan,
    background_color      = beautiful.gray,
    widget                = wibox.widget.progressbar,
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/volume --deci", function(stdout)
            volume_progress.value = tonumber(stdout)
        end)
    end
}

local rotated_volume_progress = {
    volume_progress,
    forced_height = 175,
    forced_width  = 20,
    direction     = 'east',
    layout        = wibox.container.rotate,
}

local volume_text = wibox.widget {
    widget = wibox.widget.textbox,
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/volume --num", function(stdout)
            volume_text:set_markup("<span font-weight='bold' foreground='"..beautiful.cyan.."'>"..stdout.."</span>")
        end)
    end
}

local volume_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "Font Awesome 5 Free 16",
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/volume --icon", function(stdout)
            volume_icon:set_markup("<span foreground='"..beautiful.cyan.."'>"..stdout.."</span>")
        end)
    end
}

local volume_popup = wibox.widget {
    {
        rotated_volume_progress,
        margins = {
            left = 5,
            right = 5,
            top = 20,
        },
        widget = wibox.layout.margin,
    },
    {
        volume_text,
        margins = {
            left = 5,
            right = 5,
            top = 8,
        },
        widget = wibox.layout.margin,
    },
    layout = wibox.layout.fixed.vertical,
}

local volume = wibox.widget {
    layout = wibox.layout.fixed.horizontal,
    spacing = 8,
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
    forced_width = 20,
    markup = "<span font-weight='bold' foreground='"..beautiful.magenta.."'>Connecting</span>"
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/network --text", function(stdout)
            network_text:set_markup("<span font-weight='bold' foreground='"..beautiful.magenta.."'>"..stdout.."</span>")
        end)
    end
}

local network_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "Font Awesome 5 Free 14",
    markup = "<span foreground='"..beautiful.magenta.."'></span>",
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/network --icon", function(stdout)
            network_icon:set_markup("<span foreground='"..beautiful.magenta.."'>"..stdout.."</span>")
        end)
    end
}

local network = wibox.widget {
    layout = wibox.layout.fixed.horizontal,
    spacing = 8,
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
                    top = 20,
                    bottom = -25,
                },
                widget  = wibox.container.margin,
            },
            {
                {
                    -- battery_popup,
                    -- brightness_popup,
                    volume_popup,
                    layout = wibox.layout.fixed.horizontal,
                },
                margins = {
                    bottom = 13,
                },
                widget  = wibox.container.margin,
            },
            layout = wibox.layout.fixed.vertical,
        },
        margins = {
            left = 17,
            right = 17,
        },
        widget  = wibox.container.margin,
    },
    preferred_positions = "bottom",
    preferred_anchors = "back",
    offset = {
        x = -12,
        y = 12,
    },
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
}

local sysdashboard = wibox.widget {
    layout = wibox.layout.fixed.horizontal,
    spacing = 8,
    -- battery,
    -- brightness,
    volume,
    network,
}
-- -- End System Dashboard

screen.connect_signal("request::desktop_decoration", function(s)
    if s == screen[2] then
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
                spacing = 8,
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

        s.mywibox = awful.wibar {
            position = "top",
            screen   = s,
            height = 38,
            widget   = {
                layout = wibox.layout.align.horizontal,
                expand = "none",
                { -- Left widgets
                    layout = wibox.layout.fixed.horizontal,
                    wibox.layout.margin(s.mytaglist, 10),
                },
                { -- Middle widgets
                    layout = wibox.layout.fixed.horizontal,
                    fuzzy_clock,
                },
                { -- Right widgets
                    layout = wibox.layout.fixed.horizontal,
                    -- s.mylayoutbox,
                    wibox.layout.margin(systray, 5, 5, 6, 0),
                    wibox.layout.margin(sysdashboard, 5, 10, 0, 0),
                },
            }
        }
    else
        -- Each screen has its own tag table.
        awful.tag({ "one" }, s, awful.layout.layouts[1])

        -- Create a taglist widget
        s.mytaglist = awful.widget.taglist {
            screen  = s,
            filter  = awful.widget.taglist.filter.all,
            layout   = {
                spacing = 8,
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
    end
end)

sysdashboard:connect_signal('mouse::enter', function()
    sysdashboard_popup.visible = true
    sysdashboard_popup:move_next_to(screen[2].mywibox)
end)

sysdashboard:connect_signal('mouse::leave', function()
    sysdashboard_popup.visible = false
end)

-- -- Info Dashboard
-- Calendar
local styles = {}
styles.month   = { padding  = 5,
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
            margins = 3,
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
    -- long_weekdays  = true,
    font           = "SFMono 14",
    fn_embed       = decorate_cell,
    widget         = wibox.widget.calendar.month
}

local cal_popup = awful.popup {
    widget = {
        {
            {
                cal,
                margins = {
                    left = 10,
                    right = 10,
                    top = 20,
                    bottom = 20,
                },
                widget  = wibox.container.margin,
            },
            layout = wibox.layout.fixed.vertical,
        },
        margins = {
            left = 17,
            right = 17,
        },
        widget  = wibox.container.margin,
    },
    placement    = awful.placement.centered,
    shape        = gears.shape.rounded_rect,
    minimum_width = 320,
    minimum_height = 300,
    maximum_width = 320,
    maximum_height = 300,
    offset       = {
        x = 50,
    },
    visible      = false,
    ontop        = true,
}
-- End Calendar

-- clock
local time = wibox.widget {
    font = "SFMono 28",
    widget = wibox.widget.textbox,
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/time --text", function(stdout)
            time:set_markup("<span font-weight='bold' foreground='"..beautiful.fg_normal.."'>"..stdout.."</span>")
        end)
    end
}

local am = wibox.widget {
    font = "SFMono 18",
    widget = wibox.widget.textbox,
}

local pm = wibox.widget {
    font = "SFMono 18",
    widget = wibox.widget.textbox,
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/time --ampm", function(stdout)
            if stdout == "am\n" then
                am:set_markup("<span font-weight='bold' foreground='"..beautiful.yellow.."'>AM</span>")
                pm:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>PM</span>")
            else
                am:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>AM</span>")
                pm:set_markup("<span font-weight='bold' foreground='"..beautiful.yellow.."'>PM</span>")
            end
        end)
    end
}

local clock = {
    {
        time,
        margins = {
            top = 10,
            right = 20,
        },
        widget  = wibox.container.margin,
    },
    {
        {
            am,
            pm,
            layout = wibox.layout.fixed.vertical,
        },
        margins = {
            top = 5,
        },
        widget  = wibox.container.margin,
    },
    layout = wibox.layout.fixed.horizontal,
}

local clock_popup = awful.popup {
    widget = {
        {
            {
                clock,
                margins = {
                    left = 55,
                    top = 25,
                    -- bottom = 20,
                },
                widget  = wibox.container.margin,
            },
            layout = wibox.layout.fixed.vertical,
        },
        margins = {
            left = 17,
            right = 17,
        },
        widget  = wibox.container.margin,
    },
    -- placement    = awful.placement.centered,
    preferred_positions = "top",
    preferred_anchors = "front",
    minimum_width = 320,
    minimum_height = 130,
    maximum_width = 320,
    maximum_height = 130,
    offset       = {
        y = -10,
    },
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
}
-- End Clock

-- Theme Setter
local theme_catppuccin = wibox.widget {
    widget = wibox.widget.textbox,
    align  = 'center',
}

local theme_everforest = wibox.widget {
    widget = wibox.widget.textbox,
    align  = 'center',
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
                theme_everforest:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Everforest</span>")
                theme_gruvbox:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Gruvbox</span>")
                theme_nord:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Nord</span>")
            elseif stdout == "everforest\n" then
                theme_catppuccin:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Catppuccin</span>")
                theme_everforest:set_markup("<span font-weight='bold' foreground='"..beautiful.green.."'>Everforest</span>")
                theme_gruvbox:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Gruvbox</span>")
                theme_nord:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Nord</span>")
            elseif stdout == "gruvbox\n" then
                theme_catppuccin:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Catppuccin</span>")
                theme_everforest:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Everforest</span>")
                theme_gruvbox:set_markup("<span font-weight='bold' foreground='"..beautiful.green.."'>Gruvbox</span>")
                theme_nord:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Nord</span>")
            elseif stdout == "nord\n" then
                theme_catppuccin:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Catppuccin</span>")
                theme_everforest:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Everforest</span>")
                theme_gruvbox:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Gruvbox</span>")
                theme_nord:set_markup("<span font-weight='bold' foreground='"..beautiful.green.."'>Nord</span>")
            end
        end)
    end
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("get-theme --mode", function(stdout)
            if stdout == "light\n" then
                mode_light:set_markup("<span font-weight='bold' foreground='"..beautiful.green.."'>Light</span>")
                mode_normal:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Normal</span>")
                mode_dark:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Dark</span>")
            elseif stdout == "\n" then
                mode_light:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Light</span>")
                mode_normal:set_markup("<span font-weight='bold' foreground='"..beautiful.green.."'>Normal</span>")
                mode_dark:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Dark</span>")
            elseif stdout == "dark\n" then
                mode_light:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Light</span>")
                mode_normal:set_markup("<span font-weight='bold' foreground='"..beautiful.gray.."'>Normal</span>")
                mode_dark:set_markup("<span font-weight='bold' foreground='"..beautiful.green.."'>Dark</span>")
            end
        end)
    end
}

local theme_setter_popup = awful.popup {
    widget = {
        {
            {
                theme_catppuccin,
                margins = {
                    top = 15,
                    bottom = 15,
                },
                widget  = wibox.container.margin,
            },
            {
                theme_gruvbox,
                margins = {
                    top = 15,
                    bottom = 15,
                },
                widget  = wibox.container.margin,
            },
            {
                theme_everforest,
                margins = {
                    -- left = 20,
                    -- right = 20,
                    top = 15,
                    bottom = 15,
                },
                widget  = wibox.container.margin,
            },
            {
                theme_nord,
                margins = {
                    -- left = 20,
                    -- right = 20,
                    top = 15,
                    bottom = 15,
                },
                widget  = wibox.container.margin,
            },
            layout = wibox.layout.fixed.vertical,
        },
        margins = {
            left = 20,
            right = 20,
            top = 14,
            bottom = 13,
        },
        widget  = wibox.container.margin,
    },
    -- placement    = awful.placement.centered,
    preferred_positions = "right",
    preferred_anchors = "front",
    minimum_width = 150,
    minimum_height = 240,
    maximum_width = 150,
    maximum_height = 240,
    offset       = {
        x = 10,
    },
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
}

local mode_setter_popup = awful.popup {
    widget = {
        {
            {
                mode_light,
                margins = {
                    top = 15,
                    bottom = 15,
                },
                widget  = wibox.container.margin,
            },
            {
                mode_normal,
                margins = {
                    top = 15,
                    bottom = 15,
                },
                widget  = wibox.container.margin,
            },
            {
                mode_dark,
                margins = {
                    top = 15,
                    bottom = 15,
                },
                widget  = wibox.container.margin,
            },
            layout = wibox.layout.fixed.vertical,
        },
        margins = {
            left = 40,
            right = 40,
            top = 13,
            bottom = 14,
        },
        widget  = wibox.container.margin,
    },
    -- placement    = awful.placement.centered,
    preferred_positions = "bottom",
    preferred_anchors = "front",
    minimum_width = 150,
    minimum_height = 190,
    maximum_width = 150,
    maximum_height = 190,
    offset       = {
        y = 10,
    },
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
}

theme_catppuccin:connect_signal('button::press', function()
    awful.spawn.easy_async_with_shell("get-theme --mode", function(stdout)
        awful.spawn.easy_async_with_shell("set-theme catppuccin "..stdout)
    end)
end)

theme_everforest:connect_signal('button::press', function()
    awful.spawn.easy_async_with_shell("get-theme --mode", function(stdout)
        awful.spawn.easy_async_with_shell("set-theme everforest "..stdout)
    end)
end)

theme_gruvbox:connect_signal('button::press', function()
    awful.spawn.easy_async_with_shell("get-theme --mode", function(stdout)
        awful.spawn.easy_async_with_shell("set-theme gruvbox "..stdout)
    end)
end)

theme_nord:connect_signal('button::press', function()
    awful.spawn.easy_async_with_shell("get-theme --mode", function(stdout)
        awful.spawn.easy_async_with_shell("set-theme nord "..stdout)
    end)
end)

mode_light:connect_signal('button::press', function()
    awful.spawn.easy_async_with_shell("get-theme", function(stdout)
        awful.spawn.easy_async_with_shell("set-theme "..stdout:gsub("[\n\r]", " ") .." light")
    end)
end)

mode_normal:connect_signal('button::press', function()
    awful.spawn.easy_async_with_shell("get-theme", function(stdout)
        awful.spawn.easy_async_with_shell("set-theme "..stdout:gsub("[\n\r]", " ") .."")
    end)
end)

mode_dark:connect_signal('button::press', function()
    awful.spawn.easy_async_with_shell("get-theme", function(stdout)
        awful.spawn.easy_async_with_shell("set-theme "..stdout:gsub("[\n\r]", " ") .." dark")
    end)
end)
-- End Theme Setter

-- User Info
local user_text = wibox.widget {
    widget = wibox.widget.textbox,
    font = "SFMono 16",
}

timer {
    timeout = 600,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("whoami", function(stdout)
            user_text:set_markup("<span font-weight='bold' foreground='"..beautiful.fg_normal.."'>"..stdout.."</span>")
        end)
    end
}

local user_image = wibox.widget {
    image  = "/home/younix/.config/awesome/images/profile.jpg",
    forced_width = 84,
    forced_height = 84,
    clip_shape = gears.shape.circle,
    widget = wibox.widget.imagebox,
}

local user_popup = awful.popup {
    widget = {
        {
            {
                user_image,
                margins = {
                    left = 25,
                    right = 30,
                },
                widget  = wibox.container.margin,
            },
            {
                user_text,
                margins = {
                    left = 10,
                    top = 20,
                },
                widget  = wibox.container.margin,
            },
            layout = wibox.layout.fixed.horizontal,
        },
        margins = {
            left = 20,
            right = 20,
            top = 24,
            bottom = 24,
        },
        widget  = wibox.container.margin,
    },
    -- placement    = awful.placement.centered,
    preferred_positions = "left",
    preferred_anchors = "front",
    minimum_width = 300,
    minimum_height = 130,
    maximum_width = 300,
    maximum_height = 130,
    offset       = {
        x = -10,
    },
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
}
-- End User Info

-- Uptime
local uptime_text = wibox.widget {
    widget = wibox.widget.textbox,
    wrap = true,
    forced_width = 250,
    align = "center",
    valign = "center",
    font = "SFMono 13",
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
    markup = "<span font-weight='bold' foreground='"..beautiful.blue.."'>ﲾ</span>",
    forced_width = 250,
    align = "center",
    valign = "center",
    font = "SFMono 42",
}

local uptime_popup = awful.popup {
    widget = {
        {
            uptime_icon,
            margins = {
                left = 21,
                right = 21,
            },
            widget  = wibox.container.margin,
        },
        {
            uptime_text,
            margins = {
                left = 21,
                right = 21,
            },
            widget  = wibox.container.margin,
        },
        layout = wibox.layout.fixed.vertical,
    },
    -- placement    = awful.placement.centered,
    preferred_positions = "bottom",
    preferred_anchors = "front",
    minimum_width = 300,
    minimum_height = 140,
    maximum_width = 300,
    maximum_height = 140,
    offset       = {
        y = 10,
    },
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
}
-- End Uptime

-- System Specs
local cpu_progress = wibox.widget {
    max_value             = 1,
    value                 = 0.65,
    forced_height         = 10,
    forced_width          = 185,
    shape                 = gears.shape.rounded_bar,
    color                 = beautiful.orange,
    background_color      = beautiful.gray,
    widget                = wibox.widget.progressbar,
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/system --cpu", function(stdout)
            if tonumber(stdout) <= 9 then
                cpu_progress.value = tonumber(".0"..stdout)
            else
                cpu_progress.value = tonumber("."..stdout)
            end
        end)
    end
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
                cpu_text:set_markup("<span font-weight='bold' foreground='"..beautiful.orange.."'>0"..stdout.."</span>")
            elseif tonumber(stdout) == 100 then
                cpu_text:set_markup("<span font-weight='bold' foreground='"..beautiful.orange.."'>99</span>")
            else
                cpu_text:set_markup("<span font-weight='bold' foreground='"..beautiful.orange.."'>"..stdout.."</span>")
            end
        end)
    end
}

local cpu_icon = wibox.widget {
    widget = wibox.widget.textbox,
    markup = "<span font-weight='bold' foreground='"..beautiful.orange.."'></span>",
    font = "SFMono 26",
}

local cpu_popup = {
    {
        {
            cpu_icon,
            margins = {
                right = 5,
            },
            widget  = wibox.container.margin,
        },
        {
            cpu_progress,
            margins = {
                left = 10,
                right = 10,
                top = 20,
                bottom = 20,
            },
            widget  = wibox.container.margin,
        },
        {
            cpu_text,
            margins = {
                top = 20,
                left = 5,
            },
            widget  = wibox.container.margin,
        },
        layout = wibox.layout.fixed.horizontal,
    },
    margins = {
        left = 18,
        right = 18,
        top = 6,
    },
    widget  = wibox.container.margin,
}

local mem_progress = wibox.widget {
    max_value             = 1,
    value                 = 0.65,
    forced_height         = 10,
    forced_width          = 185,
    shape                 = gears.shape.rounded_bar,
    color                 = beautiful.cyan,
    background_color      = beautiful.gray,
    widget                = wibox.widget.progressbar,
}

timer {
    timeout = 1,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/system --mem", function(stdout)
            if tonumber(stdout) <= 9 then
                mem_progress.value = tonumber(".0"..stdout)
            else
                mem_progress.value = tonumber("."..stdout)
            end
        end)
    end
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
                mem_text:set_markup("<span font-weight='bold' foreground='"..beautiful.cyan.."'>0"..stdout.."</span>")
            elseif tonumber(stdout) == 100 then
                mem_text:set_markup("<span font-weight='bold' foreground='"..beautiful.orange.."'>99</span>")
            else
                mem_text:set_markup("<span font-weight='bold' foreground='"..beautiful.cyan.."'>"..stdout.."</span>")
            end
        end)
    end
}

local mem_icon = wibox.widget {
    widget = wibox.widget.textbox,
    markup = "<span font-weight='bold' foreground='"..beautiful.cyan.."'></span>",
    font = "SFMono 26",
}

local mem_popup = {
    {
        {
            mem_icon,
            margins = {
                right = 5,
            },
            widget  = wibox.container.margin,
        },
        {
            mem_progress,
            margins = {
                left = 10,
                right = 10,
                top = 20,
                bottom = 20,
            },
            widget  = wibox.container.margin,
        },
        {
            mem_text,
            margins = {
                top = 20,
                left = 5,
            },
            widget  = wibox.container.margin,
        },
        layout = wibox.layout.fixed.horizontal,
    },
    margins = {
        left = 18,
        right = 18,
        bottom = 6,
    },
    widget  = wibox.container.margin,
}

local specs_popup = awful.popup {
    widget = {
        cpu_popup,
        mem_popup,
        layout = wibox.layout.fixed.vertical,
    },
    -- placement    = awful.placement.centered,
    preferred_positions = "bottom",
    preferred_anchors = "front",
    minimum_width = 300,
    minimum_height = 150,
    maximum_width = 300,
    maximum_height = 150,
    offset       = {
        y = 10,
    },
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
}
-- End System Specs

-- Weather
local weather_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "SFMono 54",
}

timer {
    timeout = 300,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/weather_info --icon", function(icon)
            awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/weather_info --hex", function(hex)
                weather_icon:set_markup("<span font-weight='bold' foreground='"..hex:gsub("[\n\r]", "").."'>"..icon:gsub("[\n\r]", "").."</span>")
            end)
        end)
    end
}

local weather_temp = wibox.widget {
    widget = wibox.widget.textbox,
    font = "SFMono 14",
}

timer {
    timeout = 300,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/weather_info --temp", function(stdout)
            weather_temp:set_markup("<span font-weight='bold' foreground='"..beautiful.fg_normal.."'>"..stdout.."</span>")
        end)
    end
}

local weather_stat = wibox.widget {
    widget = wibox.widget.textbox,
    font = "SFMono 14",
    align = "center",
    valign = "center",
}

timer {
    timeout = 300,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/weather_info --stat", function(stdout)
            weather_stat:set_markup("<span font-weight='bold' foreground='"..beautiful.fg_normal.."'>"..stdout.."</span>")
        end)
    end
}

local weather_quote = wibox.widget {
    widget = wibox.widget.textbox,
    align = "center",
    valign = "center",
}

timer {
    timeout = 300,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/weather_info --quote2", function(stdout)
            weather_quote:set_markup("<span foreground='"..beautiful.fg_normal.."'>"..stdout.."</span>")
        end)
    end
}

local weather_popup = awful.popup {
    widget = {
        {
            {
                weather_icon,
                margins = {
                    left = 110,
                    right = -26,
                    top = -15,
                },
                widget  = wibox.container.margin,
            },
            {
                weather_temp,
                margins = {
                    top = 10,
                    left = -10,
                },
                widget  = wibox.container.margin,
            },
            align = "center",
            valign = "center",
            layout = wibox.layout.fixed.horizontal,
        },
        {
            weather_stat,
            margins = {
                top = -20,
            },
            widget  = wibox.container.margin,
        },
        {
            weather_quote,
            margins = {
                top = -20,
                left = 10,
                right = 10,
            },
            widget  = wibox.container.margin,
        },
        layout = wibox.layout.fixed.vertical,
    },
    preferred_positions = "right",
    preferred_anchors = "front",
    minimum_width = 330,
    minimum_height = 190,
    maximum_width = 330,
    maximum_height = 190,
    offset       = {
        x = 10,
    },
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
}
-- End Weather

-- Quote
local quote_text = wibox.widget {
    widget = wibox.widget.textbox,
    markup = "<span  foreground='"..beautiful.fg_normal.."'></span>",
    forced_width = 400,
    forced_height = 130,
}

timer {
    timeout = 600,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/quotes quote", function(stdout)
            quote_text:set_markup("<span  foreground='"..beautiful.fg_normal.."'>"..stdout:gsub("[\n\r]", "").."</span>")
        end)
    end
}

local author_text = wibox.widget {
    widget = wibox.widget.textbox,
    markup = "<span font-weight='bold' foreground='"..beautiful.fg_normal.."'></span>",
    align = "center",
    valign = "center",
}

timer {
    timeout = 600,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn.easy_async("sh /home/younix/.config/awesome/scripts/quotes author", function(stdout)
            author_text:set_markup("<span font-weight='bold' foreground='"..beautiful.fg_normal.."'>"..stdout:gsub("[\n\r]", "").."</span>")
        end)
    end
}

local quote_popup = awful.popup {
    widget = {
        {
            {
                quote_text,
                margins = {
                    left = 20,
                    right = 20,
                    top = -20,
                },
                widget  = wibox.container.margin,
            },
            {
                author_text,
                margins = {
                },
                widget  = wibox.container.margin,
            },
            layout = wibox.layout.fixed.vertical,
        },
        margins = 10,
        widget  = wibox.container.margin,
    },
    preferred_positions = "bottom",
    preferred_anchors = "front",
    offset       = {
        y = 10,
    },
    minimum_width = 450,
    minimum_height = 190,
    maximum_width = 450,
    maximum_height = 190,
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
}
-- End Quote

-- Quote and Author Timers
timer {
    timeout = 300,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn("sh /home/younix/.config/awesome/scripts/weather_info --getdata")
    end
}

timer {
    timeout = 600,
    call_now  = true,
    autostart = true,
    callback = function() 
        awful.spawn("sh /home/younix/.config/awesome/scripts/quotes update")
    end
}
-- End Quote and Author Items

-- Endeavour Logo Popup
local endeavour_icon = wibox.widget {
    widget = wibox.widget.imagebox,
    image = "/home/younix/.config/awesome/images/icons/EndeavourOS_Logo.svg"
}

local endeavour_popup = awful.popup {
    widget = {
        endeavour_icon,
        margins = 10,
        widget  = wibox.container.margin
    },
    preferred_positions = "right",
    preferred_anchors = "front",
    minimum_width = 80,
    minimum_height = 80,
    maximum_width = 80,
    maximum_height = 80,
    offset       = {
        x = 10,
    },
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
}
-- End Endeavour Logo Popup

-- Exit Popup
local exit_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "SFMono 52",
    markup = "<span font-weight='bold' foreground='"..beautiful.red.."'></span>"
}

local exit_popup = awful.popup {
    widget = {
        exit_icon,
        margins = {
            top = 10,
            bottom = 10,
            left = 15,
        },
        widget  = wibox.container.margin
    },
    preferred_positions = "right",
    preferred_anchors = "front",
    minimum_width = 80,
    minimum_height = 80,
    maximum_width = 80,
    maximum_height = 80,
    offset       = {
        x = 10,
    },
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
}
-- -- End Exit Popup

-- Screen Caputer
local full_screenshot_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "SFMono 52",
    markup = "<span font-weight='bold' foreground='"..beautiful.fg_normal.."'>濾</span>"
}

local section_screenshot_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "SFMono 52",
    markup = "<span font-weight='bold' foreground='"..beautiful.fg_normal.."'>礪</span>"
}

full_screenshot_icon:connect_signal("button::press", function()
    naughty.notify({ title = "Screenshot", text = "Full screenshot in 3 seconds", timeout = 2 })
    awful.spawn("sh /home/younix/.config/awesome/scripts/screenshot --full")
end)

section_screenshot_icon:connect_signal("button::press", function()
    naughty.notify({ title = "Screenshot", text = "Selection screenshot in 3 seconds", timeout = 2 })
    awful.util.spawn_with_shell("sh /home/younix/.config/awesome/scripts/screenshot --sec")
end)

local screencapture_popup = awful.popup {
    widget = {
        {
            full_screenshot_icon,
            margins = {
                left = 25,
            },
            widget  = wibox.container.margin
        },
        {
            section_screenshot_icon,
            margins = {
                left = 28,
            },
            widget  = wibox.container.margin
        },
        layout = wibox.layout.fixed.horizontal,
    },
    preferred_positions = "bottom",
    preferred_anchors = "front",
    minimum_width = 170,
    minimum_height = 100,
    maximum_width = 170,
    maximum_height = 100,
    offset       = {
        y = 10,
    },
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
}
-- End Screen Capture

-- Power Menu
local lock_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "SFMono 42",
    markup = "<span font-weight='bold' foreground='"..beautiful.green.."'></span>"
}

local logout_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "SFMono 42",
    markup = "<span font-weight='bold' foreground='"..beautiful.magenta.."'>﫼</span>"
}

local reboot_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "SFMono 42",
    markup = "<span font-weight='bold' foreground='"..beautiful.orange.."'></span>"
}

local power_icon = wibox.widget {
    widget = wibox.widget.textbox,
    font = "SFMono 42",
    markup = "<span font-weight='bold' foreground='"..beautiful.red.."'></span>"
}

lock_icon:connect_signal("button::press", function()
    awful.util.spawn_with_shell("sh ~/.config/awesome/scripts/lockscreen")
end)

logout_icon:connect_signal("button::press", function()
    awesome.quit()
end)

reboot_icon:connect_signal("button::press", function()
    awful.spawn("reboot")
end)

power_icon:connect_signal("button::press", function()
    awful.spawn("poweroff")
end)

local powermenu_popup = awful.popup {
    widget = {
        {
            lock_icon,
            margins = {
                top = 25,
                left = 70,
            },
            widget  = wibox.container.margin
        },
        {
            logout_icon,
            margins = {
                left = 70,
            },
            widget  = wibox.container.margin
        },
        {
            reboot_icon,
            margins = {
                left = 70,
            },
            widget  = wibox.container.margin
        },
        {
            power_icon,
            margins = {
                left = 70,
            },
            widget  = wibox.container.margin
        },
        layout = wibox.layout.fixed.vertical,
    },
    preferred_positions = "bottom",
    preferred_anchors = "front",
    minimum_width = 170,
    minimum_height = 440,
    maximum_width = 170,
    maximum_height = 440,
    offset       = {
        y = 10,
    },
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
}
-- End Power Menu

-- Toggle
local toggle_popup = function ()
    if not cal_popup.visible then
        cal_popup.visible = true
        clock_popup.visible = true
        theme_setter_popup.visible = true
        mode_setter_popup.visible = true
        user_popup.visible = true
        uptime_popup.visible = true
        specs_popup.visible = true
        weather_popup.visible = true
        quote_popup.visible = true
        endeavour_popup.visible = true
        exit_popup.visible = true
        screencapture_popup.visible = true
        powermenu_popup.visible = true

        clock_popup:move_next_to(cal_popup)
        theme_setter_popup:move_next_to(clock_popup)
        mode_setter_popup:move_next_to(theme_setter_popup)
        user_popup:move_next_to(clock_popup)
        uptime_popup:move_next_to(user_popup)
        specs_popup:move_next_to(uptime_popup)
        quote_popup:move_next_to(specs_popup)
        weather_popup:move_next_to(quote_popup)
        endeavour_popup:move_next_to(theme_setter_popup)
        exit_popup:move_next_to(endeavour_popup)
        screencapture_popup:move_next_to(endeavour_popup)
        powermenu_popup:move_next_to(screencapture_popup)
    else
        cal_popup.visible = false
        clock_popup.visible = false
        theme_setter_popup.visible = false
        mode_setter_popup.visible = false
        user_popup.visible = false
        uptime_popup.visible = false
        specs_popup.visible = false
        weather_popup.visible = false
        quote_popup.visible = false
        endeavour_popup.visible = false
        exit_popup.visible = false
        screencapture_popup.visible = false
        powermenu_popup.visible = false
    end
end

exit_icon:connect_signal("button::press", toggle_popup)

awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "space", toggle_popup,
              {description = "toggle info dashboard", group = "awesome"}),
})
-- End Toggle
-- -- End Info Dashboard

-- Lock Screen Toggle
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "Escape", function() 
        awful.util.spawn_with_shell("sh ~/.config/awesome/scripts/lockscreen") 
        end,
        {description = "toggle info dashboard", group = "awesome"}),
})
-- End Lock Screen Toggle

-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings({
    awful.button({ }, 3, function () mymainmenu:toggle() end),
})
-- }}}

-- {{{ Key bindings

-- General Awesome keys
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "w", function () awful.spawn("google-chrome-stable") end,
              {description = "show main menu", group = "awesome"}),
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

-- }}}

-- Rounded corners
client.connect_signal("manage", function (c)
    c.shape = gears.shape.rounded_rect
end)

-- {{{ Rules
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
-- }}}

-- {{{ Titlebars
-- Add a titlebar if titlebars_enabled is set to true in the rules.
-- client.connect_signal("request::titlebars", function(c)
--     -- buttons for the titlebar
--     local buttons = {
--         awful.button({ }, 1, function()
--             c:activate { context = "titlebar", action = "mouse_move"  }
--         end),
--         awful.button({ }, 3, function()
--             c:activate { context = "titlebar", action = "mouse_resize"}
--         end),
--     }

--     awful.titlebar(c).widget = {
--         { -- Left
--             awful.titlebar.widget.iconwidget(c),
--             buttons = buttons,
--             layout  = wibox.layout.fixed.horizontal
--         },
--         { -- Middle
--             { -- Title
--                 align  = "center",
--                 widget = awful.titlebar.widget.titlewidget(c)
--             },
--             buttons = buttons,
--             layout  = wibox.layout.flex.horizontal
--         },
--         { -- Right
--             awful.titlebar.widget.floatingbutton (c),
--             awful.titlebar.widget.maximizedbutton(c),
--             awful.titlebar.widget.stickybutton   (c),
--             awful.titlebar.widget.ontopbutton    (c),
--             awful.titlebar.widget.closebutton    (c),
--             layout = wibox.layout.fixed.horizontal()
--         },
--         layout = wibox.layout.align.horizontal
--     }
-- end)
-- }}}

-- {{{ Notifications
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

-- }}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)