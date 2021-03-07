-- A simple randomized (and seeded) sprite character generator

sprite = {}
function sprite(seed)
	local s = {
		seed,
		b = { -- body parts
			arms = 2,
			legs = 2,
			eyes = 2,
			vertical = 0,
		},
		r = { -- character ratios
			upper = 4,
			mid = 2,
			bottom = 3,
			chonk = 8,
			len = 0,
			width = 7
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
		-- creates a random sprite character
		create=function(s)
			s.randomize(s)
			s.draw(s)
			s.debug(s)
		end,
		-- generate an 8x8 sprite from attributes
		draw=function(s)
			w = s.r.width -- missing chonk		
			s.drawUpper(s, w, s.r.upper,0)
			s.drawMid(s, w, s.r.mid, s.r.upper + 1)
			s.drawBottom(s, w, s.r.bottom, s.r.upper + s.r.mid + 1)

		end,
		drawUpper=function(s,w,sz,at)
			s.line(s,w,1,s.c.hair)
			if sz == 4 then 
				s.line(s,w,2,s.c.hair)
				s.line(s,w,3,s.c.flesh)
			elseif sz == 3 then
				s.line(s,w,2,s.c.flesh)
			end
			s.line(s,w,sz,s.c.flesh)
			return sz
		end,
		drawMid=function(s,w,sz,at)
			s.line(s,w,at,s.c.clothes)
			s.line(s,w,sz,s.c.clothes)
		end,
		drawBottom=function(s,w,sz,at)
			s.line(s,w,at,s.c.clothes)
			s.line(s,w,sz,s.c.clothes)
		end,
		line=function(s,w,from,c,variance)
			start = flr((8 - w) / 2)
			isVert = s.b.vertical
			
			for at=start, w do
				if isVert then 
					sset(from, at, c)
				else 
					sset(at, from, c)
				end
			end			
		end,		
		-- generate a sprite's attributes
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
			s.b.vertical = s.roll(2)
			-- pick body ratios
			s.r.upper = s.roll(4) + 1
			s.r.mid = s.roll(2) + 1
			s.r.bottom = s.roll(3) + 1
			s.r.len = s.r.bottom + s.r.mid + s.r.upper
			s.r.chonk = s.roll(6) + 2
		end,
		-- debug output for testing
		debug=function(s)
			print("seed: " .. s.seed)
			s.dump("body", s.b)
			s.dump("colours", s.c, true)
			s.dump("ratios", s.r)
			
			-- add sprite to main view
			sspr(0,0,8,8, 70,20, 16,16)			
		end,
		-- dump a table with a heading
		dump=function(title,tbl,colorize)
			print(title, 6)
			for k,v in pairs(tbl) do
				local c = (colorize!=nil and v!=0) and v or 7
				
				print(("  " .. k ..": "..v),c)
			end
		end,
		-- roll a dice within the given range (or table set)
		roll=function(range)
			return flr(rnd(range))
		end
		
	}
	return s.init(s,seed)
end
