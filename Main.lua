-- GameDesignPlatformer

-- Use this function to perform your initial setup
displayMode(OVERLAY)
function setup()
    print("Hello World!")
    sprite("Project:all characters")
    
    
    b = Buttons(150,100,WIDTH-125,75)
    w = World()
    p = Player(100,w)
    parameter.watch("math.floor(1/DeltaTime)")
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(40, 40, 50)
    w:draw()
    p:draw(b.animate)
    b:draw()
    p:move(b.sliderChange/12)
end
function touched(t)
    b:touched(t)
end



