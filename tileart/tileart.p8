pico-8 cartridge // http://www.pico-8.com
version 19
__lua__


#include _tile.p8
#include _plotter.p8

tiles = {}

function _init()
	cls()
	
	print "starting ..."
	
	t = tile()
	t:stamp()
	t:stamp(4, 4, 10)
	t:stamp(5, 5)
end

function _update()
end

function _draw()
end

__gfx__
__music__
