local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Wizard%20Lib.lua'))()
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local States = {}
local Ability = "Tripmine Throw"
local WalkSpeed = 20
local DefaultSpeed = WalkSpeed
local Rstorage = game.ReplicatedStorage
local BatRemotes = Rstorage.BatRemotes
local Remotes = Rstorage.Remotes
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

function CheckFriends(player)
	return not LocalPlayer:IsFriendsWith(player.UserId)
end

function FindTool(Item)
  if Item then
    local tool = LocalPlayer.Character:FindFirstChild(Item) or LocalPlayer.Backpack:FindFirstChild(Item)
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
        Remotes.UpdateLastBat:FireServer(Item)
end

function BatRemote(arg1, arg2)
	if arg2 then
		return BatRemotes:FindFirstChild(arg1):FindFirstChild(arg2)
	elseif not arg2 then
		return BatRemotes:FindFirstChild(arg1)
	end
end

function AbilityNoCooldown(Ability)
	if Ability == "Tripmine Throw" then
		local tool = FindTool("Subspace Tripbat")
		if not tool then
			BuyItem("Subspace Tripbat")
		end
		BatRemote("Subspace Tripbat", "Tripmine Throw"):FireServer(tool)
	elseif Ability == "Gubby Dash" then
		local tool = FindTool("Gubby Bat")
		if not tool then
			BuyItem("Gubby Bat")
		end
                BatRemote("Gubby Bat", "Gubby Dash"):FireServer(tool)
	elseif Ability == "Smash" then
		local tool = FindTool("Grug Bat")
		if not tool then
			BuyItem("Grug Bat")
		end
                BatRemote("Grug Bat", "Smash"):FireServer(tool)
	elseif Ability == "Quick Kick" then
		local tool = FindTool("Batless")
		if not tool then
			BuyItem("Batless")
		end
                BatRemote("Batless", "Quick Kick"):FireServer(tool)
	elseif Ability == "Blast" then
		local tool = FindTool("Shotbat")
		if not tool then
			BuyItem("Shotbat")
		end
                BatRemote("Shotbat", "Blast"):FireServer(tool)
	elseif Ability == "Strike" then
		local tool = FindTool("Knockout")
		if not tool then
			BuyItem("Knockout")
		end
		BatRemote("Knockout", "Strike"):FireServer(tool)
	elseif Ability == "Play" then
		local tool = FindTool("Guibat")
		if not tool then
			BuyItem("Guibat")
		end
                BatRemote("Guibat", "Play"):FireServer(tool)
	elseif Ability == "Guard" then
		local tool = FindTool("Guardian")
		if not tool then
			BuyItem("Guardian")
		end
                BatRemote("Guardian", "Guard"):FireServer(tool)
	elseif Ability == "Power Up" then
		local tool = FindTool("Power Bat")
		if not tool then
			BuyItem("Power Bat")
		end
		BatRemote("Power Bat", "Power Up"):FireServer(tool)
	elseif Ability == "Harden" then
		local tool = FindTool("Diamond Bat")
		if not tool then
			BuyItem("Diamond Bat")
		end
                BatRemote("Diamond Bat", "Harden"):FireServer(tool)
	elseif Ability == "Ninja Dash" then
		local tool = FindTool("Ninja Bat")
		if not tool then
			BuyItem("Ninja Bat")
		end
                BatRemote("Ninja Bat", "Ninja Dash"):FireServer(tool)
	elseif Ability == "Rage" then
		local tool = FindTool("Berserker")
		if not tool then
			BuyItem("Berserker")
		end
                BatRemote("Berserker", "Rage"):FireServer(tool)
	elseif Ability == "Lunge" then
		local tool = FindTool("Trident Bat")
		if not tool then
			BuyItem("Trident Bat")
		end
                BatRemote("Trident Bat", "Lunge"):FireServer(tool)
	elseif Ability == "Magnetize" then
		local tool = FindTool("Magnetizer")
		if not tool then
			BuyItem("Magnetizer")
		end
		BatRemote("Magnetizer", "Magnetize"):FireServer(tool)
	elseif Ability == "Poison Cloud" then
		local tool = FindTool("Poison Bat")
		if not tool then
			BuyItem("Poison Bat")
		end
		BatRemote("Poison Bat", "Poison Cloud"):FireServer(tool)
	elseif Ability == "Snack" then
		local tool = FindTool("Batburger")
		if not tool then
			BuyItem("Batburger")
		end
		BatRemote("Batburger", "Snack"):FireServer(tool)
	elseif Ability == "Nimbus Flight" then
		local tool = FindTool("Cloud Bat")
		if not tool then
			BuyItem("Cloud Bat")
		end
		BatRemote("Cloud Bat", "Nimbus Flight"):FireServer(tool)
	elseif Ability == "Invisibility" then
		local tool = FindTool("Ghost Bat")
		if not tool then
			BuyItem("Ghost Bat")
		end
		BatRemote("Ghost Bat", "Invisibility"):FireServer(tool)
	end
end

function TeleportToKill(Target)
	targetcframe = Target.Character.HumanoidRootPart.CFrame
	TweenTP(targetcframe * CFrame.new(0, 0, -1))
	local CharPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	local tpos = Target.Character:FindFirstChild("HumanoidRootPart").Position
	local TPos = Vector3.new(tpos.X,CharPos.Y,tpos.Z)
	local NewCFrame = CFrame.new(CharPos,TPos)
	Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NewCFrame
end

function HealPlayer()
	local tool = FindTool("Batburger")
	if not tool then
		BuyItem("Batburger")
	end
	BatRemote("Batburger", "Snack"):FireServer(tool)
end

function Kill(plr)
  repeat task.wait()
	Remotes.UpdateMobileShiftlock:FireServer(false)
	if not FindTool("Long Bat") then
		BuyItem("Long Bat")
	end
	BatRemote("Long Bat"):FireServer(FindTool("Long Bat"))
	TeleportToKill(plr)
  until plr.Character.Humanoid.Health == 0 or plr.Character:FindFirstChildWhichIsA("ForceField")
end

function KillAll()
	for i,v in pairs(game.Players:GetPlayers()) do
		if v.Character and not v.Character:FindFirstChildWhichIsA("ForceField") and v.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
		        if v ~= LocalPlayer and CheckFriends(v) then
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
		          if VPart and TPart and Targets ~= LocalPlayer and CheckFriends(Targets) then
			          if (TPart.Position-VPart.Position).Magnitude <= 35 then
				         Kill(Targets)
			          end
		          end
	           end
              end
	 end
	 local humanoid = LocalPlayer.Character.Humanoid
         if humanoid.Health <= 50 and States.AutoHeal then
	      HealPlayer()
	 end
	 if States.AutoSwing then
              BatRemote("Long Bat"):FireServer(FindTool())
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
		              if v ~= LocalPlayer and CheckFriends(v) then
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
	 if States.NimbusFlight then
	      AbilityNoCooldown("Nimbus Flight")
	 end
	 if States.Invisibility then
	      AbilityNoCooldown("Invisibility")
	 end
    end
    while task.wait() do
	pcall(task2)
    end
end)
local Window = Library:NewWindow("Wacky Bats")
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
Main:CreateDropdown("Select Ability", {"Tripmine Throw","Gubby Dash","Smash","Quick Kick","Blast","Strike","Play","Guard","Power Up","Harden","Ninja Dash","Rage","Lunge","Magnetize","Poison Cloud","Snack","Nimbus Flight","Invisibility"}, 1, function(v)
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
	elseif Ability == "Nimbus Flight" then
		States.NimbusFlight = v
	elseif Ability == "Invisibility" then
		States.Invisibility = v
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
