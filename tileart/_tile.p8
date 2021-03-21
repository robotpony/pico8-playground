-- An example plotter pen using tiling
--
-- This class is customized by setting a few "callbacks" to
-- reduce overall code size

w_h_max = 128

function tile(w, h, colour)
	local t = {
		w = 4, h = 4,
		c = 1,
		x = 0, y = 0,

		seed,
		step = 1,

		-- A default next iterator
		next = function(self)
			-- a boring default

			self.c = flr(rnd(15))
			self.x = self.x + self.w
			if self.x > w_h_max then
				self.x = 0
				self.y = self.y + self.h
			end
		end,

		-- create a tile
		init = function(self, w, h, c)
			self.w = w or self.w
			self.h = h or self.h
			self.c = c or self.c
			-- pattern?

			return self
		end,

		-- set a random seed (optional)
		--   for testing or repeating interesting patterns
		setSeed = function(self, seed)
			self.seed = seed
			srand(seed)
		end,

		-- set a mutator iterator
		--		future: allow multiple mutators
		setMutator = function(self, f)
			self.next = f
		end,

		-- stamp this tile! (params optional)
		stamp = function(self, x, y, c)
			x = x or self.x
			y = y or self.y
			c = c or self.c

			rectfill(x, y, x + self.w, y + self.h, c)
		end
	}

	return t:init()
end

