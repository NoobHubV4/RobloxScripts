local Players = game.Players
local LocalPlayer = Players.LocalPlayer

function FindTool(Item)
  if Item == "guibat" then
    local tool = LocalPlayer.Character:FindFirstChild("Guibat") or LocalPlayer.Backpack:FindFirstChild("Guibat")
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
  local tool = FindTool("guibat")
  if not tool then
    BuyItem("Guibat")
  end
  game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Guibat"):WaitForChild("Play"):FireServer(tool)
end

function HealPlayer()
	local tool = FindTool("batburger")
	if not tool then
		BuyItem("Batburger")
	end
	game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Batburger"):WaitForChild("Snack"):FireServer(tool)
end

spawn(function()
    task0 = function()
         local VPart = LocalPlayer.Character.HumanoidRootPart
         for _, Targets in pairs(Players:GetPlayers()) do
	     if Targets ~= v and Targets.Character and not Targets.Character:FindFirstChildWhichIsA("ForceField") and Targets.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
		   local TPart = Targets.Character:FindFirstChildWhichIsA("BasePart")
		   if VPart and TPart and Targets ~= LocalPlayer then
			  if (TPart.Position-VPart.Position).Magnitude <= 35 then
				  KillAura()
			  end
		   end
	     end
         end
	 local humanoid = LocalPlayer.Character.Humanoid
         if humanoid.Health <= 99 then
	      HealPlayer()
	 end
    end
    while task.wait() do
	pcall(task0)
    end
end)
