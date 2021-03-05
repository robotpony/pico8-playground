# Spritzer

A fresh sprite character generator demo for Pico8.

## Features

- random, using an optional seed to get a specific character

## Design


A sprite character has:

- a species (or type) 
- a body
- a colour scheme
- a set of animated frames (future)


Basic algorithm

- pick a colour palette (skin, clothes, features, eyes)
- generate body ratios and attributes
	- head / torso / arms / legs 


Bodies
	- head
		- eyes(num, style, placement)
		- mouth(size, placement, type)
		- ears
	- torso([l, s, m])
	- legs(num, len)


Species/types
	- biped
		- humanoid
	- quadriped
	- insect
	- fishy
	- alien
		- blob

Colour schemes
	- 
