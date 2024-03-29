local mines = game:GetService("Workspace").Map.Obstacles.Minefield.Mines
local toggle = game:GetService("UserInputService")
local yesorno = true



while wait() do
    if not yesorno == true then return end
    for i,v in pairs(mines:GetDescendants()) do
        if v.Name == "Base" and "Button" then
            v.Transparency = 0
        end
    end
end

while wait() do
    toggle.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.L then
            if yesorno == false then
                yesorno = true
            elseif yesorno == true then
                yesorno = false
            end
        end
    end)
end