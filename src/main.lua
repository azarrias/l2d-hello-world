local MOBILE_OS = (love._version_major > 0 or love._version_minor >= 9) and (love.system.getOS() == 'Android' or love.system.getOS() == 'OS X')
local WEB_OS = (love._version_major > 0 or love._version_minor >= 9) and love.system.getOS() == 'Web'
local WINDOW_WIDTH, WINDOW_HEIGHT = 1280, 720
local GAME_TITLE = 'Hello LÖVE2D!!'
local FONT_SIZE = 32

function love.load()
  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync = true,
    fullscreen = MOBILE_OS,
    resizable = not MOBILE_OS
  })
  
  font = love.graphics.newFont(FONT_SIZE)
  os_str = love.system.getOS()
  vmajor, vminor, vrevision, vcodename = love.getVersion()
  v_str = string.format("Love version: %d.%d.%d - %s", vmajor, vminor, vrevision, vcodename)
  bd_str = love.filesystem.getSourceBaseDirectory()
  wd_str = love.filesystem.getWorkingDirectory()
  
  love.keyboard.keysPressed = {}
end

function love.update(dt)
  -- exit if esc is pressed
  if love.keyboard.keysPressed['escape'] then
    love.event.quit()
  end
  
  love.keyboard.keysPressed = {}
end
  
-- Callback that processes key strokes just once
-- Does not account for keys being held down
function love.keypressed(key)
  love.keyboard.keysPressed[key] = true
end

function love.draw()
  love.graphics.setFont(font)
  love.graphics.print(GAME_TITLE, 0, 0)
  love.graphics.print("O.S.: " .. os_str, 0, 64)
  love.graphics.print(v_str, 0, 96)
  love.graphics.print("Source base path: " .. bd_str, 0, 128)
  love.graphics.print("Working path: " .. wd_str, 0, 160)
end