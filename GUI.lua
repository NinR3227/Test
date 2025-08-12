local Players = game:GetService("Players")
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local createMainTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/NinR3227/Test/main/MainTab.lua"))()

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

local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 10)

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
local titleBar = Instance.new("Frame", mainFrame)
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleBar.BackgroundTransparency = 0.3
titleBar.BorderSizePixel = 0
titleBar.Active = true

local gradient = Instance.new("UIGradient", titleBar)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 0))
}
gradient.Rotation = 90

local titleButton = Instance.new("TextButton", titleBar)
titleButton.Name = "TitleButton"
titleButton.Size = UDim2.new(1, -80, 1, 0)
titleButton.Position = UDim2.new(0, 10, 0, 0)
titleButton.Text = "Germa66"
titleButton.TextColor3 = Color3.new(1, 1, 1)
titleButton.BackgroundTransparency = 1
titleButton.Font = Enum.Font.GothamBold
titleButton.TextSize = 20
titleButton.TextXAlignment = Enum.TextXAlignment.Left
titleButton.AutoButtonColor = false
titleButton.Active = true

-- Close Button
local closeBtn = Instance.new("TextButton", titleBar)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Minimize Button
local minimizeBtn = Instance.new("TextButton", titleBar)
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -70, 0, 5)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 16
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 6)

-- Menu List (Left Side)
local menuFrame = Instance.new("Frame", mainFrame)
menuFrame.Size = UDim2.new(0, 120, 1, -40)
menuFrame.Position = UDim2.new(0, 0, 0, 40)
menuFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
menuFrame.BackgroundTransparency = 0.3
menuFrame.BorderSizePixel = 0

-- Content Area
local contentFrame = Instance.new("Frame", mainFrame)
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

-- Minimize logic (clean toggle via title click)
local isMinimized = false

local function minimizeUI()
    isMinimized = true
    menuFrame.Visible = false
    contentFrame.Visible = false
    mainFrame.Size = UDim2.new(0, 150, 0, 40)
    titleButton.Text = "Germa66"
    titleButton.TextXAlignment = Enum.TextXAlignment.Center
    minimizeBtn.Visible = false
    closeBtn.Visible = false
end

local function maximizeUI()
    isMinimized = false
    menuFrame.Visible = true
    contentFrame.Visible = true
    mainFrame.Size = UDim2.new(0, 500, 0, 350)
    titleButton.Text = "Germa66"
    titleButton.TextXAlignment = Enum.TextXAlignment.Left
    minimizeBtn.Visible = true
    closeBtn.Visible = true
end

minimizeBtn.MouseButton1Click:Connect(minimizeUI)

titleButton.MouseButton1Click:Connect(function()
    if isMinimized then
        maximizeUI()
    end
end)


-- Make titleLabel clickable
titleButton.Active = true
titleButton.MouseEnter:Connect(function()
    titleButton.TextColor3 = Color3.fromRGB(255, 255, 0)
end)
titleButton.MouseLeave:Connect(function()
    titleButton.TextColor3 = Color3.new(1, 1, 1)
end)

local GUI = {
    contentFrame = contentFrame,
    minimizeButton = minimizeBtn,
    titleBar = titleButton,
    createMainTab = createMainTab
}
return GUI