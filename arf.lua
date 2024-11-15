-- initializers
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Advanced Ragdoll Fighting GUI", "DarkTheme")
local Blatant = Window:NewTab("Blatant")
local Legit = Window:NewTab("Legit")
local Fun = Window:NewTab("Fun")
local ClientSide = Window:NewTab("Client Side")
local HBE = Window:NewTab("Hitbox")
local BlatantSection = Blatant:NewSection("Blatant")
local LegitSection = Legit:NewSection("Legit")
local ClientSideSection = ClientSide:NewSection("Client Side")
local FunSection = Fun:NewSection("Fun")
local HBSection = HBE:NewSection("Hitbox")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local hb = true
local thefov = 120
local fovv = false
local stopFOV = false
local killauratoggle = false
local size
local hit_head
local hit_torso
local touchended 

-- optimize settings
ReplicatedStorage.Settings.CameraShake.Value = false
ReplicatedStorage.Settings.CameraFollowsHead.Value = false
ReplicatedStorage.Settings.ScreenEffects.Value = false
ReplicatedStorage.Settings.Gibs.Value = true
ReplicatedStorage.Settings.Blood.Value = true
ReplicatedStorage.Settings.Shadows.Value = false


local function HitboxExpander() 
    local LocalPlayer = game.Players.LocalPlayer
    if hb == true then 
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character then
                local head = v.Character:FindFirstChild("Head")
                local humanoidRootPart = v.Character:FindFirstChild("HumanoidRootPart")
                
                if head and hit_head then
                    head.Transparency = 0.5
                    head.CanCollide = false
                    head.Size = size
                end
                
                if humanoidRootPart and hit_torso then
                    humanoidRootPart.Transparency = 0.5  
                    humanoidRootPart.CanCollide = false
                    humanoidRootPart.Size = size
                end
            end
        end
    else
        return
    end
end

local function spam_landmines()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SethProYT/NewNewRobloxScripts/refs/heads/main/Mines%20spammer.lua"))()
end

local function show_landmines() 
    local mines = game:GetService("Workspace").Map.Obstacles.Minefield.Mines

    while wait() do
        for i,v in pairs(mines:GetDescendants()) do
            if v.Name == "Base" and "Button" then
                v.Transparency = 0
            end
        end
    end
end

local function grabsoda()
    local soda_location = workspace.Map.Buildings.Shop.VendingMachine.att.ProximityPrompt
    local Character = game.Players.LocalPlayer.Character
    local LocalPlayer = game.Players.LocalPlayer
    local lastplrlocation = Character.HumanoidRootPart.CFrame.Position
    local lastcampos = game:GetService("Workspace").CurrentCamera.CFrame.Position

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(219.191772, 4.17729282, -208.28801, 0.0169080757, 3.34219585e-08, -0.999857068, -4.17683843e-08, 1, 3.27204148e-08, 0.999857068, 4.1209173e-08, 0.0169080757)
    game:GetService("Workspace").CurrentCamera.CFrame = CFrame.new(211.488846, 6.48912764, -208.205566, 0.0116090048, 0.157975465, -0.987374783, -1.16415322e-10, 0.987441361, 0.157986104, 0.999932647, -0.00183406135, 0.0114632109)
    soda_location.HoldDuration = 0

    repeat fireproximityprompt(soda_location, 5) wait() until LocalPlayer.Backpack:FindFirstChild("Soda")

    Character.HumanoidRootPart.CFrame = CFrame.new(lastplrlocation)
    game:GetService("Workspace").CurrentCamera.CFrame = CFrame.new(lastcampos)

    lastplrlocation = nil
    lastcampos = nil
end

local function teleportPlayer(coordinates)
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local Character = game.Players.LocalPlayer.Character
    local tween = TweenService:Create(
        Character.HumanoidRootPart, 
        tweenInfo, 
        {CFrame = CFrame.new(coordinates)}
    )

    tween:Play()
end

