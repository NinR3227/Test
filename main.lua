-- main.lua
local gui = require(path.to.gui) -- Replace with actual module path

local contentFrame = GUI.contentFrame
local minimizeButton = GUI.minimizeButton
local titleBar = GUI.titleBar

-- Minimize toggle
minimizeButton.MouseButton1Click:Connect(function()
    contentFrame.Visible = false
    minimizeButton.Text = "+"
end)

-- Restore on title bar click
titleBar.InputBegan:Connect(function(input)
    if not contentFrame.Visible and input.UserInputType == Enum.UserInputType.MouseButton1 then
        contentFrame.Visible = true
        minimizeButton.Text = "-"
    end
end)