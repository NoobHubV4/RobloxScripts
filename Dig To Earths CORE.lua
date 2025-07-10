local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Wizard%20Lib.lua'))()
local Window = Library:NewWindow("Dig To Earth's CORE")
local Rstorage = game.ReplicatedStorage
local States = {}
local Main = Window:NewSection("Main")
Main:CreateToggle("Auto Money", function(state)
      States.AutoMoney = state
end)
Main:CreateToggle("Auto Gem", function(state)
     States.AutoGem = state
end)
Main:CreateToggle("Auto Chest", function(state)
     States.AutoChest = state
end)
Main:CreateButton("Get 10 Spins", function()
     Ratorage.Remotes.SpinPrizeEvent:FireServer(10)
end)
Main:CreateButton("Get Dominus Pet", function()
     Ratorage.Remotes.SpinPrizeEvent:FireServer(4)
end)
Main:CreateButton("Get 10X Money", function()
     Ratorage.Remotes.SpinPrizeEvent:FireServer(8)
end)
spawn(function()
    task0 = function()
      if States.AutoMoney then
        Rstorage.Remotes.DigEvent:FireServer("hello")
      end
      if States.AutoGem then
        Rstorage.Remotes.GemEvent:FireServer(20, "bye")
      end
      if States.AutoChest then
        Rstorage.Remotes.TreasureEvent:FireServer("Chest")
      end
    end
    while task.wait() do
      pcall(task0)
    end
end)
