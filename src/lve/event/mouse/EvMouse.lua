local middleclass = require "lve.libs.middleclass"
local Event = require "lve.event.Event"

local EvMouse = middleclass("EvMouse", Event)
function EvMouse:initilize()
	Event.initilize(self)
end

EvMouse.static.PRESS = 0
EvMouse.static.RELEASE = 1

EvMouse.static.LEFT = 'left'
EvMouse.static.RIGHT = 'right'
EvMouse.static.MIDDLE = 'middle'
EvMouse.static.Button4 = 'button 4'
EvMouse.static.Button5 = 'button 5'
EvMouse.static.Button6 = 'button 6'
EvMouse.static.Button7 = 'button 7'
EvMouse.static.Button8 = 'button 8'

return EvMouse
