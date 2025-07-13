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
Frame.Size = UDim2.new(0, 252, 0, 126)
Frame.Active = true
Frame.Archivable = true
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.157534242, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 180, 0, 30)
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
TextBox.Size = UDim2.new(0, 180, 0, 30)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextScaled = true
TextBox.TextSize = 12.000
TextBox.TextWrapped = true
TextBox.ClearTextOnFocus = false
TextBox.PlaceholderText = "Dupe Amount"

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
TextButton.Position = UDim2.new(0.311643839, 0, 0.713450253, 0)
TextButton.Size = UDim2.new(0, 89, 0, 19)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Dupe"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 12.000
TextButton.TextWrapped = true

local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer
local Amount
local dupesDone = 0
local active = nil
local auto = nil
local cooldown = nil

function missing(t, f, fallback)
    if type(f) == t then return f end
    return fallback
end

replicatesignal = missing("function", replicatesignal)
sethidden =  missing("function", sethiddenproperty or set_hidden_property or set_hidden_prop)
gethidden =  missing("function", gethiddenproperty or get_hidden_property or get_hidden_prop)

local function teleportCharacter(cframe)
    local char = localPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = cframe
    else
    end
end

function Notif(Title, Text, Time)
  local Time = Time
  if not Time then
        Time = 3
  end
  game:GetService("StarterGui"):SetCore("SendNotification", {Title = Title, Text = Text, Duration = Time,})
end

TextButton.MouseButton1Click:Connect(function()
  if not active then
  active = true
  Amount = tonumber(TextBox.Text)
  auto = true
  while auto and wait() do
        if dupesDone >= Amount then
            dupesDone = 0
            Amount = 0
            active = false
            auto = false
            break
        end
        
        local plr = localPlayer
        local rcdEnabled, wasHidden = false, false
    if gethidden then
        rcdEnabled, wasHidden = gethidden(workspace, "RejectCharacterDeletions") ~= Enum.RejectCharacterDeletions.Disabled
    end

    if rcdEnabled and replicatesignal then
        replicatesignal(plr.ConnectDiedSignalBackend)
        task.wait(Players.RespawnTime - 0.5)
        for _, tool in pairs(localPlayer.Backpack:GetChildren()) do
            if tool:IsA("Tool") then
                tool.Parent = localPlayer.Character
            end
         end
        task.wait(.1)
        for _, tool in pairs(localPlayer.Character:GetChildren()) do
            if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
                if tool.Name == "BoomBox" then
                     tool.Parent = workspace
                end
            end
        end
        replicatesignal(plr.Kill)
    elseif rcdEnabled and not replicatesignal then
        Notif("Incompatible Exploit", "Your exploit does not support this command (missing replicatesignal)")
    else
        local char = plr.Character
        local hum = char:FindFirstChildWhichIsA("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Dead) end
        char:ClearAllChildren()
        local newChar = Instance.new("Model")
        newChar.Parent = workspace
        plr.Character = newChar
        task.wait()
        plr.Character = char
        newChar:Destroy()
        end
        task.wait(.1)
        
            
         localPlayer.CharacterAdded:Wait()
         task.wait(0.075)
            
         local newChar = localPlayer.Character or localPlayer.CharacterAdded:Wait()
         if newChar then
             for _, item in ipairs(workspace:GetChildren()) do
                 if item:IsA("BackpackItem") and item:FindFirstChild("Handle") then
                     pcall(function()
                         newChar.Humanoid:EquipTool(item)
                     end)
                 end
             end
         end
         dupesDone = dupesDone + 1
         task.wait(.1)
         Notif("Successfully", "Dupe: "..dupesDone)
    end
    elseif active then
         Notif("Error", "Script Active, wait a end", 5)
    end
end)
--Player not steal boombox
