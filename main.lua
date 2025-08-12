-- main.lua
local Config = loadstring(game:HttpGet("https://raw.githubusercontent.com/NinR3227/VnsHub/main/Config.lua"))()
local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NinR3227/VnsHub/main/GUI.lua"))()
local Automation = loadstring(game:HttpGet("https://raw.githubusercontent.com/NinR3227/VnsHub/main/Automation.lua"))()

GUI:Init(Config)
Automation:Init(GUI.MainFrame, Config)
