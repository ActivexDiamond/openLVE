local glfw = require "moonglfw"

lvr = {}
lvr.window = glfw.create_window(800, 600, "OpenLVR")

require "lve.initEvents"

while not glfw.window_should_close(lvr.window) do
	glfw.poll_events()
	-- lvr.events.poll()
end

