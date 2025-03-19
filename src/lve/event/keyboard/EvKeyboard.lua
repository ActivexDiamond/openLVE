local middleclass = require "lve.libs.middleclass"
local Event = require "lve.event.Event"

---@class EvKeyboard
---@overload fun(): self
local EvKeyboard = middleclass("EvKeyboard", Event)
function EvKeyboard:initialize(key, scancode, direction, shift, control, alt, super)
	Event.initialize(self)
	self.key, self.scancode, self.direction = key, scancode, direction
	self.shift, self.control, self.alt, self.super = shift, control, alt, super
end

EvKeyboard.static.PRESS = 0
EvKeyboard.static.RELEASE = 1

return EvKeyboard