local function makePlayerRainbow()
    local LocalPlayer = game.Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return end

    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end

    local connection
    connection = RunService.Heartbeat:Connect(function(deltaTime)
        local hue = (tick() * 0.1) % 1
        local color = Color3.fromHSV(hue, 1, 1)
        
        for _, part in ipairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Color = color
            end
        end
    end)

    character.AncestryChanged:Connect(function(_, parent)
        if not parent then
            connection:Disconnect()
        end
    end)
end

local function changeMaterial() 
    for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.ForceField
        end
    end
end

local function stopFOVChange()
    stopFOV = true
    if fovConnection then
        fovConnection:Disconnect()
        fovConnection = nil
    end
end

local function fov() 
    local Cam = game.Workspace.CurrentCamera
    local Character = game.Players.LocalPlayer.Character
    stopFOV = false
    
    fovConnection = game:GetService("RunService").RenderStepped:Connect(function()
        if stopFOV then
            fovConnection:Disconnect()
            fovConnection = nil
            return
        end

        if Character.Humanoid.Health <= 0 then
            stopFOV = true
        end

        if fovv then
            Cam.FieldOfView = thefov
        end
    end)
end

local function csgomode()
    local Lightning = game:GetService("Lighting")

    for _, v in pairs(Lightning:GetChildren()) do
        if v ~= nil then
            continue
            else if v == nil then
                break
            end
        end
        v:Destroy()
    end
    
    Lightning.Technology = "Compatibility"
    Lightning.Brightness = 0.1
    Lightning.ClockTime = 0
    Lightning.GlobalShadows = false

    for i, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Part") or v:IsA("BasePart") then
            v.Material = "Plastic"
        end
    end

    while wait() do
        local ticktick = (tick() * 0.1) % 5
        local color = Color3.fromHSV(ticktick, 1, 1)
        Lightning.Ambient = color
    end    
end

local function NOCOOLDOWNGRAB() 
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name == "ProximityPrompt" then
            v.HoldDuration = 0
        end
    end
end

local function killaura()
    if killauratoggle then return end

    local LocalPlayer = game:GetService("Players").LocalPlayer
    local Character = LocalPlayer.Character
    local Part = Instance.new("Part")
    local Weld = Instance.new("Weld")
    local Players = game:GetService("Players")

    Part.Parent = Character.HumanoidRootPart
    Part.Size = Vector3.new(7,7,7)
    Part.Transparency = 0.5
    Part.CFrame = Character.HumanoidRootPart.CFrame
    Part.Anchored = false
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = true
    Part.Massless = true
    Part.CollisionGroup = "HumanoidRootPart"
    Part.EnableFluidForces = false

    Weld.Part0 = Part
    Weld.Part1 = Character.HumanoidRootPart
    Weld.Parent = Part


    Part.Touched:Connect(function(touch)
        local touchparent = touch.Parent
        local mainplr = game:GetService("Players").LocalPlayer.Character
        local player = Players:GetPlayerFromCharacter(touchparent)

        
        if mainplr == touchparent then return end
        if player == nil then return end
        if touchparent == nil then return end

        if touchparent:FindFirstChild("HumanoidRootPart") and touchparent ~= nil and touchparent then
            
            repeat
                game:GetService("Players").LocalPlayer.Character.Crowbar.Events.Attack:FireServer()
                wait(0.1)
                game:GetService("Players").LocalPlayer.Character.Crowbar.Events.Hit:InvokeServer(
                    player.Character:FindFirstChild("Humanoid"),
                    player.Character:FindFirstChild("Head")
                )
                wait()
            until touchended

            touchended = false
        else
            return
        end    
    end)

    Part.TouchEnded:Connect(function(touch)
        local plr = Players:GetPlayerFromCharacter(touch.Parent)
        if plr.Character:FindFirstChild("Humanoid") then
            touchended = true
        end
    end)
end

local function antiragdoll()
    local old_namecall
    local remote = game:GetService("ReplicatedStorage").Remotes.Ragdoll

    old_namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        if not checkcaller() and self == remote and getnamecallmethod():lower() == "fireserver" then
            return false
        end
        return old_namecall(self, ...)
    end))
end


HBSection:NewToggle("Hit head (for hitbox expander)", "this enables the ability to always hit head (ragdoll hits)", function(state)
    if state then
        hit_head = true
    else
        hit_head = false
    end
end)

