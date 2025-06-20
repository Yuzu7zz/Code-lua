-- FynixLib.lua
local FynixLib = {}
FynixLib.__index = FynixLib

function FynixLib:Create(titleText)
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer

	local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
	gui.Name = "FynixHubUI"
	gui.ResetOnSpawn = false

	local container = Instance.new("Frame", gui)
	container.Size = UDim2.new(0, 500, 0, 500)
	container.Position = UDim2.new(0.5, -250, 0.5, -250)
	container.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	container.Active = true
	container.Draggable = true
	Instance.new("UICorner", container).CornerRadius = UDim.new(0, 15)

	local menuFrame = Instance.new("Frame", container)
	menuFrame.Size = UDim2.new(0, 120, 1, 0)
	menuFrame.BackgroundTransparency = 1

	local title = Instance.new("TextLabel", menuFrame)
	title.Size = UDim2.new(1, 0, 0, 40)
	title.Text = titleText or "FYNIX HUB"
	title.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
	title.Font = Enum.Font.GothamBold
	title.TextSize = 14
	title.TextColor3 = Color3.fromRGB(90, 90, 90)
	Instance.new("UICorner", title).CornerRadius = UDim.new(0, 10)

	local contentArea = Instance.new("Frame", container)
	contentArea.Size = UDim2.new(1, -130, 1, -10)
	contentArea.Position = UDim2.new(0, 130, 0, 5)
	contentArea.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
	Instance.new("UICorner", contentArea).CornerRadius = UDim.new(0, 15)

	local tabButtons, contentFrames = {}, {}

	function FynixLib:AddTab(tabName)
		local i = #tabButtons
		local btn = Instance.new("TextButton", menuFrame)
		btn.Size = UDim2.new(1, -20, 0, 40)
		btn.Position = UDim2.new(0, 10, 0, 50 + i * 50)
		btn.Text = tabName
		btn.BackgroundColor3 = Color3.fromRGB(110, 90, 130)
		btn.TextColor3 = Color3.new(1,1,1)
		btn.Font = Enum.Font.GothamBold
		btn.TextSize = 14
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
		tabButtons[#tabButtons+1] = btn

		local frame = Instance.new("Frame", contentArea)
		frame.Size = UDim2.new(1, -20, 1, -20)
		frame.Position = UDim2.new(0, 10, 0, 10)
		frame.BackgroundTransparency = 1
		frame.Visible = #tabButtons == 1

		btn.MouseButton1Click:Connect(function()
			for _, f in pairs(contentFrames) do f.Visible = false end
			frame.Visible = true
		end)

		contentFrames[tabName] = frame

		local tabObject = {}

		function tabObject:AddLabel(text)
			local lbl = Instance.new("TextLabel", frame)
			lbl.Size = UDim2.new(1, 0, 0, 30)
			lbl.Text = text
			lbl.TextColor3 = Color3.fromRGB(50, 50, 50)
			lbl.BackgroundTransparency = 1
			lbl.Font = Enum.Font.Gotham
			lbl.TextSize = 14
		end

		function tabObject:AddButton(text, callback)
			local btn = Instance.new("TextButton", frame)
			btn.Size = UDim2.new(1, 0, 0, 35)
			btn.Text = text
			btn.Font = Enum.Font.GothamBold
			btn.TextSize = 14
			btn.TextColor3 = Color3.new(1, 1, 1)
			btn.BackgroundColor3 = Color3.fromRGB(120, 90, 150)
			Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
			btn.MouseButton1Click:Connect(callback)
		end

		function tabObject:AddToggle(text, default, callback)
			local tog = Instance.new("TextButton", frame)
			tog.Size = UDim2.new(1, 0, 0, 35)
			tog.Text = text .. ": " .. (default and "ON" or "OFF")
			tog.Font = Enum.Font.GothamBold
			tog.TextSize = 14
			tog.TextColor3 = Color3.new(1, 1, 1)
			tog.BackgroundColor3 = Color3.fromRGB(130, 90, 140)
			Instance.new("UICorner", tog).CornerRadius = UDim.new(0, 8)
			local state = default
			tog.MouseButton1Click:Connect(function()
				state = not state
				tog.Text = text .. ": " .. (state and "ON" or "OFF")
				callback(state)
			end)
		end

		function tabObject:AddBox(name, placeholder, callback)
			local box = Instance.new("TextBox", frame)
			box.Size = UDim2.new(1, 0, 0, 35)
			box.PlaceholderText = placeholder
			box.Text = ""
			box.TextColor3 = Color3.new(0,0,0)
			box.Font = Enum.Font.Gotham
			box.TextSize = 14
			box.BackgroundColor3 = Color3.fromRGB(230,230,230)
			Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)
			box.FocusLost:Connect(function()
				callback(box.Text)
			end)
		end

		return tabObject
	end

	function FynixLib:Toggle()
		gui.Enabled = not gui.Enabled
	end

	return FynixLib
end

return setmetatable({}, FynixLib)
