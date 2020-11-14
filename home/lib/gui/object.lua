local obj = {}
local object = {}

function object:new(x, y, width, height, color)
    if color == nil then
        color = 0xFFFFFF
    end

    local o = {
        x = x,
        y = y,
        width = width,
        height = height,
        color = color,
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function object:render(proxy)
    self:draw(proxy)
end

function obj.newRectangle(x, y, width, height, color) 
    local child = object:new(x, y, width, height, color)
    child.draw = function(child, proxy)
        proxy.draw(child.x, child.y, child.width, child.height, child.color, " ")
    end
    return child
end

return obj



