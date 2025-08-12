-- GUI.lua
return function()
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local screenGui = Instance.new("ScreenGui", playerGui)
    screenGui.Name = "Germa66"
    screenGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 500, 0, 350)
    mainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
    mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    mainFrame.BorderSizePixel = 0

    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

    local shadow = Instance.new("ImageLabel", mainFrame)
    shadow.Name = "Shadow"
    shadow.BackgroundTransparency = 1
    shadow.Size = UDim2.new(1, 20, 1, 20)
    shadow.Position = UDim2.new(0, -10, 0, -10)
    shadow.Image = "rbxassetid://1316045217"
    shadow.ImageTransparency = 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    shadow.ZIndex = -1

    local titleBar = Instance.new("Frame", mainFrame)
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

    local gradient = Instance.new("UIGradient", titleBar)
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 0))
    }
    gradient.Rotation = 90

    local titleText = Instance.new("TextLabel", titleBar)
    titleText.Size = UDim2.new(1, -80, 1, 0)
    titleText.Position = UDim2.new(0, 10, 0, 0)
    titleText.Text = "Germa66"
    titleText.TextColor3 = Color3.new(1, 1, 1)
    titleText.Font = Enum.Font.GothamBold
    titleText.TextSize = 20
    titleText.BackgroundTransparency = 1
    titleText.TextXAlignment = Enum.TextXAlignment.Left

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

    local minimizeBtn = Instance.new("TextButton", titleBar)
    minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
    minimizeBtn.Position = UDim2.new(1, -70, 0, 5)
    minimizeBtn.Text = "-"
    minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
    minimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
    minimizeBtn.Font = Enum.Font.GothamBold
    minimizeBtn.TextSize = 16
    Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 6)

    local isMinimized = false

    minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized

    tabContainer.Visible = not isMinimized
    contentFrame.Visible = not isMinimized

    -- Optional: shrink frame height when minimized
    if isMinimized then
        mainFrame.Size = UDim2.new(0, 500, 0, 60)
    else
        mainFrame.Size = UDim2.new(0, 500, 0, 350)
    end
end)

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
        {Name = "Main", Content = "Welcome to Germa66."},
        {Name = "Server Hop", Content = "This is the Server Hop tab."}
    }

    for i, tab in ipairs(tabs) do
        local button = Instance.new("TextButton", tabContainer)
        button.Size = UDim2.new(1, -10, 0, 40)
        button.Position = UDim2.new(0, 5, 0, (i - 1) * 45)
        button.Text = tab.Name
        button.TextColor3 = Color3.new(1, 1, 1)
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
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
        end
    end
end