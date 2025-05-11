-- make by yuzu lnwza --







local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService('UserInputService')
local AimEnabled = false
local HighlightedTargets = {}
local DummyContainer = workspace:WaitForChild('Victim')

-- UI Setup
local ScreenGui = Instance.new('ScreenGui', game.CoreGui)
local Frame = Instance.new('Frame', ScreenGui)
Frame.Position = UDim2.new(0.05, 0, 0.2, 0)
Frame.Size = UDim2.new(0.15, 0, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 0

local ToggleButton = Instance.new('TextButton', Frame)
ToggleButton.Size = UDim2.new(1, 0, 0.5, 0)
ToggleButton.Text = 'Aimbot: OFF'
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ToggleButton.BorderSizePixel = 0
ToggleButton.MouseButton1Click:Connect(function()
    AimEnabled = not AimEnabled
    ToggleButton.Text = 'Aimbot: ' .. (AimEnabled and 'ON' or 'OFF')
end)

local ColorPicker = Instance.new('TextButton', Frame)
ColorPicker.Position = UDim2.new(0, 0, 0.6, 0)
ColorPicker.Size = UDim2.new(1, 0, 0.3, 0)
ColorPicker.Text = 'Change ESP Color'
ColorPicker.TextColor3 = Color3.new(1, 1, 1)
ColorPicker.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ColorPicker.BorderSizePixel = 0
ColorPicker.MouseButton1Click:Connect(function()
    local randomColor = Color3.fromHSV(math.random(), 1, 1)
    for _, highlight in pairs(HighlightedTargets) do
        highlight.FillColor = randomColor
    end
end)

local function highlightTarget(model)
    if not model:FindFirstChild('Head') or HighlightedTargets[model] then return end
    local highlight = Instance.new('Highlight')
    highlight.Parent = model
    highlight.FillColor = Color3.new(1, 0, 0)  -- Default red highlight
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0.2
    HighlightedTargets[model] = highlight
end

local function removeHighlight(model)
    if HighlightedTargets[model] then
        HighlightedTargets[model]:Destroy()
        HighlightedTargets[model] = nil
    end
end

local function getClosestTarget()
    local closestModel = nil
    local shortestDistance = math.huge
    
    for _, model in pairs(DummyContainer:GetChildren()) do
        if model:FindFirstChild('Head') then
            local headPosition = model.Head.Position
            local distance = (LocalPlayer.Character.Head.Position - headPosition).magnitude
            
            if distance < shortestDistance then
                closestModel = model
                shortestDistance = distance
            end
        end
    end
    if closestModel then
        highlightTarget(closestModel)
    end
    return closestModel
end

local function aimAt(target)
    if target and target:FindFirstChild('Head') then
        local head = target.Head
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
    end
end

RunService.RenderStepped:Connect(function()
    if AimEnabled then
        local closestModel = getClosestTarget()
        if closestModel then
            aimAt(closestModel)
        end
    else
        for model in pairs(HighlightedTargets) do
            removeHighlight(model)
        end
    end
end)
