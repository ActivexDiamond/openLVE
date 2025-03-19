local middleclass = require "lve.libs.middleclass"

local EvMouseClick = require "lve.event.mouse.EvMouseClick"

local EvMousePress = middleclass("EvMousePress", EvMouseClick)
function EvMousePress:initilize(x, y, button, shift, control, alt, super)
	EvMouseClick.initilize(self, x, y, button, EvMouseClick.PRESS, shift, control, alt, super)
end

return EvMousePress
