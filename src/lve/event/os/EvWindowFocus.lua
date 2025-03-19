local middleclass = require "lve.libs.middleclass"
local Event = require "lve.event.Event"

local EvWindowFocus = middleclass("EvWindowFocus", Event)
function EvWindowFocus:initialize(focus)
	Event.initialize(self)
	self.focus = focus
end

return EvWindowFocus
