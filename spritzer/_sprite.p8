-- A simple sprite generator

sprite = {}
function sprite(seed)
	local s = {
		seed,
		b = { -- body parts
			arms = 2,
			legs = 2,
			eyes = 2,
			orientation = 0,
		},
		r = { -- character ratios
			upper = 4,
			mid = 2,
			bottom = 3,
			chonk = 8,
			len = 0
		},
		c = { -- colours
			accent = 0,
			flesh = 1,
			eyes = 2,
			hair = 3,
			clothes = 4
		},
		init = function(s, seed)
			if seed then
				s.seed = seed
				srand(seed)
			else
				s.seed = "(random)"
			end
			return s
		end,
		create=function(s)
			s.randomize(s)
			s.draw(s)
			s.debug(s)
		end,
		draw=function(s)
			w = 7
			h = 7
			at = 0
			state = 0
			
			for x=0,w do
				for y=0,h do

					-- print(x .. " " .. y .. " ")
					
					-- sset
					-- sget
				end
			end
		end,
		randomize=function(s)
			-- generate a colour palette for this character
			s.c.accent = s.roll({0,1,2,3})
			s.c.flesh = s.roll({9,12,13,14,15})
			s.c.eyes = s.roll({6,7,8})
			s.c.hair = s.roll({1,2,3,11})
			s.c.clothes = s.roll({4,5,9,10})
			-- pick body type and proportions
			s.b.arms = s.roll(4)
			s.b.legs = s.roll(6)
			s.b.eyes = s.roll(3) + 1
			-- pick an orientation (vertical | horizontal)
			s.b.orientation = s.roll(2)	
			-- pick body ratios
			s.r.upper = s.roll(4) + 1
			s.r.mid = s.roll(2) + 1
			s.r.bottom = s.roll(3) + 1
			s.r.len = s.r.bottom + s.r.mid + s.r.upper
			s.r.chonk = s.roll(8)
		end,
		debug=function(s)
			print("seed: " .. s.seed)
			
			s.dump("body", s.b)
			s.dump("colours", s.c, true)
			s.dump("ratios", s.r)
		end,
		dump=function(title,tbl,colorize)
			print(title, 6)
			for k,v in pairs(tbl) do
				local c = (colorize!=nil and v!=0) and v or 7
				
				print(("  " .. k ..": "..v),c)
			end
		end,
		roll=function(range)
			return flr(rnd(range))
		end
		
	}
	return s.init(s,seed)
end
