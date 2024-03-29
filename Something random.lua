local render = game:GetService("RunService")


render.RenderStepped:Connect(function()
    game.Workspace.CurrentCamera.FieldOfView = 120
end)

Lighting.ClockTime = 0