local middleclass = require "lve.libs.middleclass"

local EvKeyboard = require "lve.event.keyboard.EvKeyboard"

local EvKeyRelease = middleclass("EvKeyRelease", EvKeyboard)
function EvKeyRelease:initialize(key, scancode, shift, control, alt, super)
	EvKeyboard.initialize(self, key, scancode, EvKeyboard.RELEASE, shift, control, alt, super)
end

return EvKeyRelease
