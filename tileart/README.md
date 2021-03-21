# Tileart

A tile plotter to generate simple abstract art.


## Design

This is a simple proof of concept for a plotter + pen pattern I've been thinking about. 

```
-- a plotter is a tool
p = plotter()

-- it needs something to draw with
t = tile(4, 4, 5)
p:setPen(t)
p:start(0,0)
p:stamp()

-- drawing can be fun

-- evolve? mutate? permiate? colour? <- specific feels better
-- direction (right(1))
-- 

```

