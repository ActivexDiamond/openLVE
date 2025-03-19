print("Setting stdout's vbuf mode to 'no'. This is needed for some consoles to work properly.")
io.stdout:setvbuf("no")

print("Prepending './?/init.lua' to package.path so that libs/modules using the newer modname/init paradigm work with our LuaJIT version.")
package.path = "./?/init.lua;" .. package.path

local lveVersion = require "version"
local gl = require "moongl"
local glfw = require "moonglfw"
local glMath = require "moonglmath"
local freeType = require "moonfreetype"
local stbImage = require "moonimage"


print("============================================================")
print("Running Lua version:      ", _VERSION)
if jit then
	print("Running Luajit version:   ", jit.version)
end
print("Running MoonGL version: ", gl._VERSION)
print("Running GLEW version  : ", gl._GLEW_VERSION)
print("Running (Moon) GLFW version: ", "(" .. glfw._VERSION .. ") " .. glfw._GLFW_VERSION)
print("Running MoonGLMath version: ", glMath._VERSION)
print("Running MoonImage version: ", stbImage._VERSION)
print("Running MoonFreeType version: ", freeType._VERSION)

print("\nRunning Open Lua Voxel Engine version: ", lveVersion)

print("\nCurrently using the following 3rd-party libraries (and possibly more):")
print("middleclass\tBy Kikito\tSingle inheritance OOP in Lua\t[MIT License]")
--print("bump\t\tBy Kikito\tSimple platformer physics.\t[MIT License]")
--print("suit\t\tBy vrld\t\tImGUIs for Lua/Love2D\t\t[MIT License]")
print("Huge thanks to (Kikito) for their wonderful contributions to the community; and for releasing their work under such open licenses!")
--print("Huge thanks to (Kikito and vrld) for their wonderful contributions to the community; and for releasing their work under such open licenses!")
print("============================================================")	
print("Example Run")
print("============================================================")

require "lve"  
