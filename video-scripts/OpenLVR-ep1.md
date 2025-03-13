[1]So, I've been wanting to try my hand at a voxel renderer since I was a little kid, and today, it's finally time to make that happen.

Now, I know the title of this video says "Minecraft Clone", but that's, uh, clickbait. Well, not really. [3]Minecraft is really just a voxel renderer with a lot of opinions, gameplay, and textures. [4]And I'm also making a voxel render, just... with my own opinions, gameplay, and textures.

[Fade Out To Black, slight pause]

So first off, we need a way to talk to our [5]GPU. That's where OpenGL comes in. <u>OpenGL is a Graphis API, which allows you to send data into (and from) your GPU and tell the GPU to do stuff with that data.</u>

[Fade out to gray]

But before we can render things with OpenGL, we need to ask the operating system to give us a [6]window, inside of which we can draw things. This window will also allow us to get user input, such as mouse and keyboard. Now, different operating systems have different APIs or Libraries for doing this. Such as the Win32API for Windows, or X and Wayland for Linux, etc... [8]To allow our Voxel Renderer to run on as many OSes as possible, I'd need to write code for as many of those APIs as possible, and automatically detect which one to use depending on the OS the renderer is running on. This is pretty cumbersome to do, and not really exciting. So we'll be using GLFW to handle all that for us. It's a library that will get us a window, as well as input from keyboards, mice, joysticks, and more, in an OS-agnostic way.

Lastly, I'll also be using a math library to handle things like [9]Matrix and vector algebra.

Now, with that short list of dependencies out of the way, keeping us very lightweight and from-scratch, what about language [10]choice? Now, the usual choice for doing something like this would be some low-level language like C. However, I'd like to actually get this project done, and I really like Lua, so I'll be using that!

Our first order of business will be to find bindings for our libraries to Lua, as their written in C.

- *Talk about googling it and finding LuaJIT-OpenGL and MoonLibs*
- *Talk about how LuaJIT-OpenGL is nice and, kudos to the author. But I disliked it for 2 reasons: messy api (random string wrap, gl.glX, etc..., and lack of documentation.)*
- *Talk about how MoonLibs is very well documented and has a cleaner API, but does not run under LuaJIT by default*
- *Talk about how I spent some time getting it to run with LuaJIT, and MAYBE go into a bit of detail about how*
- *Next up, I'm new to this so I need to find good tutorials. I found a nice voxel renderer one but first I need something with more OpenGL basics, so I found the wonderful book LearnOpenGL. I want to target OpenGL 4.5 to learn and make use of DSA [Show DSA=Direct State Access on screen] and Compute Shaders, and LearnOpenGL is aimed at 3.3, which is actually plenty close enough that I can later on update my code to use 4.5 stuff easily enough*
- *Time for some actual screen capture! Talk about starting by creating a window and rendering some basic 3D shape on it, etc... While showing a nice timelapse of me working on that. Try to slow down at the sections where I (effectively) run the code so the viewer has time to see the window, then the basic 3D shape, etc...*

---

1. ?
2. <u>Show video title<u>.
3. Show Minecraft logo + animate the words "Opinions", "Gameplay", "Textures" as I say them.
4. Shift the previous animation to the left of the screen and animate the same thing on the right, but with "OpenLVR" in place of the Minecraft logo.
5. Popup a picture of the GPU, then the OpenGL logo next to it (Maybe with speech bubbles or some arrows?)
6. Popup a couple blank windows on a white background. Then the Win32API, X11, and GLFW logos as I mention them. And also pictures of a mouse and keyboard, as I mention them.
7. Show coupled ("bundled") logos of Windows+Win32API and Linux+X/Wayland
8. Some kind of animation to show LVR switching "window backends" or whatever based on what OS it's running on.
9. Show a picture each for examples of matrix and vector algebra.
10. Question mark on white screen -> C logo -> C logo with a Question mark -> Lua logo.

---
<u>Underline: Needs rewrite</u>  
*Italic: TODO sections*  
(Parentheses: Editor notes)

