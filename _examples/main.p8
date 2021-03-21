pico-8 cartridge // http://www.pico-8.com
version 19
__lua__


#include _examples.p8
#include _simpleobjects.p8



function _init()
	cls()
	
	x = create_thing(1, 1, 1)
	
	print("♥ starting ♥", 5)
	print("♥ intensifying ♥", 5)
end

function _update()
end

function _draw()
	--cls()
end

__gfx__
__music__
