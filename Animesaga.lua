local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local targetFolder = workspace:WaitForChild("Enemy"):WaitForChild("Mob")
local healthThreshold = 0.3
local attacking = false

local function getNearestMob()
    local nearestMob = nil
    local closestDistance = math.huge
    for _, mob in pairs(targetFolder:GetChildren()) do
        if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") then
            local distance = (rootPart.Position - mob.HumanoidRootPart.Position).magnitude
            if distance < closestDistance then
                nearestMob = mob
                closestDistance = distance
            end
        end
    end
    return nearestMob
end

while true do
    task.wait(0.1)
    local currentHealth = humanoid.Health / humanoid.MaxHealth
    if currentHealth <= healthThreshold then
        attacking = false
        print("Health too low! Stopping attack.")
        continue
    end
    
    local target = getNearestMob()
    if target and not attacking then
        attacking = true
        print("Attacking:", target.Name)
        rootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position)
        task.wait(0.5)
        attacking = false
    end
end
