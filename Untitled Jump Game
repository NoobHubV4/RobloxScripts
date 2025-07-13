local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Wizard%20Lib.lua'))()
local Window = Library:NewWindow("Untitled Jump Game")
local Rstorage = game.ReplicatedStorage
local auto = false
local Main = Window:NewSection("Main")
Main:CreateTextbox("Jump Power", function(value)
     game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("AddPower"):FireServer(tonumber(value))
end)
Main:CreateTextbox("Add Cash", function(value)
     game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("JumpFinished"):FireServer(tonumber(value))
end)
Main:CreateTextbox("Add Caoest FT", function(value)
     game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("UpdateMax"):FireServer(tonumber(value))
end)
Main:CreateToggle("Auto Rebirth", function(state)
     auto = state
     Stepped = game.RunService.Stepped:Connect(function()
        if auto then
          game:GetService("ReplicatedStorage"):WaitForChild("RebirthEvent"):FireServer()
        elseif not auto then
          Stepped:Disconnect()
        end
     end)
end)
