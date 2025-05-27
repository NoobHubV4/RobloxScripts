local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/Arceus%20X%20V3%20Lib.lua"))()
local AutoParry = false
local range = 15
local Cooldown = false
local GotoBall = false

lib:SetTitle("Blade Soccer")
lib:SetTitleColor(0, 0, 255)

local toggleBtn
toggleBtn = lib:AddToggle("Auto Parry Distance: "..range, function(v)
      AutoParry = v
end, false)

lib:AddButton("Distance +", function()
      range = range + 0.25
      toggleBtn:FindFirstChild("Name").Text = "Auto Parry Distance: "..range
end)

lib:AddButton("Distance -", function()
      if range > 1 then
          range = range - 0.25
          toggleBtn:FindFirstChild("Name").Text = "Auto Parry Distance: "..range
      end
end)

lib:AddToggle("Goto The Ball", function(v)
      GotoBall = v
end, false)

game.RunService.Stepped:Connect(function()
   if AutoParry then
       for _,v in pairs(workspace:GetDescendants()) do
            if v.Name == "Ball" and v:IsA("Part") then
                  if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= range and not Cooldown then
                         Cooldown = true
                         game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, false)
                         if GotoBall then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                         end
                         task.wait(.8)
                         for i = 1,2 do
                         Cooldown = false
                         end
                  end
            end
       end
   end
end)

lib:SetTheme("Default")
lib:SetIcon("rbxassetid://99482688387044")
