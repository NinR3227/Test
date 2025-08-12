local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NinR3227/Test/main/GUI.lua"))()

local contentFrame = GUI.contentFrame
local minimizeButton = GUI.minimizeButton
local titleBar = GUI.titleBar
local createMainTab = GUI.createMainTab

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