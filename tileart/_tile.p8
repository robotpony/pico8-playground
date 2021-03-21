-- An example plotter pen using tiling


function tile()
	local t = {
		w = 4, h = 4, c = 0,
		
		init = function(self)
			print "tile init!"
			return self
		end
		
	}
	
	
	return t:init()
end

