-- GameDesignPlatformer

-- Use this function to perform your initial setup
displayMode(OVERLAY)
function setup()
    print("Hello World!")
    sprite("Project:all characters")
    pos = vec2(100,220)
    z = 2
    s = SpriteSheet(pos.x,pos.y,160,160,"Project:all characters",5,5,1)
    s:fps(4)
    s:newSequence("idle",1,5)
    s:newSequence("stab",6,7,8,9)
    
    b = Buttons(150,100,WIDTH-125,75)

end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(40, 40, 50)
    s:draw()
    b:draw()
    --[[if b.sliderChange == 0 and s.frame < 5 then
        s:setFrame(1)
    end --]]
    if b.animate == true then
    	s:stop()
        s:play("stab",1)
    end
    if not s.playing then
        s:play("idle")
    end
    pos.x = pos.x + b.sliderChange/12
    s.x = pos.x
    s.y = pos.y
    
end
function touched(t)
    b:touched(t)
end


