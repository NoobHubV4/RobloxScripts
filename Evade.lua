local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/Wizard%20Lib.lua'))()
local Window = Library:NewWindow("Evade")
local Rstorage = game.ReplicatedStorage
local Players = game.Players
local plr = Players.LocalPlayer
local Main = Window:NewSection("Main")
local enabled = false
local hudVisible = true
local sentOnce = false

local connection
local sharedConnection
local hudAddedConnection

local function disconnectAll()
    if connection then
        connection:Disconnect()
        connection = nil
    end
    if sharedConnection then
        sharedConnection:Disconnect()
        sharedConnection = nil
    end
    if hudAddedConnection then
        hudAddedConnection:Disconnect()
        hudAddedConnection = nil
    end
end

local function setupHUDListener(hud)
    if not hud then return end
    hudVisible = hud.Visible
    sentOnce = false

    if connection then
        connection:Disconnect()
        connection = nil
    end

    connection = hud:GetPropertyChangedSignal("Visible"):Connect(function()
        if enabled then
            if hud.Visible == false and hudVisible == true and not sentOnce then
                sentOnce = true
                Rstorage.Events.Player.ChangePlayerMode:FireServer(true)
            elseif hud.Visible == true then
                sentOnce = false
            end
            hudVisible = hud.Visible
        end
    end)
end

local function listenToShared(shared)
    if not shared then return end

    local hud = shared:FindFirstChild("HUD")
    if hud then
        setupHUDListener(hud)
    end

    if hudAddedConnection then
        hudAddedConnection:Disconnect()
        hudAddedConnection = nil
    end
    hudAddedConnection = shared.ChildAdded:Connect(function(child)
        if enabled and child.Name == "HUD" then
            setupHUDListener(child)
        end
    end)
end

local function listenToPlayerGui()
    local playerGui = plr:FindFirstChild("PlayerGui")
    if not playerGui then return end

    local shared = playerGui:FindFirstChild("Shared")
    if shared then
        listenToShared(shared)
    end

    if sharedConnection then
        sharedConnection:Disconnect()
        sharedConnection = nil
    end
    sharedConnection = playerGui.ChildAdded:Connect(function(child)
        if enabled and child.Name == "Shared" then
            listenToShared(child)
        end
    end)
end
Main:CreateButton("Respawn", function()
     Rstorage.Events.Player.ChangePlayerMode:FireServer(true)
end)
Main:CreateToggle("Auto Respawn", function(value)
     enabled = value
     if value == true then
          listenToPlayerGui()
     elseif not value then
          disconnectAll()
     end
end)
