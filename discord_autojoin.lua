local Join = loadstring(game:HttpGet"https://raw.githubusercontent.com/Voxel0/scripts/main/discord.lua")() 
local Code = game:HttpGet("https://raw.githubusercontent.com/Voxel0/scripts/main/discordcode")
local GUI = game:GetService("StarterGui")
local cb = Instance.new("BindableFunction")

        coroutine.wrap(function() Join(Code) end)()
        pcall(function() setclipboard("https://discord.gg/" .. Code) end)
    	GUI:SetCore("SendNotification", {
            Title = "Discord",
            Text = "Attempted to join you into the server, we also set the invite to your clipboard!",
            Duration = 5
        })
    
