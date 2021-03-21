-- An example plotter pen using tiling
--
-- This class is customized by setting a few "callbacks" to
-- reduce overall code size

w_h_max = 128

function tile(w, h, colour)
	local t = {
		w = 2, h = 2, p = 2,
		c = 0,
		x = 0, y = 0,

		seed,
		step = 1,

		start_over = false,
		stop = false,

		-- A default mutator
		next = function(self)
			if self.stop then return end

			local clr = {15, 14, 13, 12, 6, 1, 143, 142, 141, 134}
			self.c = rnd(clr)

			self.x = self.x + self.w + self.p
			if self.x > w_h_max then
				self.x = 0
				self.y = self.y + self.h + self.p
			end

			if self.y > w_h_max then
				if self.start_over then
					self.x = 0
					self.y = 0
				else
					self.stop = true
				end
			end
		end,

		stampPattern = function(self, x, y, c)
			rectfill(x, y, x + self.w, y + self.h, c)
		end,

		-- create a tile
		init = function(self, w, h, c)
			self.w = w or self.w
			self.h = h or self.h
			self.c = c or self.c
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

		-- set a pattern function
		--		future: allow multiple mutators
		setPattern = function(self, f)
			self.stampPattern = f
		end,

		-- stamp this tile! (params optional)
		stamp = function(self, x, y, c)
			x = x or self.x
			y = y or self.y
			c = c or self.c

			self:stampPattern(x, y, c)
		end
	}

	return t:init()
end

