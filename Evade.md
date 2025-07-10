local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Wizard%20Lib.lua'))()
local Window = Library:NewWindow("Evade")
local Rstorage = game.ReplicatedStorage
local Main = Window:NewSection("Main")
Main:CreateButton("Respawn", function()
     Rstorage.Events.Player.ChangePlayerMode:FireServer(true)
end)
