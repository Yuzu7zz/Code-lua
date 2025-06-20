local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- GUI Container
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "MobileUI"
gui.ResetOnSpawn = false

local container = Instance.new("Frame", gui)
container.Size = UDim2.new(0, 400, 0, 350)
container.Position = UDim2.new(0.5, -200, 0.5, -175)
container.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
container.Active = true
container.Draggable = true
Instance.new("UICorner", container).CornerRadius = UDim.new(0, 15)

-- Menu Sidebar
local menuFrame = Instance.new("ScrollingFrame", container)
menuFrame.Size = UDim2.new(0, 120, 1, 0)
menuFrame.CanvasSize = UDim2.new(0, 0, 0, 400)
menuFrame.ScrollBarThickness = 5
menuFrame.ScrollingDirection = Enum.ScrollingDirection.Y
menuFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
menuFrame.BackgroundTransparency = 1
menuFrame.ClipsDescendants = true

local menuLayout = Instance.new("UIListLayout", menuFrame)
menuLayout.Padding = UDim.new(0, 10)
menuLayout.SortOrder = Enum.SortOrder.LayoutOrder
menuLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Content Area
local contentArea = Instance.new("Frame", container)
contentArea.Size = UDim2.new(1, -130, 1, -20)
contentArea.Position = UDim2.new(0, 130, 0, 10)
contentArea.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
Instance.new("UICorner", contentArea).CornerRadius = UDim.new(0, 15)

-- Title
local title = Instance.new("TextLabel", menuFrame)
title.Size = UDim2.new(1, -20, 0, 40)
title.Text = "FYNIX HUB "
title.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(50, 50, 50)
title.LayoutOrder = 0
Instance.new("UICorner", title).CornerRadius = UDim.new(0, 10)

-- Tab System
local tabNames = {"Main", "Aimbot", "Player", "Misc", "Setting"}
local contentFrames = {}

local function switchTab(name)
	for _, f in pairs(contentFrames) do
		f.Visible = false
	end
	if contentFrames[name] then
		contentFrames[name].Visible = true
	end
end

for i, tabName in ipairs(tabNames) do
	local btn = Instance.new("TextButton", menuFrame)
	btn.Size = UDim2.new(1, -20, 0, 45)
	btn.Text = tabName
	btn.BackgroundColor3 = Color3.fromRGB(130, 100, 180)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	btn.LayoutOrder = i
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)

	local frame = Instance.new("Frame", contentArea)
	frame.Size = UDim2.new(1, -20, 1, -20)
	frame.Position = UDim2.new(0, 10, 0, 10)
	frame.BackgroundTransparency = 1
	frame.Visible = i == 1

	-- 🔹 Example label in tab
	local label = Instance.new("TextLabel", frame)
	label.Size = UDim2.new(1, 0, 0, 30)
	label.Text = "Menu: " .. tabName
	label.Font = Enum.Font.Gotham
	label.TextSize = 14
	label.TextColor3 = Color3.fromRGB(50, 50, 50)
	label.BackgroundTransparency = 1

	contentFrames[tabName] = frame

	btn.MouseButton1Click:Connect(function()
		switchTab(tabName)
	end)
end

-- Resize Handle (bottom right)
local resizeHandle = Instance.new("Frame", container)
resizeHandle.Size = UDim2.new(0, 20, 0, 20)
resizeHandle.Position = UDim2.new(1, -20, 1, -20)
resizeHandle.AnchorPoint = Vector2.new(1, 1)
resizeHandle.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
resizeHandle.BorderSizePixel = 0
resizeHandle.Name = "ResizeHandle"
resizeHandle.ZIndex = 10
Instance.new("UICorner", resizeHandle).CornerRadius = UDim.new(0, 4)

-- Resize System (no dragging UI)
local dragging = false
local inputStart, startSize

resizeHandle.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		inputStart = input.Position
		startSize = container.Size
		container.Active = false -- 🚫 Disable drag while resizing
	end
end)

resizeHandle.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
		container.Active = true -- ✅ Re-enable drag after resize
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - inputStart
		local newX = math.clamp(startSize.X.Offset + delta.X, 250, 800)
		local newY = math.clamp(startSize.Y.Offset + delta.Y, 250, 800)
		container.Size = UDim2.new(0, newX, 0, newY)
	end
end)

-- ปุ่มเปิด/ปิด UI
local toggleButton = Instance.new("TextButton", gui)
toggleButton.Size = UDim2.new(0, 120, 0, 35)
toggleButton.Position = UDim2.new(0, 10, 0, 10) -- มุมซ้ายบน
toggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
toggleButton.Text = "FyNIX HUB"
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 14
toggleButton.ZIndex = 20
Instance.new("UICorner", toggleButton).CornerRadius = UDim.new(0, 10)

-- Toggle Logic
local isVisible = true
toggleButton.MouseButton1Click:Connect(function()
	isVisible = not isVisible
	container.Visible = isVisible
end)
