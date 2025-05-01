local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Kyntho hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "||Home"
})

local teleportCashCrate = false
local teleportMap20 = false

Tab:AddToggle({
    Name = "Teleport CashCrate",
    Default = false,
    Callback = function(value)
        teleportCashCrate = value

        while teleportCashCrate do
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = character:WaitForChild("HumanoidRootPart")
            local targetPart = workspace:WaitForChild("CashCrate"):WaitForChild("MainPart")

            if targetPart and targetPart:IsA("BasePart") then
                hrp.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
            end
            wait(1)
        end
    end    
})

Tab:AddToggle({
    Name = "Teleport Money",
    Default = false,
    Callback = function(value)
        teleportMap20 = value

        while teleportMap20 do
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = character:WaitForChild("HumanoidRootPart")

            local mapChildren = workspace:WaitForChild("Map"):GetChildren()
            local target = mapChildren[20]

            if target and target:IsA("BasePart") then
                hrp.CFrame = target.CFrame + Vector3.new(0, 5, 0)
            end

            wait(1)
        end
    end
})
