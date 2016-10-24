Buttons = class()

function Buttons:init(sliderx,slidery,buttonx,buttony)
    -- you can accept and set parameters here
    self.sliderx = sliderx
    self.slidery = slidery
    self.buttonx = buttonx
    self.buttony = buttony
    self.sliderChange = 0
    self.animate = false
    self.tId = nil
    col = color(255, 255, 255, 255)
end

function Buttons:draw()
    -- Codea does not automatically call this method
    fill(255, 255, 255, 255)
    noStroke()
    rect(50,self.slidery,200,5)
    ellipse(self.sliderx,self.slidery,75,75)
    fill(col)
    ellipse(self.buttonx,self.buttony,100)
end

function Buttons:touched(t)
    -- Codea does not automatically call this method
    if t.x > 50 and t.x < 250 and t.y < self.slidery + 37.5 and t.y > self.slidery - 37.5 then
        self.tId=t.id
    end
    if self.tId~=nil and self.tId == t.id then  
        if t.x > 50 and t.x < 250 and t.y < self.slidery + 37.5 and t.y > self.slidery - 37.5 then
            self.sliderx = t.x
            self.sliderChange = self.sliderx - 150
        end
        if t.state==ENDED then
            self.tId=nil
            self.sliderChange = 0
            self.sliderx = 150
        end
    end 
    
    if math.sqrt(((self.buttonx-t.x)^2) + ((self.buttony-t.y)^2)) <= 50 then
        self.tId2 = t.id
    end
    if self.tId2 ~= nil and self.tId2 == t.id then
        col = color(127, 127, 127, 255)
        self.animate = true
        if t.state==ENDED then
            self.tId2=nil
            self.animate = false
            col = color(255, 255, 255, 255)
        end
    end
end


