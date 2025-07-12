-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = true

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
Frame.Position = UDim2.new(0.0799492374, 0, 0.483815432, 0)
Frame.Size = UDim2.new(0, 292, 0, 171)
Frame.Active = true
Frame.Archivable = true
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.157534242, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Free Boombox Dupe"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeTransparency = 0.000
TextLabel.TextWrapped = true

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.157534242, 0, 0.350877196, 0)
TextBox.Size = UDim2.new(0, 200, 0, 50)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true
TextBox.ClearTextOnFocus = false
TextBox.PlaceholderText = "Dupe Amount"

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
TextButton.Position = UDim2.new(0.311643839, 0, 0.713450253, 0)
TextButton.Size = UDim2.new(0, 109, 0, 39)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Dupe"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer
local dropLocation = workspace:GetChildren()[134]
local dupesDone = 0

local function teleportCharacter(cframe)
    local char = localPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = cframe
    else
    end
end

local function getDropCFrame()
    if dropLocation:IsA("BasePart") then
        return dropLocation.CFrame
    elseif dropLocation:IsA("Model") and dropLocation.PrimaryPart then
        return dropLocation.PrimaryPart.CFrame
    end
    return CFrame.new(0, 5, 0)
end

local function grabAllTools()
    local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
        for _, child in ipairs(workspace:GetChildren()) do
            if child:IsA("BackpackItem") and child:FindFirstChild("Handle") then
                pcall(function()
                    humanoid:EquipTool(child)
                end)
            end
        end
    end
end

TextButton.MouseButton1Click:Connect(function()
  local Amount = tonumber(TextBox.Text)
  for i = 1,Amount do
        if dupesDone >= Amount then
            grabAllTools()
            dupesDone = 0
            Amount = 0
            break
        end

        teleportCharacter(getDropCFrame())
        task.wait(.2)
            
        for _, tool in pairs(localPlayer.Backpack:GetChildren()) do
            if tool:IsA("Tool") then
                tool.Parent = localPlayer.Character
            end
         end
            
        task.wait(0.1)
            
        for _, tool in pairs(localPlayer.Character:GetChildren()) do
            if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
                if tool.Name == "BoomBox" then
                     tool.Parent = workspace
                     tool.Handle.CFrame = getDropCFrame()
                else
                     tool.Parent = workspace
                end
            end
         end
            
         local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Humanoid")
         if humanoid then
             humanoid.Health = 0
         end
            
         localPlayer.CharacterAdded:Wait()
         task.wait(0.1)
            
         local newChar = localPlayer.Character
         local newHumanoid = newChar and newChar:FindFirstChildWhichIsA("Humanoid")
         if newHumanoid then
             for _, item in ipairs(workspace:GetChildren()) do
                 if item:IsA("BackpackItem") and item:FindFirstChild("Handle") then
                     pcall(function()
                         newHumanoid:EquipTool(item)
                     end)
                 end
             end
         end
            
         dupesDone = dupesDone + 1     
         task.wait(0.1)
    end
end)
