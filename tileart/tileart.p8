pico-8 cartridge // http://www.pico-8.com
version 19
__lua__

-- A hacky tile art prototype

#include _tile.p8

t = {}
l = 0;

-- Pico-8 startup
function _init()
	cls()

	-- pick a random seed
	local seed = flr(rnd(1000) + 1)

	-- create a tile generator and set a starting seed
	t = tile()
	t:setSeed(seed)
	l = t:lineLen()

	greens = {11, 3, 0, 0}
	reds = {0, 0, 8, 2}
	muted = {15, 14, 13, 12, 6, 1}


	-- define a simple tile mutator
	local mutedColours = function(self, first)

		local col = self:col()

		if (col % 2) == 1 then
			self.c = rnd(greens)
		else
			self.c = rnd(reds)
		end

		if first then return true end

		-- update the position per mutation, simple l->r

		if self:inBounds('x') then
			self.x = self.x + self.w + self.p
		else
			self.x = 0
			self.y = self.y + self.h + self.p
		end

		if not self:inBounds('y') then
			if self.start_over then
				self:reset()
			else
				return false
			end
		end
		return true
	end

	-- hook in the mutator
	t:setMutator(mutedColours)
end

-- clock tick
function _update()
	local b = btn()

	if b == 16 then return end

	-- generate all stamps per update
	for ii = 0, l * l, 1 do
		t:stamp()
	end
end

-- draw!
function _draw()
end

__gfx__
__music__
