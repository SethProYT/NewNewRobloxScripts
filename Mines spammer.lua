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