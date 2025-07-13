local Players = game:GetService("Players")
local Debris = game:GetService("Debris")
local StarterGui = game:GetService("StarterGui")
local lp = Players.LocalPlayer

-- Knockback Function (arah dominan ke atas, aman)
local function applyKnockback(target)
    local hrp = target:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    for _, v in pairs(hrp:GetChildren()) do  
        if v:IsA("BodyVelocity") or v:IsA("BodyGyro") or v:IsA("VectorForce") or v:IsA("AlignPosition") then  
            v:Destroy()  
        end  
    end  

    local arah = Vector3.new(math.random(-2, 2), math.random(8, 12), math.random(-2, 2)).Unit
    local kb = Instance.new("BodyVelocity")  
    kb.Velocity = arah * math.huge  -- Power inf
    kb.MaxForce = Vector3.new(math.huge, math.huge, math.huge)  
    kb.P = math.huge
    kb.Parent = hrp  
    Debris:AddItem(kb, math.huge)
end

--tool
local function modifySlapTool(tool)
    if tool:FindFirstChild("Power") then
        tool.Power.Value = math.huge
    end
    if tool:FindFirstChild("Cooldown") then
        tool.Cooldown.Value = 0
    end
    tool.Activated:Connect(function()
      if States.SlapPower then
          for _, plr in pairs(Players:GetPlayers()) do  
              if plr ~= lp and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then  
                  local dist = (plr.Character.HumanoidRootPart.Position - lp.Character.HumanoidRootPart.Position).Magnitude  
                  if dist <= 10 then  
                      applyKnockback(plr.Character)  
                  end  
              end  
          end
        end
      end)
end

-- Cari Tool Slap
local function getSlapTool()
    for _, tool in pairs(lp.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name:lower():find("slap") then
            return tool
        end
    end
    local char = lp.Character
    if char then
        for _, tool in pairs(char:GetChildren()) do
            if tool:IsA("Tool") and tool.Name:lower():find("slap") then
                return tool
            end
        end
    end
end

-- Auto ulang tiap respawn
local function setup()
    local char = lp.Character or lp.CharacterAdded:Wait()
    task.wait(2)  
    local tool = getSlapTool()  
    if tool then  
        modifySlapTool(tool)  
        print("Slap tool dimodifikasi ulang setelah respawn.")  
    end
end

-- Pertama kali jalan
setup()

-- Ulang saat respawn
lp.CharacterAdded:Connect(function()
    setup()
end)
