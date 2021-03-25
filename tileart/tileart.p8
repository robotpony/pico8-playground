pico-8 cartridge // http://www.pico-8.com
version 19
__lua__

-- A hacky tile art prototype

#include _tile.p8
#include _stamps.p8

tiler = {}
len = 0;

-- Pico-8 startup
function _init()
	cls()

	-- pick a random seed
	local seed = flr(rnd(1000) + 1)

	-- create a tile generator and set a starting seed
	tiler = tile()
	tiler:setSeed(seed)
	len = tiler:lineLen()

	tiler:addMutator(gtia_dna)
end

-- clock tick
function _update()
	local b = btn()

	if b == 16 then return end

	-- generate all stamps per update
	for ii = 0, len * len, 1 do
		tiler:stamp()
	end
end

-- draw!
function _draw()
end

__gfx__
__music__
