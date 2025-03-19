local middleclass = require "lve.libs.middleclass"

local EvMouseClick = require "lve.event.mouse.EvMouseClick"

local EvMouseRelease = middleclass("EvMouseRelease", EvMouseClick)
function EvMouseRelease:initialize(x, y, button, shift, control, alt, super)
	EvMouseClick.initialize(self, x, y, button, EvMouseClick.RELEASE, shift, control, alt, super)
end

return EvMouseRelease
