local function AutoTeleport(State)
        local Player = game:GetService("Players").LocalPlayer
local function getNearest()
local nearest, dist = nil, 99999
for _,v in pairs(game.Workspace["Zombie Storage"]:GetChildren()) do
if(v:FindFirstChild("Head")~=nil)then
local m =(Player.Character.Head.Position-v.Head.Position).magnitude
if(m<dist)then
dist = m
nearest = v
end
end
end
return nearest
end
_G.Teleport2 = State
_G.globalTarget = nil
game:GetService("RunService").RenderStepped:Connect(function()
if(_G.Teleport2==true)then
local target = getNearest()
if(target~=nil)then
if game.Players.LocalPlayer.Character.Humanoid.Sit then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame * CFrame.new(0, 18, 13)
_G.globalTarget = target
end
end
end)
while _G.Teleport2 and wait() do
        Player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        Player.Character.Head.Velocity = Vector3.new(0, 0, 0)
end
end

AutoTeleport(true)

local args = {
	{
		LaserProperties = {
			{
				Enum.Material.Plastic,
				BrickColor.new(1009),
				vector.create(-0.6674520969390869, -0.10617812722921371, -0.7370439767837524),
				CFrame.new(305.8381652832031, 27.8975772857666, 2560.307373046875, 0.7412427067756653, -0.07127004116773605, 0.667442798614502, -0, 0.9943472146987915, 0.10617714375257492, -0.6712371110916138, -0.07870303094387054, 0.7370526194572449),
				vector.create(304.4671936035156, 27.67948341369629, 2558.79345703125),
				90,
				true,
				vector.create(0.17781010270118713, 0.4664074778556824, 0.8665146231651306)
			}
		},
		RealTool = game:GetService("Players").LocalPlayer.Character:WaitForChild("Pistol"),
		Tool = game:GetService("Players").LocalPlayer.Character:WaitForChild("Pistol"),
		HumanoidTables = {
			{
				HeadHits = 0,
				THumanoid = workspace:WaitForChild("Zombie Storage"):WaitForChild("Sapphire Brute"):WaitForChild("Humanoid"),
				BodyHits = 1
			}
		}
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WeaponEvent"):FireServer(unpack(args))
