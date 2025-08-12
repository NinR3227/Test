-- GUI.lua
return function()
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local screenGui = Instance.new("ScreenGui", playerGui)
    screenGui.Name = "VnsHub"
    screenGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 500, 0, 350)
    mainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
    mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    mainFrame.BorderSizePixel = 0

    local titleBar = Instance.new("TextLabel", mainFrame)
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    titleBar.Text = "VnsHub"
    titleBar.TextColor3 = Color3.new(1, 1, 1)
    titleBar.Font = Enum.Font.GothamBold
    titleBar.TextSize = 20
    titleBar.BorderSizePixel = 0

    local tabContainer = Instance.new("Frame", mainFrame)
    tabContainer.Size = UDim2.new(0, 120, 1, -40)
    tabContainer.Position = UDim2.new(0, 0, 0, 40)
    tabContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    tabContainer.BorderSizePixel = 0

    local contentFrame = Instance.new("Frame", mainFrame)
    contentFrame.Size = UDim2.new(1, -120, 1, -40)
    contentFrame.Position = UDim2.new(0, 120, 0, 40)
    contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    contentFrame.BorderSizePixel = 0
    contentFrame.Name = "ContentFrame"

    local tabs = {
        {Name = "Info", Content = "This is the Info tab."},
        {Name = "Server Hop", Content = "This is the Server Hop tab."}
    }

    for i, tab in ipairs(tabs) do
        local button = Instance.new("TextButton", tabContainer)
        button.Size = UDim2.new(1, 0, 0, 40)
        button.Position = UDim2.new(0, 0, 0, (i - 1) * 40)
        button.Text = tab.Name
        button.TextColor3 = Color3.new(1, 1, 1)
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        button.Font = Enum.Font.Gotham
        button.TextSize = 16
        button.BorderSizePixel = 0

        button.MouseButton1Click:Connect(function()
            contentFrame:ClearAllChildren()

            local label = Instance.new("TextLabel", contentFrame)
            label.Size = UDim2.new(1, -20, 1, -20)
            label.Position = UDim2.new(0, 10, 0, 10)
            label.Text = tab.Content
            label.TextColor3 = Color3.new(1, 1, 1)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.Gotham
            label.TextSize = 18
            label.TextWrapped = true
        end)

        if i == 1 then
            button:Activate()
            button.MouseButton1Click:Fire()
        end
    end
end