pico-8 cartridge // http://www.pico-8.com
version 19
__lua__

-- A hacky tile art prototype

#include _tile.p8
#include _plotter.p8

t = {}

-- Pico-8 startup
function _init()
	cls()

	t = tile()
	t:setSeed(flr(rnd(1000) + 1))

	local topDownGradient = function(self)

	end

	-- t:setMutator(topDownGradient)
end

-- clock tick
function _update60()
	t:next()
end

-- draw!
function _draw()
	t:stamp()
end

__gfx__
__music__
