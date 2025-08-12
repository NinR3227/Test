local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

return function(tabFrame)
    print("MainTab loaded successfully!")

    local player = Players.LocalPlayer

    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "Server Info & Actions"
    title.TextColor3 = Color3.fromRGB(255, 255, 0)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true
    title.Parent = tabFrame

    -- Player Info
    local info = {
        "Player: " .. player.Name,
        "Players in Server: " .. #Players:GetPlayers(),
        "Ping: " .. math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) .. " ms"
    }

    for i, text in ipairs(info) do
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -20, 0, 25)
        label.Position = UDim2.new(0, 10, 0, 45 + (i - 1) * 30)
        label.Text = text
        label.TextColor3 = Color3.new(1, 1, 1)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.Gotham
        label.TextSize = 16
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = tabFrame
    end

    -- Server Dropdown Label
    local dropdownLabel = Instance.new("TextLabel")
    dropdownLabel.Size = UDim2.new(1, -20, 0, 25)
    dropdownLabel.Position = UDim2.new(0, 10, 0, 140)
    dropdownLabel.Text = "Server Actions"
    dropdownLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    dropdownLabel.BackgroundTransparency = 1
    dropdownLabel.Font = Enum.Font.GothamBold
    dropdownLabel.TextSize = 18
    dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
    dropdownLabel.Parent = tabFrame

    -- Job ID Display
    local jobIdLabel = Instance.new("TextLabel")
    jobIdLabel.Size = UDim2.new(1, -20, 0, 25)
    jobIdLabel.Position = UDim2.new(0, 10, 0, 170)
    jobIdLabel.Text = "Job ID: " .. game.JobId
    jobIdLabel.TextColor3 = Color3.new(1, 1, 1)
    jobIdLabel.BackgroundTransparency = 1
    jobIdLabel.Font = Enum.Font.Gotham
    jobIdLabel.TextSize = 16
    jobIdLabel.TextXAlignment = Enum.TextXAlignment.Left
    jobIdLabel.Parent = tabFrame

    -- Job ID TextBox
    local jobIdBox = Instance.new("TextBox")
    jobIdBox.Size = UDim2.new(1, -20, 0, 30)
    jobIdBox.Position = UDim2.new(0, 10, 0, 200)
    jobIdBox.PlaceholderText = "Enter Job ID"
    jobIdBox.TextColor3 = Color3.new(1, 1, 1)
    jobIdBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    jobIdBox.Font = Enum.Font.Gotham
    jobIdBox.TextSize = 16
    jobIdBox.Parent = tabFrame
    Instance.new("UICorner", jobIdBox).CornerRadius = UDim.new(0, 6)

    -- Button: Jump to Job ID
    local jumpBtn = Instance.new("TextButton")
    jumpBtn.Size = UDim2.new(1, -20, 0, 30)
    jumpBtn.Position = UDim2.new(0, 10, 0, 240)
    jumpBtn.Text = "Jump to Job ID"
    jumpBtn.TextColor3 = Color3.new(1, 1, 1)
    jumpBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
    jumpBtn.Font = Enum.Font.GothamBold
    jumpBtn.TextSize = 16
    jumpBtn.Parent = tabFrame
    Instance.new("UICorner", jumpBtn).CornerRadius = UDim.new(0, 6)

    jumpBtn.MouseButton1Click:Connect(function()
        local jobId = jobIdBox.Text
        if jobId ~= "" then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, jobId, player)
        end
    end)

    -- Button: Hop Server
    local hopBtn = Instance.new("TextButton")
    hopBtn.Size = UDim2.new(1, -20, 0, 30)
    hopBtn.Position = UDim2.new(0, 10, 0, 280)
    hopBtn.Text = "Hop Server"
    hopBtn.TextColor3 = Color3.new(1, 1, 1)
    hopBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    hopBtn.Font = Enum.Font.GothamBold
    hopBtn.TextSize = 16
    hopBtn.Parent = tabFrame
    Instance.new("UICorner", hopBtn).CornerRadius = UDim.new(0, 6)

    hopBtn.MouseButton1Click:Connect(function()
        TeleportService:Teleport(game.PlaceId, player)
    end)

    -- Button: Rejoin
    local rejoinBtn = Instance.new("TextButton")
    rejoinBtn.Size = UDim2.new(1, -20, 0, 30)
    rejoinBtn.Position = UDim2.new(0, 10, 0, 320)
    rejoinBtn.Text = "Rejoin Server"
    rejoinBtn.TextColor3 = Color3.new(1, 1, 1)
    rejoinBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    rejoinBtn.Font = Enum.Font.GothamBold
    rejoinBtn.TextSize = 16
    rejoinBtn.Parent = tabFrame
    Instance.new("UICorner", rejoinBtn).CornerRadius = UDim.new(0, 6)

    rejoinBtn.MouseButton1Click:Connect(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
    end)
end
