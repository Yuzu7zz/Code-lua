local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local autoRepairEnabled = false
local espEnabled = false

-- สร้างหน้าต่างหลัก
local Window = Rayfield:CreateWindow({
    Name = "Forsaken | Utility Hub",
    LoadingTitle = "Forsaken Script",
    LoadingSubtitle = "by YourName",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ForsakenConfig",
        FileName = "AutoRepairAndESP"
    }
})

local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateToggle({
    Name = "Auto Repair Generator",
    CurrentValue = false,
    Flag = "AutoRepair",
    Callback = function(Value)
        autoRepairEnabled = Value
        if Value then
            task.spawn(function()
                while autoRepairEnabled do
                    for _, gen in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                        if gen.Name:lower():find("generator") then
                            local progress = gen:FindFirstChild("Progress")
                            local prompt = gen:FindFirstChildWhichIsA("ProximityPrompt", true)
                            if progress and prompt and progress.Value < 100 and prompt.Enabled then
                                fireproximityprompt(prompt)
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end,
})

MainTab:CreateToggle({
    Name = "ESP for Generators",
    CurrentValue = false,
    Flag = "ESPGenerators",
    Callback = function(Value)
        espEnabled = Value
        if Value then
            for _, gen in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                if gen.Name:lower():find("generator") then
                    if not gen:FindFirstChild("ESP") then
                        local part = gen:FindFirstChildWhichIsA("BasePart") or gen
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "ESP"
                        billboard.Adornee = part
                        billboard.Size = UDim2.new(0, 100, 0, 20)
                        billboard.AlwaysOnTop = true

                        local label = Instance.new("TextLabel", billboard)
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.BackgroundTransparency = 1
                        label.Text = "Generator"
                        label.TextColor3 = Color3.fromRGB(0, 255, 0)
                        label.TextStrokeTransparency = 0
                        label.TextScaled = true
                        label.Font = Enum.Font.GothamBold

                        billboard.Parent = part
                    end
                end
            end
        else
            
            for _, gen in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                local esp = gen:FindFirstChild("ESP")
                if esp then
                    esp:Destroy()
                end
            end
        end
    end,
})
