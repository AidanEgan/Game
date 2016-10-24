Player = class()

function Player:init(x,world)
    -- you can accept and set parameters here
    self.x = 0
    self.y = world:getValue(x)
    self.world = world
    
    self.s = SpriteSheet(0,0,160,160,"Project:all characters",5,5,1)
    self.s:fps(4)
    self.s:newSequence("idle",1,5)
    self.s:newSequence("stab",6,7,8,9)
    self.rotation = 0
end

function Player:draw(animate)
    -- Codea does not automatically call this method
    pushMatrix()
    translate(self.x,self.y)
    rotate(self.rotation)
    self.s:draw()
    popMatrix()
    if animate == true then
        self.s:play("stab",1)
    end
    if not self.s.playing then
        self.s:play("idle")
    end
end

function Player:touched(touch)
    -- Codea does not automatically call this method
end

function Player:move(dx)
    self.x = self.x + dx
    self.y = self.world:getValue(self.x) + 80
    
    local y1 = self.world:getValue(self.x - 20)
    local y2 = self.world:getValue(self.x + 20)
    
    local angle = -math.deg(math.atan2((self.x-20)-(self.x+20),y1-y2)) - 90
    self.rotation = angle
end
