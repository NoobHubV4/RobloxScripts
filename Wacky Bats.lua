local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Wizard%20Lib.lua'))()
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local States = {}

function FindTool(Item)
  if Item == "magnetizer" then
    local tool = LocalPlayer.Character:FindFirstChild("Magnetizer") or LocalPlayer.Backpack:FindFirstChild("Magnetizer")
    if tool then
      return tool
    end
  elseif Item == "batburger" then
    local tool = LocalPlayer.Character:FindFirstChild("Batburger") or LocalPlayer.Backpack:FindFirstChild("Batburger")
    if tool then
      return tool
    end
  end
end

function BuyItem(Item)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpdateLastBat"):FireServer(Item)
end

function KillAura()
  local tool = FindTool("magnetizer")
  if not tool then
    BuyItem("Magnetizer")
  end
  game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Magnetizer"):WaitForChild("Magnetize"):FireServer(tool)
  LocalPlayer.Character.Humanoid.WalkSpeed = 20
end

function HealPlayer()
	local tool = FindTool("batburger")
	if not tool then
		BuyItem("Batburger")
	end
	game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Batburger"):WaitForChild("Snack"):FireServer(tool)
	LocalPlayer.Character.Humanoid.WalkSpeed = 20
end

spawn(function()
    task0 = function()
	 if States.KillAura then
             local VPart = LocalPlayer.Character.HumanoidRootPart
             for _, Targets in pairs(Players:GetPlayers()) do
	           if Targets ~= v and Targets.Character and not Targets.Character:FindFirstChildWhichIsA("ForceField") and Targets.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
		          local TPart = Targets.Character:FindFirstChildWhichIsA("BasePart")
		          if VPart and TPart and Targets ~= LocalPlayer then
			          if (TPart.Position-VPart.Position).Magnitude <= 30 then
				         KillAura()
			          end
		          end
	           end
              end
	 end
	 local humanoid = LocalPlayer.Character.Humanoid
         if humanoid.Health <= 99 and States.AutoHeal then
	      HealPlayer()
	 end
	 if States.AutoSwing then
              game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Basic Bat"):FireServer(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"))
	 end
    end
    while task.wait() do
	pcall(task0)
    end
end)
local Window = Library:NewWindow("NoobHubV1 Hub")

local Section = Window:NewSection("Auto Farm")

Section:CreateToggle("Kill Aura", function(v)
	States.KillAura = v
end)

Section:CreateToggle("Auto Heal", function(v)
	States.AutoHeal = v
end)

Section:CreateToggle("Auto Swing", function(v)
	States.AutoSwing = v
end)
