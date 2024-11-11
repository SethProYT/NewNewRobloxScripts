-- initializers
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Advanced Ragdoll Fighting GUI", "DarkTheme")
local Blatant = Window:NewTab("Blatant")
local Legit = Window:NewTab("Legit")
local Fun = Window:NewTab("Fun")

local BlatantSection = Blatant:NewSection("Blatant")
local LegitSection = Legit:NewSection("Legit")
local FunSection = Fun:NewSection("Fun")

-- variables (jetbrains nerd font is the best btw)
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character
local size
local hb = true
local hit_head
local hit_torso

-- functions

-- both legit and blatant depending on the options
local function HitboxExpander() 
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
        print("Hitbox expander is off")
    end
end

------------------------------------------------------------------------------------------------------------------

-- fun functions
local function spam_landmines()
    local plr = game.Players.LocalPlayer
    local mines = workspace.Map.Obstacles.Minefield.Mines

    while wait() do
        for _, v in pairs(mines:GetDescendants()) do
            if v.ClassName == "TouchTransmitter" then
                firetouchinterest(plr.Character.HumanoidRootPart,v.Parent,0)
                wait(0.4)
                firetouchinterest(plr.Character.HumanoidRootPart,v.Parent,1)
            end
        end
    end
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

------------------------------------------------------------------------------------------------------------------
-- blatant
local function grabsoda()
    local soda_location = workspace.Map.Buildings.Shop.VendingMachine.att.ProximityPrompt
    local lastplrlocation = Character.HumanoidRootPart.CFrame
    local lastcampos = game:GetService("Workspace").CurrentCamera.CFrame

    -- teleport to soda machine
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(219.191772, 4.17729282, -208.28801, 0.0169080757, 3.34219585e-08, -0.999857068, -4.17683843e-08, 1, 3.27204148e-08, 0.999857068, 4.1209173e-08, 0.0169080757)
    -- also set camera to correct position
    game:GetService("Workspace").CurrentCamera.CFrame = CFrame.new(211.488846, 6.48912764, -208.205566, 0.0116090048, 0.157975465, -0.987374783, -1.16415322e-10, 0.987441361, 0.157986104, 0.999932647, -0.00183406135, 0.0114632109)
    -- set soda timer to 0
    soda_location.HoldDuration = 0

    -- grab and wait until the soda exists
    repeat fireproximityprompt(soda_location, 5) until LocalPlayer.Backpack:FindFirstChild("Soda")

    -- teleport back
    Character.HumanoidRootPart.CFrame = Vector3.new(lastplrlocation)
    -- also set cam back
    game:GetService("Workspace").CurrentCamera.CFrame = Vector3.new(lastcampos)
end
------------------------------------------------------------------------------------------------------------------
-- buttons and etc

-- local Legit = Window:NewTab("Legit")
-- local Fun = Window:NewTab("Fun")

-- local BlatantSection = Blatant:NewSection("Blatant")
-- local LegitSection = Legit:NewSection("Legit")
-- local FunSection = Fun:NewSection("Fun")


-- blatant

BlatantSection:NewButton("Grab Soda", "grab the soda from the vending machine", function()
    grabsoda()
end)

BlatantSection:NewToggle("Hit head (for hitbox expander)", "this enables the ability to always hit head (ragdoll hits)", function(state)
    if state then
        hit_head = true
    else
        hit_head = false
    end
end)

-- fun

FunSection:NewButton("Spam Landmines", "spam landmines", function()
    spam_landmines()
end)

FunSection:NewButton("Show Landmines", "show landmines", function()
    show_landmines()
end)


-- legit
LegitSection:NewButton("HB expander", "increase hitbox size", function()
    HitboxExpander()
end)

LegitSection:NewToggle("Hit torso", "this enables the ability to always hit the torso", function(state)
    if state then
        hit_torso = true
    else
        hit_torso = false
    end
end)