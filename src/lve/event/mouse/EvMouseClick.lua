local middleclass = require "lve.libs.middleclass"

local EvMouse = require "lve.event.mouse.EvMouse"

local EvMouseClick = middleclass("EvMouseClick", EvMouse)
function EvMouseClick:initialize(x, y, button, direction, shift, control, alt, super)
	EvMouse.initialize(self)
	self.x, self.y, self.button, self.direction = x, y, button, direction
	self.shift, self.control, self.alt, self.super = shift, control, alt, super
end

return EvMouseClick
