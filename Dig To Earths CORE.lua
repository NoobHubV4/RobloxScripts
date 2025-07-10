local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Wizard%20Lib.lua'))()
local Window = Library:NewWindow("Dig To Earth's CORE")
local Rstorage = game.ReplicatedStorage
local States = {}
local Pet = "Doggy"
local Main = Window:NewSection("Main")
local Toggle = Window:NewSection("Toggles")
Main:CreateButton("Get 10 Spins", function()
     Rstorage.Remotes.SpinPrizeEvent:FireServer(10)
end)
Main:CreateButton("Get 10X Money", function()
     Rstorage.Remotes.SpinPrizeEvent:FireServer(8)
end)
Main:CreateDropdown("Pet", {"Doggy","Wizard","Cactus","Swimmer","Astronaut","Police","Triple Dominus","Cowboy","Camel","Robot","Cosmo Boy","Princess Cat","Star Gepard"}, 1, function(select)
     Pet = select
end)
Main:CreateButton("Give Pet", function()
     Rstorage.Remotes.PetCageEvent:FireServer(Pet)
end)
Toggle:CreateToggle("Auto Money", function(state)
      States.AutoMoney = state
end)
Toggle:CreateToggle("Auto Gem", function(state)
     States.AutoGem = state
end)
Toggle:CreateToggle("Auto Chest", function(state)
     States.AutoChest = state
end)
Toggle:CreateToggle("Auto Win", function(state)
     States.AutoWin = state
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
        Rstorage.Remotes.TreasureEvent:FireServer("Chest15")
      end
      if States.AutoWin then
        Rstorage.Remotes.TreasureEvent:FireServer("Cup15")
      end
    end
    while task.wait() do
      pcall(task0)
    end
end)
