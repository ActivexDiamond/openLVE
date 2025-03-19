local middleclass = require "lve.libs.middleclass"
local Event = require "lve.event.Event"

local EvTextInput = middleclass("EvTextInput", Event)
function EvTextInput:initilize(codepoint)
	Event.initilize(self)
	self.codepoint = codepoint
end

return EvTextInput
