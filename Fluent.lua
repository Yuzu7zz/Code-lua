local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fluent " .. Fluent.Version,
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "sword" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

Window:SelectTab(1)

local toggleGui = Instance.new("ScreenGui", game.CoreGui)
toggleGui.Name = "ToggleUI"
toggleGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 60, 0, 60)
frame.Position = UDim2.new(0, 20, 0.5, -30)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = toggleGui

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(1, 0)

local imageButton = Instance.new("ImageButton", frame)
imageButton.Size = UDim2.new(1, 0, 1, 0)
imageButton.BackgroundTransparency = 1
imageButton.Image = "rbxassetid://73303647486659"

local isVisible = true
imageButton.MouseButton1Click:Connect(function()
	isVisible = not isVisible
	if isVisible then
		Window:Unminimize()
	else
		Window:Minimize()
	end
end)

local dragging, dragInput, dragStart, startPos

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
end)

Tabs.Main:AddToggle("MyToggle", {
    Title = "Toggle",
    Description = "Toggle description",
    Default = false,
    Callback = function(state)
        print(state and "Toggle On" or "Toggle Off")
    end
})
