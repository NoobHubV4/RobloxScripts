local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Wizard%20Lib.lua'))()
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local States = {}
local Ability = "Tripmine Throw"
local WalkSpeed = 20
local DefaultSpeed = WalkSpeed
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local center = rootPart.Position
local distance = 3
local angle = 50

local function orbit(user)
    if not user then
      return
    else
        coroutine.wrap(function()
                local angular = tick() * angle
                local center = user.Character.HumanoidRootPart.Position

                local x = center.X + distance * math.cos(angular)
                local y = center.Y
                local z = center.Z + distance * math.sin(angular)

                rootPart.CFrame = CFrame.new(Vector3.new(x, y, z))
                rootPart.CFrame = CFrame.new(rootPart.Position, center)
        end)()
    end
end

local function TweenTP(cf)
	local root = LocalPlayer.Character.HumanoidRootPart
	local cf0 = (cf-cf.p) + root.Position + Vector3.new(0,4,0)
	local diff = cf.p - root.Position
	local oldg = workspace.Gravity
	workspace.Gravity = 0
	for i=0,diff.Magnitude,5 do
		root.CFrame = cf0 + diff.Unit * i
		root.Velocity,root.RotVelocity=Vector3.new(),Vector3.new()
		task.wait()
	end
	root.CFrame = cf
	workspace.Gravity = oldg
end

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
  elseif Item == "diamond bat" then
    local tool = LocalPlayer.Character:FindFirstChild("Diamond Bat") or LocalPlayer.Backpack:FindFirstChild("Diamond Bat")
    if tool then
      return tool
    end
  elseif Item == "ninja bat" then
    local tool = LocalPlayer.Character:FindFirstChild("Ninja Bat") or LocalPlayer.Backpack:FindFirstChild("Ninja Bat")
    if tool then
      return tool
    end
  elseif Item == "berserker" then
    local tool = LocalPlayer.Character:FindFirstChild("Berserker") or LocalPlayer.Backpack:FindFirstChild("Berserker")
    if tool then
      return tool
    end
  elseif Item == "trident bat" then
    local tool = LocalPlayer.Character:FindFirstChild("Trident Bat") or LocalPlayer.Backpack:FindFirstChild("Trident Bat")
    if tool then
      return tool
    end
  elseif Item == "poison bat" then
    local tool = LocalPlayer.Character:FindFirstChild("Poison Bat") or LocalPlayer.Backpack:FindFirstChild("Poison Bat")
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

function AbilityNoCooldown(Ability)
	if Ability == "Tripmine Throw" then
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
	elseif Ability == "Harden" then
		local tool = FindTool("diamond bat")
		if not tool then
			BuyItem("Diamond Bat")
		end
                game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Diamond Bat"):WaitForChild("Harden"):FireServer(tool)
	elseif Ability == "Ninja Dash" then
		local tool = FindTool("ninja bat")
		if not tool then
			BuyItem("Ninja Bat")
		end
                game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Ninja Bat"):WaitForChild("Ninja Dash"):FireServer(tool)
	elseif Ability == "Rage" then
		local tool = FindTool("berserker")
		if not tool then
			BuyItem("Berserker")
		end
                game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Berserker"):WaitForChild("Rage"):FireServer(tool)
	elseif Ability == "Lunge" then
		local tool = FindTool("trident bat")
		if not tool then
			BuyItem("Trident Bat")
		end
                game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Trident Bat"):WaitForChild("Lunge"):FireServer(tool)
	elseif Ability == "Magnetize" then
		local tool = FindTool("magnetizer")
		if not tool then
			BuyItem("Magnetizer")
		end
		game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Magnetizer"):WaitForChild("Magnetize"):FireServer(tool)
	elseif Ability == "Poison Cloud" then
		local tool = FindTool("poison bat")
		if not tool then
			BuyItem("Poison Bat")
		end
		game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Poison Bat"):WaitForChild("Poison Cloud"):FireServer(tool)
	elseif Ability == "Snack" then
		local tool = FindTool("batburger")
		if not tool then
			BuyItem("Batburger")
		end
		game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Batburger"):WaitForChild("Snack"):FireServer(tool)
	end
end

function HealPlayer()
	local tool = FindTool("batburger")
	if not tool then
		BuyItem("Batburger")
	end
	game:GetService("ReplicatedStorage"):WaitForChild("BatRemotes"):WaitForChild("Batburger"):WaitForChild("Snack"):FireServer(tool)
end

function Kill(Target)
  repeat task.wait()
	targetcframe = Target.Character.HumanoidRootPart.CFrame
	TweenTP(targetcframe * CFrame.new(0, 0, -3))
	local CharPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	local tpos = Target.Character:FindFirstChild("HumanoidRootPart").Position
	local TPos = Vector3.new(tpos.X,CharPos.Y,tpos.Z)
	local NewCFrame = CFrame.new(CharPos,TPos)
	Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NewCFrame
	AbilityNoCooldown("Blast")
  until Target.Character.Humanoid.Health == 0 or Target.Character:FindFirstChildWhichIsA("ForceField")
