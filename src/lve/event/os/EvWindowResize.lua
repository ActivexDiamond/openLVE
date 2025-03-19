local middleclass = require "lve.libs.middleclass"
local Event = require "lve.event.Event"

local EvWindowResize = middleclass("EvWindowResize", Event)
function EvWindowResize:initialize(w, h)
	Event.initialize(self)
	self.w, self.h = w, h
end

return EvWindowResize
