return function(tabFrame)
    local label = Instance.new("TextLabel", tabFrame)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = "Main Tab Loaded!"
    label.TextColor3 = Color3.new(1, 1, 0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextScaled = true
end