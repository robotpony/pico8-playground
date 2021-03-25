-- various stamps helpers for the tile tool

palettes = {
	greens = {11, 3, 0, 0},
	reds = {0, 0, 8, 2},
	muted = {15, 14, 13, 12, 6, 1}
}

-- a gtia-like DNA random plot
gtia_dna = function(self, first)

	local col = self:col()

	if (col % 2) == 1 then
		self.c = rnd(palettes.greens)
	else
		self.c = rnd(palettes.reds)
	end

	if first then return true end

	-- update the position per mutation, simple l->r

	if self:inBounds('x') then
		self.x = self.x + self.w + self.p
	else
		self.x = 0
		self.y = self.y + self.h + self.p
	end

	if not self:inBounds('y') then
		if self.start_over then
			self:reset()
		else
			return false
		end
	end
	return true
end