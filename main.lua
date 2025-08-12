local success, result = pcall(function()
    print("🔄 Loading GUI module...")

    local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NinR3227/Test/main/GUI.lua"))()
    if typeof(GUI) == "function" then
        GUI()
    else
        warn("⚠️ GUI.lua did not return a function.")
    end
end)

if not success then
    warn("❌ Failed to load GUI:", result)
end