-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
vicious = require("vicious")
require("calendar2")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.add_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
-- beautiful.init("/usr/share/awesome/themes/sky/theme.lua")
beautiful.init("/home/chenbk/.config/awesome/theme/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "xterm"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.right,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
 tags = {
   names  = { "1-main", "2-xterm", "3-ssh", "4-rdesktop", "5-office", "6-music", "7-virtual", 8, 9 },
   layout = { layouts[1], layouts[3], layouts[13], layouts[11], layouts[11],
              layouts[11], layouts[1], layouts[1], layouts[1]
 }}
 for s = 1, screen.count() do
     -- Each screen has its own tag table.
     tags[s] = awful.tag(tags.names, s, tags.layout)
 end
 -- }}}

-- {{{ Menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "reload", awesome.restart },
   { "注销", awesome.quit },
   { "锁屏", "xscreensaver-command -lock" },
   { "休眠", "sudo hibernate-ram" },
   { "重启", "sudo reboot" },
   { "关机", "sudo shutdown" }
}

appsmenu = {
   { "播放器-XBMC", "xbmc" },
   { "播放器-Mocp", "xterm -T \"mocp\" -e mocp /home/chenbk/douban.fm/" },
   { "播放器-RadioGet", "xterm -T \"radioget\" -e radioget" },
   { "播放器-Audacious", "audacious" },
   { "播放器-Smplayer2", "smplayer2" },
   { "douban.fm", "xterm -T \"douban\" -e douban.fm" },
   { "画图-Gimp", "gimp" },
   { "虚拟机-VirtualBox", "VirtualBox" },
   { "下载-Qbittorrent", "qbittorrent" },
   { "下载-aMule", "amule" },
   { "下载-FileZilla", "filezilla" },
   { "远程-TeamViewer", "teamviewer8" },
   { "看图-ImageMagick", "display" },
   { "看图-gqview", "gqview /home/chenbk/04_Image" },
   { "聊天-Skype", "skype" },
   { "录音-Audacity", "audacity" },
   { "浏览器-firefox", "firefox-bin" },
   { "浏览器-chrome", "google-chrome-stable" },
   { "浏览器-Opera", "opera" },
   { "libreoffice-文本文档", "libreoffice --writer" },
   { "libreoffice-电子表格", "libreoffice --calc" },
   { "libreoffice-数据库", "libreoffice --base" },
   { "libreoffice-演示文稿", "libreoffice --draw" },
   { "librcad-CAD设计", "librecad" },
   { "Dia设计", "dia" },
   { "Xmind设计", "xmind" },
   { "文本编辑-gvim", "gvim" },
   { "文本编辑-PHP IDE", "phpstorm" },
   { "文本编辑-Sublime", "subl" },
   { "文本编辑-leafpad", "leafpad" },
   { "资源管理-mc", "xterm -T \"mc\" -e mc -S \"sand256\"" },
   { "资源管理-ranger", "xterm -T \"ranger\" -e ranger --confdir=~/.config/ranger" },
   { "资源管理-Pcmanfm", "pcmanfm" },
   { "Mysql管理工具", "mysql-workbench" },
   { "任务查看器-htop", terminal .. " -e htop" },
}

rdesktopmenu = {
   { "192.168.1.61_AD_SHAREPOINT" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.1.61" },
   { "192.168.1.82_统一维护机" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.1.82" },
   { "192.168.1.36_PREDEV" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.1.36" },
   { "192.168.23.216_ABSRV" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.23.216" },
   { "192.168.23.219_DMQ" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.23.219" },
   { "192.168.23.220_点餐" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.23.220" },
   { "192.168.1.46_Slot_PREDEV1" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.1.46" },
   { "192.168.23.232_Slot_PREDEV2" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.23.232" },
   { "192.168.1.120_SD_DEV" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.1.120" },
   { "192.168.23.214_WSD_DEV" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.23.214" },
   { "192.168.23.215_WSD_PREDEV" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.23.215" },
   { "192.168.23.217_BD_PREDEV" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.23.217" },
   { "192.168.1.177_BD_DEV" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.1.177" },
   { "192.168.23.225_BD_DESDEV" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.23.225" },
   { "192.168.1.176_MCD_DEV" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.1.176" },
   { "192.168.23.233_MCD_PREDEV" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.23.233" },
   { "192.168.23.230_MCD_DES" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.23.230" },
   { "192.168.23.231_MCD_QA" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.23.231" },
   { "192.168.1.184_BZB_FILES_SRV" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.1.184" },
   { "192.168.1.182_SL_AD_SRV" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.1.182" },
   { "192.168.1.181_SL_SPS_SRV" , "/home/chenbk/03_Shell/rdesktop.sh 192.168.1.181" },
}

sshmenu = {
   { "192.168.23.210_BZB_SVN_SRV" , "xterm -e ssh root@192.168.23.210" },
   { "192.168.23.228_BZB_QT_SRV" , "xterm -e ssh root@192.168.23.228" },
   { "192.168.23.223_BZB_NAGIOS" , "xterm -e ssh root@192.168.23.223" },
   { "192.168.23.222_BZB_DB_SRV" , "xterm -e ssh root@192.168.23.222" },
   { "192.168.23.204_BZB_REDMINE_TEST" , "xterm -e ssh root@192.168.23.204" },
   { "192.168.23.251_XS_VM01" , "xterm -e ssh root@192.168.23.251" },
   { "192.168.23.252_XS_VM02" , "xterm -e ssh root@192.168.23.252" },
   { "192.168.23.250_XS_VM03" , "xterm -e ssh root@192.168.23.250" },
   { "192.168.23.253_XS_VM04" , "xterm -e ssh root@192.168.23.253" },

}

mymainmenu = awful.menu({ items = {
                    { "截图-Scrot", "scrot -s /home/chenbk/04_Image/01_jietu/%Y-%m-%d_%H%m.png" },
                    { "awesome", myawesomemenu },
                    { "apps", appsmenu },
				    { "远程桌面", rdesktopmenu },
				    { "SSH连接", sshmenu },
                    { "terminal", terminal },
				    { "Firefox", "firefox-bin" },
				    { "FileZilla", "filezilla" },
				    { "Gvim", "gvim" },
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}


-- {{{ Wibox
-- Create a textclock widget
--mytextclock = awful.widget.textclock({ align = "right" })
-- Date box
datewidget = widget({type="textbox"})
vicious.register(datewidget, vicious.widgets.date,"%m月%d日 %H:%M",60)
calendar2.addCalendarToWidget(datewidget)
-- orglendar = require("orglendar")
-- orglendar.files = { "/home/chenbk/Documents/Notes/work.org" }
-- orglendar.register(datewidget)

-- net monitor
netwidget = widget({type="textbox"})
netwidget.width = "80"
netwidget.align = "center"
vicious.register(netwidget, vicious.widgets.net,'<span color="#000000">↓${enp3s0 down_kb}</span> <span color="#000000">↑${enp3s0 up_kb}</span>',3)

-- Memory usage
memwidget = awful.widget.progressbar()
-- Progressbar properties
memwidget:set_width(15)
memwidget:set_height(24)
memwidget:set_vertical(true)
memwidget:set_background_color("#494B4F")
memwidget:set_border_color(nil)
memwidget:set_color("#AECF96")
memwidget:set_gradient_colors({ "#AECF96", "#88A175", "#FF5656" })
-- Register widget
vicious.register(memwidget, vicious.widgets.mem, "$1", 20)


-- CPU
-- Initialize widget
cpuwidget = awful.widget.graph()
-- Graph properties
cpuwidget:set_width(50)
cpuwidget:set_height(24)
cpuwidget:set_background_color("#494B4F")
cpuwidget:set_color("#FF5656")
cpuwidget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })
-- Register widget
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")




-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        datewidget,
        netwidget,
        cpuwidget.widget,
        memwidget.widget,
        s == 1 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end),
-- 自定义键
    awful.key({ modkey,          }, "p",
        function (c)
            awful.util.spawn("scrot.sh")
        end),
    awful.key({ modkey,          }, "e",
        function (c)
            awful.util.spawn("mc")
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
   {rule = {class = "MPlayer"},
    properties = {floating = true, tag = tags[1][6]}},
   {rule = {class = "xbmc"},
    properties = {floating = true, tag = tags[1][6]}},
   {rule = {class = "Smplayer"},
    properties = {floating = true, tag = tags[1][6]}},
   { rule = {class = "pinentry" },
     properties = { floating = true } },
   { rule = {class = "gimp" },
     properties = { floating = true, tag = tags[1][5] } },
   { rule = { name="mc" },
     properties = { tag = tags[1][5] } },
   { rule = { name="ranger" },
     properties = { tag = tags[1][5] } },
   { rule = { class = "Pcmanfm" },
     properties = { tag = tags[1][5] } },
   {rule = {class = "Firefox"},
     properties = {tag = tags[1][1]}},
   {rule = {class = "Firefox", name = "Download"},
     properties = {floating = true}},
   {rule = {class = "VirtualBox"},
     properties = {floating = true, tag = tags[1][7]}},
   {rule = {name = "ssh"},
     properties = {tag = tags[1][3]}},
   {rule = {name = "rdesktop_freerdp"},
     properties = {tag = tags[1][4]}},
   {rule = {name = "rdesktop"},
     properties = {tag = tags[1][4]}},
--   {rule = {class = "libreoffice"},
--     properties = {tag = tags[1][5]}},
   {rule = {name = "cli"},
     properties = {tag = tags[1][2]}},
   {rule = {name = "douban.fm"},
     properties = {tag = tags[1][6]}},
   {rule = {name = "mocp"},
     properties = {tag = tags[1][6]}},
   {rule = {name = "RadioGet V0.2.4"},
     properties = {tag = tags[1][6]}},
   {rule = {name = "radioget"},
     properties = {tag = tags[1][6]}},
   -- Set Firefox to always map on tags number 2 of screen 1.
   --{ rule = { class = "Firefox" },
   -- properties = { tag = tags[1][2] } },
   -- Set Firefox to always map on tags number 2 of screen 1.
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{ 自启动项
-- Autorun programs
autorun = true
autorunApps =
{
    "fcitx",
    "firefox-bin",
    "xterm -T \"radioget\" -e radioget",
    "xterm -T \"rdesktop\" -e /home/chenbk/01_Shell/rdesktop.sh",
    "xterm -T \"ssh\" -e /home/chenbk/01_Shell/ssh.sh",
 --   "xterm -T \"rdesktop_freerdp\" -e /home/chenbk/01_Shell/rdesktop_freerdp.sh 192.168.23.6",
    "xterm -T \"cli\"",
    "xterm -T \"cli\"",
--    "xterm -T \"mc\" -e mc -S \"sand256\"",
    "xterm -T \"ranger\" -e ranger --confdir=~/.config/ranger",
    "VirtualBox",
    "pcmanfm",
--    "~/.conky/bin/conkyStart",
    "sudo killall mplayer",
}

if autorun then
    for app = 1, #autorunApps do
        awful.util.spawn_with_shell(autorunApps[app])
    end
end
-- }}}

-- {{{ 自启动项
-- awful.util.spawn_with_shell("gvim")
-- awful.util.spawn_with_shell("synergys --debug ERROR --log /var/log/synergy.log")
-- awful.util.spawn_with_shell("fcitx")
-- awful.util.spawn_with_shell("firefox")
-- awful.util.spawn_with_shell("xterm -e douban.fm")
-- awful.util.spawn_with_shell("xterm -e /home/chenbk/03_Shell/rdesktop.sh")
-- awful.util.spawn_with_shell("xterm")
-- awful.util.spawn_with_shell("xterm")
-- awful.util.spawn_with_shell("xterm -e mc")
-- awful.util.spawn_with_shell("~/.conky/bin/conkyStart")
-- awful.util.spawn_with_shell("sudo killall mplayer")
-- }}}

