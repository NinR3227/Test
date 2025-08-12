local raw = game:HttpGet("https://raw.githubusercontent.com/NinR3227/Test/main/GUI.lua")
print("Fetched GUI.lua:\n", raw)

local func = loadstring(raw)
print("Type of loaded function:", typeof(func))

if func then
    local GUI = func()
    print("GUI loaded:", typeof(GUI))
else
    warn("Failed to load GUI.lua")
end