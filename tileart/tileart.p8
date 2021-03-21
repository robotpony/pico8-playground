pico-8 cartridge // http://www.pico-8.com
version 19
__lua__

-- A hacky tile art prototype

#include _tile.p8

t = {}

-- Pico-8 startup
function _init()
	cls()

	-- pick a random seed
	local seed = flr(rnd(1000) + 1)

	t = tile()
	t:setSeed(seed)

	-- define a simple tile mutator
	local mutedColours = function(self, first)

		local clr = {15, 14, 13, 12, 6, 1, 143, 142, 141, 134}
		self.c = rnd(clr)

		if first then return true end

		self.x = self.x + self.w + self.p
		if self.x > w_h_max then
			self.x = 0
			self.y = self.y + self.h + self.p
		end

		if self.y > w_h_max then
			if self.start_over then
				self:reset()
			else
				return false
			end
		end
		return true
	end

	t:setMutator(mutedColours)
end

-- clock tick
function _update60()
	local l = t:lineLen()
	for ii = 0, l * l, 1 do
		t:stamp()
	end
end

-- draw!
function _draw()
end

__gfx__
__music__
