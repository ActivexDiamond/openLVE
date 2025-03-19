local middleclass = require "lve.libs.middleclass"
local EvMouse = require "lve.event.mouse.EvMouse"

local EvMouseWheel = middleclass("EvMouseWheel", EvMouse)
function EvMouseWheel:initialize(wheelDx, wheelDy)
	EvMouse.initialize(self)
	self.wheelDx, self.wheelDy = wheelDx, wheelDy 
end

return EvMouseWheel

