local middleclass = require "lve.libs.middleclass"
local Event = require "lve.event.Event"

local EvTextEdit = middleclass("EvTextEdit", Event)
function EvTextEdit:initilize(text, start, length)
	Event.initilize(self)
	self.text, self.start, self.length = text, start, length
end

return EvTextEdit