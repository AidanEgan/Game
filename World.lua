World = class()

function World:init()
    -- you can accept and set parameters here
    self.mesh = mesh()
    
    self:generateMesh()
    self.mesh:setColors(85,64,56)
end

function World:draw()
    -- Codea does not automatically call this method
    background(58, 41, 38, 255)
    self.mesh:draw()
end

function World:touched(touch)
    -- Codea does not automatically call this method
end


function World:generateMesh()
    local verts = {}
    for i=0,WIDTH+10,10 do
        table.insert(verts,vec2(i,noise(i/300)*100 + 100))
    end
    table.insert(verts,vec2(WIDTH,0))
    table.insert(verts,vec2(0,0))
    self.mesh.vertices = triangulate(verts)
end

function World:getValue(x)
    return (noise(x/300)*100 + 100)
end
