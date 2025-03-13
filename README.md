# OpenLVE (Open Lua Voxel Engine)
Trying out some simple voxel rendering (and such) in LuaJIT and OpenGL 4.5+.

# Deps
- LuaJIT 2.1 (Lua 5.1) (Tested with LuaJIT 2.1.1736781742, but should work with any 2.1.x version)
- [lua-compat-5.3](https://github.com/lunarmodules/lua-compat-5.3) 
- MoonLibs (\**Note that these all use a slightly modified version to allow them to work with LuaJIT!*)
	+ MoonGL 0.6 with GLEW 2.2.0
	+ MoonGLFW 0.12
	+ MoonGLMath 0.6
	+ MoonImage 0.3
	+ MoonFreeType 0.2
- OpenGL 4.5 (3.x or even older might&trade; also work.)
- GLFW 3.4.0 (Or any version that is compatible with your OpenGL version)



*How to modify MoonLibs to run under LuaJIT: 
1. For each MoonLib module, make sure that `LUAVER` inside `src/Makefile` is set to `5.1` (Either by modifying the makefile yourself, or making sure that you currently have Lua 5.1 as your default Lua installation) before running their installation commands. (See [this comment](https://www.reddit.com/r/lua/comments/1j4y6dn/comment/mhglvv9/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) for more detail.)
2. To use those, you'll also need to make sure you have [lua-compat53]() installed and `requir`ed. You can do this by either requiring it at the top of your main file, or modifying the MoonLibs source code (Lua side) to include it. 