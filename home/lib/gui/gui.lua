local obj = dofile("lib/gui/object.lua")
local component = require("component")
local gpu = component.gpu

local GUI = {
    color = {
        white = 0xFFFFFF,
        red = 0xFF0000,
        green = 0x00FF00,
        blue = 0x0000FF,
    },
}

local gpuProxy = {
    gpu = gpu
}

function gpuProxy.draw(x, y, width, height, color, text)
    gpu.setBackground(color)
    gpu.fill(x, y, width, height, text)
end

local workspace = {
    children = {},
}

-- GUI functions 

function GUI.bind(address)
    gpu.bind(address)
    local x, y = gpu.getResolution()
    GUI.window = {
        x = x,
        y = y
    }
end

function GUI.setBackground(color)
    fillRectangle(1, 1, gui.window.x, gui.window.y, color)
end

function GUI.rectangle(x, y, width, height, color)
    return obj.newRectangle(x, y, width, height, color)
end

function GUI.workspace()
    return workspace
end


-- GUI class


function workspace:addChild(object)
    table.insert(self.children, object)
end

function workspace:draw()
    for _, child in pairs(self.children) do
        child:render(gpuProxy)
    end
end

return GUI