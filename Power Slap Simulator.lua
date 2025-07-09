local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Wizard%20Lib.lua'))()
local Window = Library:NewWindow("Power Slap Simulator")
local Rstorage = game.ReplicatedStorage
local player = game.Players.LocalPlayer
local stats = player:FindFirstChild("leaderstats")
local Main = Window:NewSection("Main")
Main:CreateTextbox("Give Power", function(value)
     Rstorage.Remotes.Client:InvokeServer("ClickStat", tonumber(value))
end)
Main:CreateTextbox("Give Health", function(value)
     if stats:FindFirstChild("Health") then
          stats.Health.Value = tonumber(value)
     end
end)
