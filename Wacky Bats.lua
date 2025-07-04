local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Wizard%20Lib.lua'))()
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local States = {}
local Ability = "Throw Subspace Tripmine"

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
  elseif Item == "subspace tripbat" then
    local tool = LocalPlayer.Character:FindFirstChild("Subspace Tripbat") or LocalPlayer.Backpack:FindFirstChild("Subspace Tripbat")
    if tool then
      return tool
    end
  elseif Item == "gubby bat" then
    local tool = LocalPlayer.Character:FindFirstChild("Gubby Bat") or LocalPlayer.Backpack:FindFirstChild("Gubby Bat")
    if tool then
      return tool
    end
  elseif Item == "grug bat" then
    local tool = LocalPlayer.Character:FindFirstChild("Grug Bat") or LocalPlayer.Backpack:FindFirstChild("Grug Bat")
    if tool then
      return tool
    end
  elseif Item == "batless" then
    local tool = LocalPlayer.Character:FindFirstChild("Batless") or LocalPlayer.Backpack:FindFirstChild("Batless")
    if tool then
      return tool
    end
  elseif Item == "shotbat" then
    local tool = LocalPlayer.Character:FindFirstChild("Shotbat") or LocalPlayer.Backpack:FindFirstChild("Shotbat")
    if tool then
      return tool
    end
  elseif Item == "knockout" then
    local tool = LocalPlayer.Character:FindFirstChild("Knockout") or LocalPlayer.Backpack:FindFirstChild("Knockout")
    if tool then
      return tool
    end
  elseif Item == "guardian" then
    local tool = LocalPlayer.Character:FindFirstChild("Guardian") or LocalPlayer.Backpack:FindFirstChild("Guardian")
    if tool then
      return tool
    end
  elseif Item == "guibat" then
    local tool = LocalPlayer.Character:FindFirstChild("Guibat") or LocalPlayer.Backpack:FindFirstChild("Guibat")
    if tool then
      return tool
    end
  elseif Item == "power bat" then
    local tool = LocalPlayer.Character:FindFirstChild("Power Bat") or LocalPlayer.Backpack:FindFirstChild("Power Bat")
    if tool then
      return tool
    end
  elseif not Item then
    local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
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
end

function HealPlayer()
	local tool = FindTool("batburger")
	if not tool then
		BuyItem("Batburger")
	end
	game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Batburger"):WaitForChild("Snack"):FireServer(tool)
end

function AbilityNoCooldown(Ability)
	if Ability == "Throw Subspace tripmine" then
		local tool = FindTool("subspace tripbat")
		if not tool then
			BuyItem("Subspace Tripbat")
		end
		game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Subspace Tripbat"):WaitForChild("Tripmine Throw"):FireServer(tool)
	elseif Ability == "Gubby Dash" then
		local tool = FindTool("gubby bat")
		if not tool then
			BuyItem("Gubby Bat")
		end
                game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Gubby Bat"):WaitForChild("Gubby Dash"):FireServer(tool)
	elseif Ability == "Smash" then
		local tool = FindTool("grug bat")
		if not tool then
			BuyItem("Grug Bat")
		end
                game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Grug Bat"):WaitForChild("Smash"):FireServer(tool)
	elseif Ability == "Quick Kick" then
		local tool = FindTool("batless")
		if not tool then
			BuyItem("Batless")
		end
                game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Batless"):WaitForChild("Quick Kick"):FireServer(tool)
	elseif Ability == "Blast" then
		local tool = FindTool("shotbat")
		if not tool then
			BuyItem("Shotbat")
		end
                game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Shotbat"):WaitForChild("Blast"):FireServer(tool)
	elseif Ability == "Strike" then
		local tool = FindTool("knockout")
		if not tool then
			BuyItem("Knockout")
		end
                game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Knockout"):WaitForChild("Strike"):FireServer(tool)
	elseif Ability == "Play" then
		local tool = FindTool("guibat")
		if not tool then
			BuyItem("Guibat")
		end
                game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Guibat"):WaitForChild("Play"):FireServer(tool)
	elseif Ability == "Guard" then
		local tool = FindTool("guardian")
		if not tool then
			BuyItem("Guardian")
		end
                game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Guardian"):WaitForChild("Guard"):FireServer(tool)
	elseif Ability == "Power Up" then
		local tool = FindTool("power bat")
		if not tool then
			BuyItem("Power Bat")
		end
		game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Power Bat"):WaitForChild("Power Up"):FireServer(tool)
	end
end

function KillAll()
	for i,v in pairs(game.Players:GetPlayers()) do
		if v.Character and not v.Character:FindFirstChildWhichIsA("ForceField") and v.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
		        if v ~= LocalPlayer then
			        repeat task.wait(.1)
				        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
				        AbilityNoCooldown("Gubby Dash")
			        until v.Character.Humanoid.Health == 0
		        end
	        end
	end
end

spawn(function()
    task0 = function()
	 if States.KillAura then
             local VPart = LocalPlayer.Character.HumanoidRootPart
             for _, Targets in pairs(Players:GetPlayers()) do
	           if Targets.Character and not Targets.Character:FindFirstChildWhichIsA("ForceField") and Targets.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
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
              game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Basic Bat"):FireServer(FindTool())
	 end
	 if States.ThrowTripmine then
	      AbilityNoCooldown("Throw Subspace tripmine")
	 end
	 if States.GubbyDash then
	      AbilityNoCooldown("Gubby Dash")
	      wait(1)
	 end
	 if States.Smash then
	      AbilityNoCooldown("Smash")
	 end
	 if States.QuickKick then
	      AbilityNoCooldown("Quick Kick")
	 end
	 local humanoid = LocalPlayer.Character.Humanoid
	 if humanoid.WalkSpeed <= 19 then
	      humanoid.WalkSpeed = 20
	 end
    end
    while task.wait() do
	pcall(task0)
    end
end)
spawn(function()
    task1 = function()
	 if States.Blast then
	      AbilityNoCooldown("Blast")
	 end
	 if States.Strike then
	      AbilityNoCooldown("Strike")
	 end
	 if States.Play then
	      AbilityNoCooldown("Play")
	 end
	 if States.Guard then
	      AbilityNoCooldown("Guard")
	 end
	 if States.PowerUp then
	      AbilityNoCooldown("Power Up")
	 end
	 if States.Loopkillall then
	      KillAll()
	 end
    end
    while task.wait() do
	pcall(task1)
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
Section:CreateDropdown("Select Ability", {"Throw Subspace Tripmine","Gubby Dash","Smash","Quick Kick","Blast","Strike","Play","Guard","Power Up"}, 1, function(v)
	Ability = v
end)
Section:CreateToggle("Spam Ability", function(v)
	if Ability == "Throw Subspace Tripmine" then
		States.ThrowTripmine = v
	elseif Ability == "Gubby Dash" then
		States.GubbyDash = v
	elseif Ability == "Smash" then
		States.Smash = v
	elseif Ability == "Quick Kick" then
		States.QuickKick = v
	elseif Ability == "Blast" then
		States.Blast = v
	elseif Ability == "Strike" then
		States.Strike = v
	elseif Ability == "Play" then
		States.Play = v
	elseif Ability == "Guard" then
		States.Guard = v
	elseif Ability == "Power Up" then
		States.PowerUp = v
	end
end)
Section:CreateButton("Kill All", function()
	KillAll()
end)

Section:CreateToggle("Loop Kill All", function(v)
	States.Loopkillall = v
end)
