local Window = require "lve.Window"
local EventSystem = require "lve.event.EventSystem"

---@class WINDOW : Window
---@overload fun(): self
local WINDOW = Window(800, 600, "OpenLVE", {cursor = 'disabled'})

function WINDOW:run()
	while not WINDOW:shouldClose() do
		WINDOW:update()
		WINDOW:draw()
	end
end






return WINDOW
