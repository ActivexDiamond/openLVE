local middleclass = require "lve.libs.middleclass"
local Event = require "lve.event.Event"

local EvGameQuit = middleclass("EvGameQuit", Event)
function EvGameQuit:initialize()
	Event.initialize(self)
end

return EvGameQuit
