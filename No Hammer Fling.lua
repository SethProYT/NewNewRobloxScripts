local Obstacles = {
	workspace.Map.Obstacles.Hammer.Head,
	workspace.Map.Obstacles.Hammer.Handle,
}



for _, v in pairs(Obstacles:GetChildren()) do
	v.CanCollide = false
	v.CanQuery = false
	v.CanTouch = false
end