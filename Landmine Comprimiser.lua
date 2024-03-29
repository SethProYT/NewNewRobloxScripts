local mines = game:GetService("Workspace").Map.Obstacles.Minefield.Mines


while wait() do
    for i,v in pairs(mines:GetDescendants()) do
        if v.Name == "Base" and "Button" then
            v.Transparency = 0
        end
    end
end