end

function KillAll()
	for i,v in pairs(game.Players:GetPlayers()) do
		if v.Character and not v.Character:FindFirstChildWhichIsA("ForceField") and v.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
		        if v ~= LocalPlayer then
			        Kill(v)
		        end
	        end
	end
end

function Notif(Title, Text, Duration)
	local Duration = Duration
	if not Duration then
		Duration = 3
 	end
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = Title;
		Text = Text;
		Icon = "";
		Duration = Duration;
	})
end

spawn(function()
    task0 = function()
	 if States.KillAura then
             local VPart = LocalPlayer.Character.HumanoidRootPart
             for _, Targets in pairs(Players:GetPlayers()) do
	           if Targets.Character and not Targets.Character:FindFirstChildWhichIsA("ForceField") and Targets.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
		          local TPart = Targets.Character:FindFirstChildWhichIsA("BasePart")
		          if VPart and TPart and Targets ~= LocalPlayer then
			          if (TPart.Position-VPart.Position).Magnitude <= 10 then
				         Kill(Targets)
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
	 if States.TripmineThrow then
	      AbilityNoCooldown("Tripmine Throw")
	 end
	 if States.GubbyDash then
	      AbilityNoCooldown("Gubby Dash")
	 end
	 if States.Smash then
	      AbilityNoCooldown("Smash")
	 end
	 if States.QuickKick then
	      AbilityNoCooldown("Quick Kick")
	 end
	 if States.speed then
	      local humanoid = LocalPlayer.Character.Humanoid
	      humanoid.WalkSpeed = DefaultSpeed
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
	      for i,v in pairs(game.Players:GetPlayers()) do
		      if v.Character and not v.Character:FindFirstChildWhichIsA("ForceField") and v.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
		              if v ~= LocalPlayer then
			              Kill(v)
		              end
	              end
	      end
	 end
	 if States.Harden then
	      AbilityNoCooldown("Harden")
	 end
	 if States.NinjaDash then
	      AbilityNoCooldown("Ninja Dash")
	 end
    end
    while task.wait() do
	pcall(task1)
    end
end)
spawn(function()
    task2 = function()
	 if States.Rage then
	      AbilityNoCooldown("Rage")
	 end
	 if States.Lunge then
	      AbilityNoCooldown("Lunge")
	 end
	 if States.Magnetize then
	      AbilityNoCooldown("Magnetize")
	 end
	 if States.PoisonCloud then
	      AbilityNoCooldown("Poison Cloud")
	 end
	 if States.Snack then
	      AbilityNoCooldown("Snack")
	 end
    end
    while task.wait() do
	pcall(task2)
    end
end)
local Window = Library:NewWindow("NoobHubV1 Hub")
local Main = Window:NewSection("Main")
local Kills = Window:NewSection("Kills")
local Settings = Window:NewSection("Settings")
Main:CreateToggle("Kill Aura", function(v)
	States.KillAura = v
end)
Main:CreateToggle("Auto Heal", function(v)
	States.AutoHeal = v
end)
Main:CreateToggle("Auto Swing", function(v)
	States.AutoSwing = v
end)
Main:CreateDropdown("Select Ability", {"Tripmine Throw","Gubby Dash","Smash","Quick Kick","Blast","Strike","Play","Guard","Power Up","Harden","Ninja Dash","Rage","Lunge","Magnetize","Poison Cloud","Snack"}, 1, function(v)
	Ability = v
end)
Main:CreateToggle("Spam Ability", function(v)
	if Ability == "Tripmine Throw" then
		States.TripmineThrow = v
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
	elseif Ability == "Harden" then
		States.Harden = v
	elseif Ability == "Ninja Dash" then
		States.NinjaDash = v
	elseif Ability == "Rage" then
		States.Rage = v
	elseif Ability == "Lunge" then
		States.Lunge = v
	elseif Ability == "Magnetize" then
		States.Magnetize = v
	elseif Ability == "Poison Cloud" then
		States.PoisonCloud = v
	elseif Ability == "Snack" then
		States.Snack = v
	end
end)
Kills:CreateButton("Kill All", function()
	KillAll()
end)
Kills:CreateToggle("Loop Kill All", function(v)
	States.Loopkillall = v
end)
Settings:CreateTextbox("Speed", function(s)
	WalkSpeed = s
end)
Settings:CreateToggle("Speed Hack", function(value)
	if value == true then
	        DefaultSpeed = WalkSpeed
		States.speed = true
	elseif not value then
		DefaultSpeed = 20
		States.speed = false
		local humanoid = LocalPlayer.Character.Humanoid
	        humanoid.WalkSpeed = DefaultSpeed
	end
end)
