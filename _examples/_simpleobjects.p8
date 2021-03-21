-- Object examples for Pico-8/Lua ()

-- example of a table of "structs"

things = {}

function create_thing(x, y, z)
	t = {
		x = x, y = y, z = z
	}
	
	-- add(t, things)
	
	return t
end

x = create_thing(1, 1, 1)


-- example of simple perl/js style function/objects
	
thang = {}
function thang(w, h, sz)
	local t = {
		a = 0, b = 0, c = 0,
		d = {},
		e = function(self)
			return false
		end,
		f = function(self, g)
			local h = 0
			if g then
				h = h + g
			end
			return h
		end
	}
	
	return t
end

y = thang()
y:e()		-- remember that using : instead of . includes self
y:f(g)		-- example with one parameter