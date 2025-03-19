local middleclass = require "lve.libs.middleclass"

local EvKeyboard = require "lve.event.keyboard.EvKeyboard"

---@class EvKeyPress : EvKeyboard
local EvKeyPress = middleclass("EvKeyPress", EvKeyboard)
function EvKeyPress:initialize(key, scancode, shift, control, alt, super)
	EvKeyboard.initialize(self, key, scancode, EvKeyboard.PRESS, shift, control, alt, super)
end

return EvKeyPress
