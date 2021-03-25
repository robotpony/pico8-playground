-- An example plotter pen using tiling
--
-- This class is customized by setting a few "callbacks" to
-- reduce overall code size

w_h_max = 128

function tile(w, h, colour)
	local t = {
		w = 8, h = 2, p = 0,
		c,
		x = 0, y = 0,

		seed,

		debug = false,
		start_over = false,
		stop = false,

		mutators = {},

		mutate = function(self, firstRun)
			local fn = rnd(self.mutators)

			return fn(self, firstRun)
		end,

		lineLen = function(self)
			return w_h_max / (self.w + self.p)
		end,

		col = function(self)
			if self.x == 0 then return 0 end

			local colW = self.w + self.p

			return self.x / colW
		end,

		-- reset position
		reset = function(self)
			self.x = 0
			self.y = 0
		end,

		--
		inBounds = function(self, dir)
			if dir == 'x' then
				return self.x <= w_h_max
			elseif dir == 'y' then
				return self.y <= w_h_max
			end

			return false
		end,

		r = function(self)
		end,
		down = function(self)
		end,

		-- Take the next stamp step
		next = function(self)
			if self.stop then return false end

			local firstRun = self.c == nil

			if self:mutate(firstRun) then
				return true
			else
				if self.start_over then
					self:reset()
					return true
				else
					self.stop = true
					return false
				end
			end
		end,

		-- A default stamp pattern
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
		addMutator = function(self, f)
			add(self.mutators, f)
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

			self:next()
			self:stampPattern(x, y, c)
		end
	}

	return t:init()
end

