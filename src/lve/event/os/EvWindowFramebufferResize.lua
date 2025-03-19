local middleclass = require "lve.libs.middleclass"
local Event = require "lve.event.Event"

local EvWindowFrameBufferResize = middleclass("EvWindowFrameBufferResize", Event)
function EvWindowFrameBufferResize:initialize(w, h)
	Event.initialize(self)
	self.w, self.h = w, h
end

return EvWindowFrameBufferResize
