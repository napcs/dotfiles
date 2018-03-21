-- global
-- No animation
hs.window.animationDuration = 0

local mash = {"cmd", "alt", "ctrl"}

--------------------------- Move windows
-- Maximize window on screen
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", function()
  local win = hs.window.focusedWindow()
  win:maximize(0)
end)

-- Push window to the left side
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f, 0)
end)

-- Push window to the right side
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f,0)
end)

-- Push window to the top half
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.h = max.h / 2
  f.w = max.w
  win:setFrame(f,0)
end)

-- Push window to the bottom half
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.h / 2
  f.h = max.h / 2
  f.w = max.w
  win:setFrame(f,0)
end)


-- Windows upper left corner
hs.hotkey.bind({"ctrl","shift", "alt"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f, 0)
end)

-- Window upper right corner
hs.hotkey.bind({"ctrl","shift", "alt"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.w / 2
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f, 0)
end)

-- Window lower left corner
hs.hotkey.bind({"ctrl","shift", "alt"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.h / 2
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f, 0)
end)

-- Window lower right corner
hs.hotkey.bind({"ctrl","shift", "alt"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.w / 2
  f.y = max.h / 2
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f, 0)
end)


--------------------------------------- Pixel movement

-- Move window left 50px
hs.hotkey.bind({"shift", "alt"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 50
  win:setFrame(f)
end)

-- Move window right 50px
hs.hotkey.bind({"shift", "alt"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 50
  win:setFrame(f)
end)

-- Move window up 50px
hs.hotkey.bind({"shift", "alt"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 50
  win:setFrame(f)
end)

-- Move window down 50px
hs.hotkey.bind({"shift", "alt"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 50
  win:setFrame(f)
end)


-- Window hints
hs.hotkey.bind({"ctrl", "cmd", "alt"}, "K", function()
  hs.hints.windowHints()
end)


-- Move windows to other screens
hs.hotkey.bind({"ctrl", "alt"}, "Right", hs.grid.pushWindowNextScreen)
hs.hotkey.bind({"ctrl", "alt"}, "Left", hs.grid.pushWindowPrevScreen)
hs.hotkey.bind({"ctrl", "alt"}, "Up", hs.grid.pushWindowNextScreen)
hs.hotkey.bind({"ctrl", "alt"}, "Down", hs.grid.pushWindowPrevScreen)

-- Grid
hs.hotkey.bind({"cmd"}, "G", hs.grid.show)


-- Experimental spaces support
-- Move the current focused window to the space to the left or right.
-- Somewhat hackis. Just grabs the current x/y coords, presses the mouse down,
-- triggers the keybindings to move to the next space, sleeps, and then lets
-- the mouse up, which drops the window.



-- move a window to an adjacent Space
function moveWindowOneSpace(direction)
   local mouseOrigin = hs.mouse.getAbsolutePosition()
   local win = hs.window.focusedWindow()
   clickPoint.x = clickPoint.x + (clickPoint.w + 5)
   clickPoint.y = clickPoint.y + (clickPoint.h / 2)

    local visibleWindows = hs.window.orderedWindows()
    for i, window in ipairs(visibleWindows) do
      if window:application():title() == "Google Chrome" then
        clickPoint.x = clickPoint.x + (clickPoint.w + 5)
        clickPoint.y = clickPoint.y + (clickPoint.h / 2)
      else
        window:focus()
        win = window
        break
      end
    end



   local mouseClickEvent = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, clickPoint)
   mouseClickEvent:post()
   hs.timer.usleep(150000)

   local nextSpaceDownEvent = hs.eventtap.event.newKeyEvent({"ctrl"}, direction, true)
   nextSpaceDownEvent:post()
   hs.timer.usleep(150000)

   local nextSpaceUpEvent = hs.eventtap.event.newKeyEvent({"ctrl"}, direction, false)
   nextSpaceUpEvent:post()
   hs.timer.usleep(150000)

   local mouseReleaseEvent = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, clickPoint)
   mouseReleaseEvent:post()
   hs.timer.usleep(150000)

   mouse.setAbsolutePosition(mouseOrigin)
end


hk1 = hs.hotkey.bind(mash, "=",
             function() moveWindowOneSpace("right") end)
hk2 = hs.hotkey.bind(mash, "-",
             function() moveWindowOneSpace("left") end)
