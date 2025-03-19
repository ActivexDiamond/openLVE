local middleclass = require "lve.libs.middleclass"
 
local glfw = require "moonglfw"
local gl = require "moongl"

-- local EventSystem = require "lve.event.EventSystem"

local EvKeyPress = require "lve.event.keyboard.EvKeyPress"
local EvKeyRelease = require "lve.event.keyboard.EvKeyRelease"
-- local EvTextInput = require "lve.event.keyboard.EvTextInput"

local EvMousePress = require "lve.event.mouse.EvMousePress"
local EvMouseRelease = require "lve.event.mouse.EvMouseRelease"
local EvMouseWheel = require "lve.event.mouse.EvMouseWheel"
local EvMouseMove = require "lve.event.mouse.EvMouseMove"


local EvWindowFocus = require "lve.event.os.EvWindowFocus"
local EvWindowResize = require "lve.event.os.EvWindowResize"
local EvWindowFramebufferResize = require "lve.event.os.EvWindowFramebufferResize"

--TODO: EvGameQuit
--TODO: EvWindowShouldClose 

--============================ Helper Methods ==============================
local function hookIntoGlfwEvents(self)
	local evKeyPress = EvKeyPress:newUnlocked()
	local evKeyRelease = EvKeyRelease:newUnlocked()
	glfw.set_key_callback(self.window, function(_, key, scancode, action, shift, control, alt, super)
		if action == 'repeat' then 
			return
		elseif action == 'press' then
			evKeyPress.key, evKeyPress.scancode = key, scancode
			evKeyPress.shift, evKeyPress.control, evKeyPress.alt, evKeyPress.super = shift, control, alt, super
			self.eventSystem:_fire(evKeyPress)
		elseif action == 'release' then
			evKeyRelease.key, evKeyRelease.scancode = key, scancode
			evKeyRelease.shift, evKeyRelease.control, evKeyRelease.alt, evKeyRelease.super = shift, control, alt, super
			self.eventSystem:_fire(evKeyRelease)
		end --Currently, 'repeat' is ignored.
	end)

	local evTextInput = EvTextInput:newUnlocked()
	glfw.set_char_callback(self.window, function(codepoint)
		evTextInput.codepoint = codepoint
		self.eventSystem:_fire(evTextInput)
	end)

	local evMousePress = EvMousePress:newUnlocked()
	local evMouseRelease = EvMouseRelease:newUnlocked()
	glfw.set_mouse_button_callback(self.window, function(_, button, action, shift, control, alt, super)
		if action == 'press' then
			evMousePress.x, evMousePress.y = self:getMousePosition()
			evMousePress.button, evMousePress.direction = button, EvMousePress.PRESS
			evMousePress.shift, evMousePress.control, evMousePress.alt, evMousePress.super = shift, control, alt, super
			self.eventSystem:_fire(evMousePress)
		else 
			evMouseRelease.x, evMouseRelease.y = self:getMousePosition()
			evMouseRelease.button, evMouseRelease.direction = button, EvMouseRelease.RELEASE
			evMouseRelease.shift, evMouseRelease.control, evMouseRelease.alt, evMouseRelease.super = shift, control, alt, super
			self.eventSystem:_fire(evMouseRelease)
		end
	end)

	local evMouseWheel = EvMouseWheel:newUnlocked()
	glfw.set_scroll_callback(self.window, function(_, xOffset, yOffset)
		evMouseWheel.wheelDx, evMouseWheel.wheelDy = xOffset, yOffset
		self.eventSystem:_fire(evMouseWheel)
	end)
	
	local evWindowFocus = EvWindowFocus:newUnlocked()
	glfw.set_window_focus_callback(self.window, function(_, focused)
		evWindowFocus.focus = focused
		self.eventSystem:_fire(evWindowFocus)
	end)

	local evWindowResize = EvWindowResize:newUnlocked()
	glfw.set_window_size_callback(self.window, function(_, width, height)
		evWindowResize.w , evWindowResize.h = width, height
		self.eventSystem:_fire(evWindowResize)
	end)
	
	local evWindowFramebufferResize = EvWindowFramebufferResize:newUnlocked()
	glfw.set_framebuffer_size_callback(self.window, function(window, width, height)
		evWindowFramebufferResize.w , evWindowFramebufferResize.h = width, height
		local previousWindow = glfw.get_current_context()
		if previousWindow ~= window then glfw.make_context_current(window) end
		gl.viewport(0, 0, width, height)
		if previousWindow ~= window then glfw.make_context_current(previousWindow) end

		self.eventSystem:_fire(evWindowFramebufferResize)
	end)

	glfw.set_error_callback(function(errorCode, description)
		print("Got error from GLFW, code:", errorCode)
		print(description)
	end)
end

--============================ Constructor ==============================
---@class Window: Middleclass
---@overload fun(w: integer, h: integer, title: string, opt: table?): self
local Window = middleclass("Window")
function Window:initialize(w, h, title, opt)
	self.w = w or 800
	self.h = h or 600
	self.title = title or "No Title"

	glfw.window_hint('context version major', 4)
	glfw.window_hint('context version minor', 5)
	glfw.window_hint('opengl profile', 'core')

	self.window = glfw.create_window(self.w, self.h, self.title)
	for k, v in pairs(opt or {}) do
		if k ~= nil then --false is a valid value.
			glfw.set_input_mode(self.window, k, v)
		end
	end

	self.eventSystem = EventSystem()
	hookIntoGlfwEvents(self)
end

--============================ Core API ==============================
function Window:update()
	glfw.poll_events()
	self.eventSystem:poll()
end

function Window:draw()
end

--============================ Getters / Setters ==============================
---@return boolean glfw_should_close The should close flag used by glfw.
function Window:shouldClose() return glfw.window_should_close(self.window) end

function Window:getMousePosition() return glfw.get_cursor_pos(self.window) end
return Window

