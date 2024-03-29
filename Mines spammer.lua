local Tab = {}

for i,v in next, workspace:GetDescendants() do
    if v:IsA'TouchTransmitter' then
        table.insert(Tab,v)
    end
end
local plr=game:GetService'Players'.LocalPlayer
spawn(function()
    local UIS=game:GetService'UserInputService'
    UIS.InputBegan:Connect(function(Key)
        if Key.KeyCode==Enum.KeyCode.J and not UIS:GetFocusedTextBox() then
            for i,v in next,Tab do
                if v:IsA'TouchTransmitter' then
                    print'Fired!'
                    if firetouchinterest then
                        firetouchinterest(plr.Character.HumanoidRootPart,v.Parent,0)
                        wait()
                        firetouchinterest(plr.Character.HumanoidRootPart,v.Parent,1)
                    end
                end
            end
        end
    end)
end)