-- An example plotter pen using tiling


function tile(w, h, colour)
	local t = {
		w = 4, h = 4, c = 0,
		
		init = function(self, w, h, c)
			print "tile init!"
			return self
		end,
		
		stamp = function(self, x, y, c) 
			x = x or 0
			y = y or 0
			c = c or self.c
			print("stamp: " .. x .. "," .. y .. " (" .. c .. ")")
		end
	}
	
	
	return t:init()
end

