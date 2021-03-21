-- Examples of Lua/Pico-8 neato things


if false then
	patterns={
		[0]=♥,▤,∧,✽,♥,◆,
		░,░,░,░,
		…,…,…,…
	}
end

if false then

	if (btn(❎)) then
		-- strafe
		if (btn(⬅️)) dx-=1
		if (btn(➡️)) dx+=1
	else
		-- turn
		if (btn(⬅️)) pl.d+=0.02
		if (btn(➡️)) pl.d-=0.02
	end
	
	-- forwards / backwards
	if (btn(⬆️)) dy+= 1
	if (btn(⬇️)) dy-= 1

end
