local component = require("component")
local gui = dofile("lib/gui/gui.lua")

gui.bind(component.gpu.address)
local workspace = gui.workspace()

workspace:addChild(gui.rectangle(0, 0, 150, 20, gui.color.white))
workspace:draw()


