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

-- Yellow Glow
local glow = Instance.new("UIStroke", mainFrame)
glow.Thickness = 2
glow.Transparency = 0.3
glow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local glowGradient = Instance.new("UIGradient", glow)
glowGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 0))
}
glowGradient.Rotation = 0

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

-- Menu List
local menuFrame = Instance.new("Frame", mainFrame)
menuFrame.Size = UDim2.new(0, 120, 1, -40)
menuFrame.Position = UDim2.new(0, 0, 0, 40)
menuFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
menuFrame.BackgroundTransparency = 0.3
menuFrame.BorderSizePixel = 0

-- Content Area
local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -120, 1, -40)
contentFrame.Position = UDim2.new(0, 120, 0, 40)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentFrame.BackgroundTransparency = 0.3
contentFrame.BorderSizePixel = 0

-- Tabs
local tabs = {
    {Name = "Main", Callback = createMainTab},
    {Name = "Automation", Content = "Automation tools go here."},
    {Name = "Misc", Content = "Miscellaneous features."}
}

for i, tab in ipairs(tabs) do
    local button = Instance.new("TextButton", menuFrame)
    button.Size = UDim2.new(1, -10, 0, 40)
    button.Position = UDim2.new(0, 5, 0, (i - 1) * 45)
    button.Text = tab.Name
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.BackgroundTransparency = 0.3
    button.Font = Enum.Font.Gotham
    button.TextSize = 16
    button.BorderSizePixel = 0
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end)

    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end)

    button.MouseButton1Click:Connect(function()
        contentFrame:ClearAllChildren()

        if tab.Callback then
            tab.Callback(contentFrame)
        elseif tab.Content then
            local label = Instance.new("TextLabel", contentFrame)
            label.Size = UDim2.new(1, -20, 1, -20)
            label.Position = UDim2.new(0, 10, 0, 10)
            label.Text = tab.Content
            label.TextColor3 = Color3.new(1, 1, 1)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.Gotham
            label.TextSize = 18
            label.TextWrapped = true
        end
    end)

    -- Load first tab by default
    if i == 1 then
        contentFrame:ClearAllChildren()
        if tab.Callback then
            tab.Callback(contentFrame)
        elseif tab.Content then
            local label = Instance.new("TextLabel", contentFrame)
            label.Size = UDim2.new(1, -20, 1, -20)
            label.Position = UDim2.new(0, 10, 0, 10)
            label.Text = tab.Content
            label.TextColor3 = Color3.new(1, 1, 1)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.Gotham
            label.TextSize = 18
            label.TextWrapped = true
        end
    end
end

-- Minimize logic
local isMinimized = false

local function minimizeUI()
    isMinimized = true
    menuFrame.Visible = false
    contentFrame.Visible = false
    mainFrame.Size = UDim2.new(0, 150, 0, 40)
    titleBar.TextXAlignment = Enum.TextXAlignment.Center
    minimizeButton.Visible = false
end

local function maximizeUI()
    isMinimized = false
    menuFrame.Visible = true
    contentFrame.Visible = true
    mainFrame.Size = UDim2.new(0, 500, 0, 350)
    titleBar.TextXAlignment = Enum.TextXAlignment.Left
    minimizeButton.Visible = true
end

minimizeButton.MouseButton1Click:Connect(minimizeUI)
titleBar.MouseButton1Click:Connect(function()
    if isMinimized then
        maximizeUI()
    end
end)

-- Return components
return {
    contentFrame = contentFrame,
    minimizeButton = minimizeButton,
    titleBar = titleBar,
    createMainTab = createMainTab
}
