-- File: MainTab.lua
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer

local placeId = game.PlaceId
local jobId = game.JobId
local serverVersion = game.PrivateServerId or "Public"

return function(tabFrame)
    tabFrame:ClearAllChildren()

    -- Title
    local title = Instance.new("TextLabel", tabFrame)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "Welcome to Germa66"
    title.TextColor3 = Color3.fromRGB(255, 255, 0)
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true
    title.TextStrokeTransparency = 0.5

    -- Player Info
    local infoFrame = Instance.new("Frame", tabFrame)
    infoFrame.Size = UDim2.new(1, -20, 0, 90)
    infoFrame.Position = UDim2.new(0, 10, 0, 50)
    infoFrame.BackgroundTransparency = 1

    local layout = Instance.new("UIListLayout", infoFrame)
    layout.Padding = UDim.new(0, 5)

    local function addInfo(labelText, value)
        local label = Instance.new("TextLabel", infoFrame)
        label.Size = UDim2.new(1, 0, 0, 25)
        label.BackgroundTransparency = 1
        label.Text = labelText .. ": " .. tostring(value)
        label.Font = Enum.Font.Gotham
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextScaled = true
    end

    addInfo("Player Name", LocalPlayer.Name)
    addInfo("Player Count", #Players:GetPlayers())
    addInfo("Ping", math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()))

    -- Server Dropdown
    local dropdown = Instance.new("Frame", tabFrame)
    dropdown.Size = UDim2.new(1, -20, 0, 200)
    dropdown.Position = UDim2.new(0, 10, 0, 150)
    dropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    dropdown.BorderSizePixel = 0
    dropdown.Visible = false

    local dropdownLayout = Instance.new("UIListLayout", dropdown)
    dropdownLayout.Padding = UDim.new(0, 5)

    local function addDropdownLabel(text)
        local label = Instance.new("TextLabel", dropdown)
        label.Size = UDim2.new(1, 0, 0, 25)
        label.BackgroundTransparency = 1
        label.Text = text
        label.Font = Enum.Font.Gotham
        label.TextColor3 = Color3.fromRGB(200, 200, 200)
        label.TextScaled = true
    end

    addDropdownLabel("Server ID: " .. jobId)
    addDropdownLabel("Server Version: " .. serverVersion)

    local rejoinBtn = Instance.new("TextButton", dropdown)
    rejoinBtn.Size = UDim2.new(1, 0, 0, 30)
    rejoinBtn.Text = "🔁 Rejoin Server"
    rejoinBtn.Font = Enum.Font.GothamBold
    rejoinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    rejoinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    rejoinBtn.MouseButton1Click:Connect(function()
        TeleportService:TeleportToPlaceInstance(placeId, jobId, LocalPlayer)
    end)

    local hopBtn = Instance.new("TextButton", dropdown)
    hopBtn.Size = UDim2.new(1, 0, 0, 30)
    hopBtn.Text = "🌐 Hop Server"
    hopBtn.Font = Enum.Font.GothamBold
    hopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    hopBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    hopBtn.MouseButton1Click:Connect(function()
        TeleportService:Teleport(placeId)
    end)

    local jobIdBox = Instance.new("TextBox", dropdown)
    jobIdBox.Size = UDim2.new(1, 0, 0, 30)
    jobIdBox.PlaceholderText = "Enter Job ID"
    jobIdBox.Font = Enum.Font.Gotham
    jobIdBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    jobIdBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

    local joinBtn = Instance.new("TextButton", dropdown)
    joinBtn.Size = UDim2.new(1, 0, 0, 30)
    joinBtn.Text = "🚀 Join Job ID"
    joinBtn.Font = Enum.Font.GothamBold
    joinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    joinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    joinBtn.MouseButton1Click:Connect(function()
        local inputId = jobIdBox.Text
        if inputId and inputId ~= "" then
            TeleportService:TeleportToPlaceInstance(placeId, inputId, LocalPlayer)
        end
    end)

    -- Add buttons to dropdown
    rejoinBtn.Parent = dropdown
    hopBtn.Parent = dropdown
    jobIdBox.Parent = dropdown
    joinBtn.Parent = dropdown

    -- Toggle Button
    local toggleBtn = Instance.new("TextButton", tabFrame)
    toggleBtn.Size = UDim2.new(0, 150, 0, 30)
    toggleBtn.Position = UDim2.new(0.5, -75, 0, 360)
    toggleBtn.Text = "▼ Server Tools"
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    toggleBtn.MouseButton1Click:Connect(function()
        dropdown.Visible = not dropdown.Visible
        toggleBtn.Text = dropdown.Visible and "▲ Server Tools" or "▼ Server Tools"
    end)
end