HBSection:NewButton("HB expander", "increase hitbox size", function()
    HitboxExpander()
end)

HBSection:NewSlider("HB Size", "Changes the hitbox size", 10, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    size = Vector3.new(s, s, s)
end)

HBSection:NewToggle("Hit torso", "this enables the ability to always hit the torso", function(state)
    if state then
        hit_torso = true
    else
        hit_torso = false
    end
end)


BlatantSection:NewButton("Grab Soda", "grab the soda from the vending machine", function()
    grabsoda()
end)


BlatantSection:NewButton("Anti Ragdoll", "Semi anti ragdoll (dont get shot by the grenade launchers)", function()
    antiragdoll()
end)

BlatantSection:NewButton("KillAura", "self explainatory", function()
    killaura()
    killauratoggle = true
end)

-- 205.41488647460938, 3.7984275817871094, -200.4371337890625 shop coords
-- 302.3089904785156, 1013.99853515625, -54.178001403808594 tower coords

BlatantSection:NewDropdown("Teleports", "Teleport with PVP on", {"Shop", "Tower", "Free Fall"}, function(currentOption)
    if currentOption == "Shop" then
        teleportPlayer(Vector3.new(205.41488647460938, 3.7984275817871094, -200.4371337890625))
    elseif currentOption == "Tower" then
        teleportPlayer(Vector3.new(302.3089904785156, 1013.99853515625, -54.178001403808594))
    elseif currentOption == "Free Fall" then
        teleportPlayer(Vector3.new(43, 2981, -40))
    end
end)

BlatantSection:NewToggle("Spinbot", "spin your character", function(state)
    local Character = game.Players.LocalPlayer.Character
    if state then
        Character.HumanoidRootPart:FindFirstChild("redbull")
        local Spin = Instance.new("BodyAngularVelocity")
        Spin.Name = "redbull"
        Spin.Parent = Character.HumanoidRootPart
        Spin.MaxTorque = Vector3.new(0, math.huge, 0)
        Spin.AngularVelocity = Vector3.new(0,50,0)
    else
        Character.HumanoidRootPart:FindFirstChild("redbull"):Destroy()
    end
end)


FunSection:NewButton("Spam Landmines (unstable!)", "spam landmines", function()
    spam_landmines()
end)

FunSection:NewButton("Show Landmines", "show landmines", function()
    show_landmines()
end)

LegitSection:NewButton("Set all proximity to 0", "instant grab weapons and soda", function()
    NOCOOLDOWNGRAB()
end)

ClientSideSection:NewButton("Change material", "Change character material", function()
    changeMaterial()
end)

ClientSideSection:NewButton("csgo mode.", "Changes Lightning Heavily", function()
    csgomode()
end)

ClientSideSection:NewToggle("120 FOV", "Increase FOV", function(state)
    if state then
        fovv = true
        fov()
    else
        fovv = false
        stopFOVChange()
    end
end)

ClientSideSection:NewToggle("Fake PVP", "makes you able to hit but not dmg", function(state)
        game.Players.LocalPlayer.Values.Pvp.Value = state
end)

ClientSideSection:NewToggle("Rainbow Player", "Makes your character cycle through rainbow colors", function(state)
    local LocalPlayer = game.Players.LocalPlayer
    if state then
        makePlayerRainbow()
    else
        if LocalPlayer.Character then
            for _, part in ipairs(LocalPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Color = Color3.new(1, 1, 1)
                end
            end
        end
    end
end)



Players.PlayerAdded:Connect(function(plr)
    HitboxExpander()
end)

while wait() do
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Ragdoll"):FireServer(false)
end


while wait(60) do
    if hb == true then
        HitboxExpander()
    else
        return "nothing"
    end
end

game.Players.LocalPlayer.Character.HumanoidRootPart.Humanoid.Died:Connect(function() 
    game.Players.LocalPlayer.Character.HumanoidRootPart.Humanoid["redbull"]:Destroy()
    killauratoggle = false
    stopFOVChange()
end)

