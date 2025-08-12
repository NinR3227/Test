local Players = game:GetService("Players")
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

-- Load MainTab module
local createMainTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/NinR3227/Test/main/MainTab.lua"))()

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Germa66"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 500, 0, 350)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

-- Title Bar
local titleBar = Instance.new("TextButton", mainFrame)
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleBar.BackgroundTransparency = 0.3
titleBar.Text = "Germa66"
titleBar.TextColor3 = Color3.new(1, 1, 1)
titleBar.Font = Enum.Font.GothamBold
titleBar.TextSize = 20
titleBar.TextXAlignment = Enum.TextXAlignment.Left
titleBar.AutoButtonColor = false

-- Minimize Button
local minimizeButton = Instance.new("TextButton", titleBar)
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -35, 0, 5)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.new(1, 1, 1)
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextSize = 16
Instance.new("UICorner", minimizeButton).CornerRadius = UDim.new(0, 6)

-- Content Frame
local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, 0, 1, -40)
contentFrame.Position = UDim2.new(0, 0, 0, 40)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentFrame.BackgroundTransparency = 0.3
contentFrame.BorderSizePixel = 0

-- Load MainTab content immediately
createMainTab(contentFrame)

-- Return GUI components
return {
    contentFrame = contentFrame,
    minimizeButton = minimizeButton,
    titleBar = titleBar,
    createMainTab = createMainTab
}
