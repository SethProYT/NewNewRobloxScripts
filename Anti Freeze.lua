local plr = game:GetService("Players").LocalPlayer
local char = plr.Character

for i,v in pairs(char:GetChildren()) do
    if v.ClassName == "Part" then
        v.Anchored = false
    end
end
