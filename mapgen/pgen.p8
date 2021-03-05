pico-8 cartridge // http://www.pico-8.com
version 19
__lua__

function _init()

end

function _draw()
--   cls()
end

function _update60()
    local b = btn()

    if b == 0 then
      return
    end
    
    print(b)
  
end


__gfx__

