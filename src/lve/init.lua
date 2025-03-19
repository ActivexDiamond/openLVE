local glfw = require "moonglfw"
local WINDOW = require "lve.globals.WINDOW"

local EvKeyboard = require "lve.event.keyboard.EvKeyboard"
local EvKeyPress = require "lve.event.keyboard.EvKeyPress"
local EvKeyRelease = require "lve.event.keyboard.EvKeyRelease"

local curEv = require "lve.event.Event"

WINDOW.eventSystem:attach({}, curEv, function(_, e)
	for k, v in pairs(e) do print(k, v) end
end)

WINDOW.eventSystem:attach({}, EvKeyPress, function(_, e)
	if e.key == 'escape' then glfw.set_window_should_close(WINDOW.window, true) end
end)

local gl = require "moongl"
glfw.make_context_current(WINDOW.window)
-- gl.init()

print(glfw.get_current_context())
WINDOW:run()

a = EvKeyPress()
b = EvKeyPress()

print(b)

local c = 3

c = 1900

c = 2

print(c)
