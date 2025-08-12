-- Main GUI setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame", ScreenGui)
mainFrame.Size = UDim2.new(0, 300, 0, 300)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true

-- Title bar
local titleBar = Instance.new("Frame", mainFrame)
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleBar.BorderSizePixel = 0
titleBar.Active = true

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size = UDim2.new(1, -40, 1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "My GUI"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 20

-- Minimize button
local minimizeButton = Instance.new("TextButton", titleBar)
minimizeButton.Size = UDim2.new(0, 40, 1, 0)
minimizeButton.Position = UDim2.new(1, -40, 0, 0)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextSize = 20

-- Content frame
local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Size = UDim2.new(1, 0, 1, -40)
contentFrame.Position = UDim2.new(0, 0, 0, 40)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentFrame.BorderSizePixel = 0

-- Sample content
local sampleLabel = Instance.new("TextLabel", contentFrame)
sampleLabel.Size = UDim2.new(1, 0, 0, 50)
sampleLabel.Position = UDim2.new(0, 0, 0, 10)
sampleLabel.Text = "Hello, Nin!"
sampleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
sampleLabel.BackgroundTransparency = 1
sampleLabel.Font = Enum.Font.SourceSans
sampleLabel.TextSize = 18

-- Minimize logic
local isMinimized = false

local function updateMinimizeState()
    if isMinimized then
        contentFrame.Visible = false
        minimizeButton.Text = "+"
        mainFrame.Size = UDim2.new(0, 300, 0, 40)
        print("Minimized GUI")
    else
        contentFrame.Visible = true
        minimizeButton.Text = "-"
        mainFrame.Size = UDim2.new(0, 300, 0, 300)
        print("Restored GUI")
    end
end

minimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    updateMinimizeState()
end)

-- Restore on title bar click
titleBar.InputBegan:Connect(function(input)
    print("Input detected:", input.UserInputType)
    if isMinimized and input.UserInputType == Enum.UserInputType.MouseButton1 then
        isMinimized = false
        updateMinimizeState()
    end
end)