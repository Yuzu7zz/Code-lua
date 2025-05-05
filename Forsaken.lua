local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local replicatedStorage = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local character = player.Character

local Camera = workspace.CurrentCamera

local dragging = false
local Esp = false
local GuiSize = 0
local AutoFixNear = false 
local LastFixNear = 0
local FixGenTime = 40
local TextLabelUIStrokeOpzTv = nil
local vowps = "<b>Som</b>"
local PcOrMo = "Pc"
local dragStart = Vector2.new(0, 0)
local startPos = UDim2.new(0, 0, 0, 0)
local plrGui = player.PlayerGui

if UIS.TouchEnabled then
	PcOrMo = "Mo"
else
	PcOrMo = "Pc"
end
wait(0.01)
local function ResizeGui(Frame)
	local X = (0.1 * (GuiSize / 2)) + 0.4	
	local Y = (0.01 * (GuiSize / 2)) + 0.09
	if GuiSize < 0 then
		Y = (0.01 * (GuiSize)) + 0.09
	else
		Y = (0.01 * (GuiSize / 2)) + 0.09
	end

	local Scalgoal1 = {
		Size = UDim2.new(X, 0,Y, 0)
	}
	local ScaltweenInfo1 = TweenInfo.new(.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local Scaltween1 = TweenService:Create(Frame, ScaltweenInfo1, Scalgoal1)
	Scaltween1:Play()
	task.wait(.5)

	Frame.Size = UDim2.new(X, 0,Y, 0)
end
wait(0.01)
local ScreenGui = plrGui:FindFirstChild("MainUI")
local iclwd = "<b> V0.5</b>"
local espFolder = Instance.new("Folder", ScreenGui)
espFolder.Name = "ESP"
wait(0.01)
local Frame1 = Instance.new("Frame")
local UICornerFrame1 = Instance.new("UICorner")
Frame1.Parent = ScreenGui
Frame1.Position = UDim2.new(0.05, 0,0.05, 0)
Frame1.Size = UDim2.new(0.4, 0,0.09, 0)
Frame1.BackgroundColor3 = Color3.new(0.0823529, 0.0745098, 0.113725)
Frame1.ZIndex = 5
UICornerFrame1.Parent = Frame1
wait(0.01)
local TextLabel1 = Instance.new("TextLabel")
local TextLabelUIStroke = Instance.new("UIStroke")
TextLabel1.Parent = Frame1
TextLabel1.Position = UDim2.new(0.11, 0,0.07, 0)
TextLabel1.Size = UDim2.new(0.7, 0,0.9, 0)
TextLabel1.BackgroundTransparency = 1
TextLabel1.Font = Enum.Font.Highway
TextLabel1.TextScaled = true
TextLabel1.ZIndex = 3
TextLabel1.RichText = true
TextLabel1.TextXAlignment = Enum.TextXAlignment.Left
TextLabel1.Text = "<b>Somtank V2</b>"
TextLabel1.TextColor3 = Color3.new(0.45098, 0, 1)
TextLabelUIStroke.Parent = TextLabel1
TextLabelUIStrokeOpzTv = TextLabel1
TextLabelUIStroke.Thickness = 1.5
TextLabelUIStroke.Color = Color3.new(1, 1, 1)
TextLabel1.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Frame1.Position
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
		local delta = input.Position - dragStart
		Frame1.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		if input.UserInputType == Enum.UserInputType.Touch then
			Camera.CameraType = Enum.CameraType.Scriptable
		end
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
		Camera.CameraType = Enum.CameraType.Custom
	end
end)
wait(0.01)
local LoadFrame2 = Instance.new("Frame")
local ciwld = "<b>tank </b>"
local UICornerLoadFrame2 = Instance.new("UICorner")
LoadFrame2.Parent = Frame1
LoadFrame2.Position = UDim2.new(0, 0,0, 0)
LoadFrame2.Size = UDim2.new(1, 0,8.5, 0)
LoadFrame2.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
LoadFrame2.ZIndex = 10
UICornerLoadFrame2.Parent = LoadFrame2
TextLabelUIStrokeOpzTv.Text = vowps .. ciwld .. iclwd
wait(0.01)
local LoadTextLabel1 = Instance.new("TextLabel")
LoadTextLabel1.Parent = LoadFrame2
LoadTextLabel1.Position = UDim2.new(0.05, 0,.7, 0)
LoadTextLabel1.Size = UDim2.new(.9, 0,.2, 0)
LoadTextLabel1.BackgroundTransparency = 1
LoadTextLabel1.Font = Enum.Font.Highway
LoadTextLabel1.Text = "Forsaken Script"
LoadTextLabel1.TextScaled = true
LoadTextLabel1.TextColor3 = Color3.new(0.580392, 0.388235, 1)
LoadTextLabel1.ZIndex = 11
TextLabelUIStrokeOpzTv.Text = vowps .. ciwld .. iclwd
wait(0.01)
local ImageLabel1 = Instance.new("ImageLabel")
ImageLabel1.Image = "http://www.roblox.com/asset/?id=107788136016065"
ImageLabel1.Parent = LoadFrame2
ImageLabel1.Position = UDim2.new(.25, 0,.1, 0)
ImageLabel1.Size = UDim2.new(.5, 0,.6, 0)
ImageLabel1.BackgroundTransparency = 1
ImageLabel1.ZIndex = 11
ImageLabel1.ImageColor3 = Color3.new(0.45098, 0, 1)
wait(0.01)
local ImageLabel2 = Instance.new("ImageLabel")
ImageLabel2.Image = "http://www.roblox.com/asset/?id=139250627187737"
ImageLabel2.Parent = LoadFrame2
ImageLabel2.Position = UDim2.new(.25, 0,.1, 0)
ImageLabel2.Size = UDim2.new(.5, 0,0, 0)
ImageLabel2.BackgroundTransparency = 1
ImageLabel2.ZIndex = 11
wait(0.01)
local goal2 = {Size = UDim2.new(ImageLabel1.Size.X.Scale, ImageLabel1.Size.X.Offset, 0, 0)}
local goal3 = {Size = UDim2.new(.5, 0,.6, 0)}
local tweenInfo2 = TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
local tween2 = TweenService:Create(ImageLabel1, tweenInfo2, goal2)
local tween3 = TweenService:Create(ImageLabel2, tweenInfo2, goal3)
wait(0.01)
local IconHack1 = Instance.new("ImageLabel")
IconHack1.Parent = Frame1
IconHack1.Image = "http://www.roblox.com/asset/?id=107788136016065"
IconHack1.ImageColor3 = Color3.new(0.45098, 0, 1)
IconHack1.Position = UDim2.new(0, 0,0.05, 0)
IconHack1.Size = UDim2.new(0.1, 0,0.9, 0)
IconHack1.BackgroundTransparency = 1
IconHack1.ZIndex = 3
wait(0.01)
local Frame2 = Instance.new("Frame")
local UICornerFrame2 = Instance.new("UICorner")
Frame2.Parent = Frame1
Frame2.Position = UDim2.new(0, 0,0.5, 0)
Frame2.Size = UDim2.new(1, 0,8, 0)
Frame2.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
UICornerFrame2.Parent = Frame2
wait(0.01)
local Frame3 = Instance.new("Frame")
local UICornerFrame2 = Instance.new("UICorner")
Frame3.Parent = Frame2
Frame3.Position = UDim2.new(0, 0,0, 0)
Frame3.Size = UDim2.new(0.4, 0,1, 0)
Frame3.BackgroundColor3 = Color3.new(0.188235, 0.188235, 0.188235)
UICornerFrame2.Parent = Frame3
wait(0.01)
local FakeFrame1 = Instance.new("Frame")
local UICornerFakeFrame1 = Instance.new("UICorner")
FakeFrame1.Parent = Frame1
FakeFrame1.Position = UDim2.new(0, 0,0, 0)
FakeFrame1.Size = UDim2.new(1, 0,1, 0)
FakeFrame1.BackgroundColor3 = Color3.new(0.0823529, 0.0745098, 0.113725)
FakeFrame1.ZIndex = 2
UICornerFakeFrame1.Parent = FakeFrame1
wait(0.01)
local FrameContro1 = Instance.new("Frame")
local UICornerFrameContro1 = Instance.new("UICorner")
FrameContro1.Parent = Frame2
FrameContro1.Position = UDim2.new(.4, 0,0, 0)
FrameContro1.Size = UDim2.new(0.6, 0,1, 0)
FrameContro1.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
UICornerFrameContro1.Parent = FrameContro1
FrameContro1.Name = "FrameContro1"
wait(0.01)
local FrameContro2 = Instance.new("Frame")
local UICornerFrameContro2 = Instance.new("UICorner")
FrameContro2.Parent = Frame2
FrameContro2.Position = UDim2.new(.4, 0,0, 0)
FrameContro2.Size = UDim2.new(0.6, 0,1, 0)
FrameContro2.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
UICornerFrameContro2.Parent = FrameContro2
FrameContro2.Visible = false
FrameContro2.Name = "FrameContro2"
wait(0.01)
local FrameContro3 = Instance.new("Frame")
local UICornerFrameContro3 = Instance.new("UICorner")
FrameContro3.Parent = Frame2
FrameContro3.Position = UDim2.new(.4, 0,0, 0)
FrameContro3.Size = UDim2.new(0.6, 0,1, 0)
FrameContro3.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
UICornerFrameContro3.Parent = FrameContro3
FrameContro3.Visible = false
FrameContro3.Name = "FrameContro3"
wait(0.01)--------------------------------------------------------Start Button Add
local ButtonCon1 = Instance.new("TextButton")
local UICornerButtonCon1 = Instance.new("UICorner")
ButtonCon1.Parent = FrameContro1
ButtonCon1.Position = UDim2.new(0.06, 0,0.1, 0)
ButtonCon1.Size = UDim2.new(0.9, 0,0.1, 0)
ButtonCon1.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
ButtonCon1.Font = Enum.Font.Highway
ButtonCon1.TextScaled = true
ButtonCon1.RichText = true
ButtonCon1.Text = "<b> เปิดซ่อมอัตโนมัติ 🧑‍🔧️ </b>"
ButtonCon1.BorderSizePixel = 0
ButtonCon1.TextColor3 = Color3.new(1, 1, 1)
UICornerButtonCon1.Parent = ButtonCon1
ButtonCon1.Activated:Connect(function()
	if AutoFixNear == false then
		ButtonCon1.Text = "<b> ปิดซ่อมอัตโนมัติ 🧑‍🔧️ </b>"
		AutoFixNear = true
	else
		ButtonCon1.Text = "<b> เปิดซ่อมอัตโนมัติ 🧑‍🔧️ </b>"
		AutoFixNear = false
	end 
end)
wait(0.01)
local TextLabelButtonCon2 = Instance.new("TextLabel")
local ButtonCon2 = Instance.new("TextButton")
local DownButtonCon2 = Instance.new("TextButton")
local UICornerButtonCon2 = Instance.new("UICorner")
local UICornerDownButtonCon2 = Instance.new("UICorner")
ButtonCon2.Parent = FrameContro1
ButtonCon2.Position = UDim2.new(0.06, 0,0.87, 0)
ButtonCon2.Size = UDim2.new(0.4, 0,0.1, 0)
ButtonCon2.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
ButtonCon2.TextScaled = true
ButtonCon2.RichText = true
ButtonCon2.Text = "<b> เพิ่มขนาด + </b>"
ButtonCon2.BorderSizePixel = 0
ButtonCon2.TextColor3 = Color3.new(1, 1, 1)
UICornerButtonCon2.Parent = ButtonCon2
DownButtonCon2.Parent = ButtonCon2
DownButtonCon2.Position = UDim2.new(1.25, 0,0, 0)
DownButtonCon2.Size = UDim2.new(1, 0,1, 0)
DownButtonCon2.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
DownButtonCon2.TextScaled = true
DownButtonCon2.RichText = true
DownButtonCon2.Text = "<b> ลดขนาด - </b>"
DownButtonCon2.BorderSizePixel = 0
DownButtonCon2.TextColor3 = Color3.new(1, 1, 1)
UICornerDownButtonCon2.Parent = DownButtonCon2

TextLabelButtonCon2.Parent = ButtonCon2
TextLabelButtonCon2.Position = UDim2.new(0, 0,-1.2, 0)
TextLabelButtonCon2.Size = UDim2.new(1, 0,1, 0)
TextLabelButtonCon2.BackgroundTransparency = 1
TextLabelButtonCon2.TextScaled = true
TextLabelButtonCon2.RichText = true
TextLabelButtonCon2.Text = "<b> ขนาดหน้าต่าง </b>"
TextLabelButtonCon2.TextXAlignment = Enum.TextXAlignment.Left
TextLabelButtonCon2.TextColor3 = Color3.new(0.494118, 0.368627, 1)
DownButtonCon2.Activated:Connect(function()
	if GuiSize > -5 then
		GuiSize -= 1
		ResizeGui(Frame1)
	end
end)
ButtonCon2.Activated:Connect(function()
	if GuiSize < 7 then
		GuiSize += 1
		ResizeGui(Frame1)
	end
end)
wait(0.01)
local TextLabelButtonCon3 = Instance.new("TextLabel")
local MainLine3 = Instance.new("Frame")
local Line3 = Instance.new("Frame")
local LineButton3 = Instance.new("Frame")
local UICornerMainLine3 = Instance.new("UICorner")
local UICornerLineButton3 = Instance.new("UICorner")
local UICornerLine3 = Instance.new("UICorner")
MainLine3.Parent = FrameContro1
MainLine3.Position = UDim2.new(0.06, 0,0.33, 0)
MainLine3.Size = UDim2.new(0.85, 0,0.1, 0)
MainLine3.BackgroundColor3 = Color3.new(0.176471, 0.121569, 0.294118)
MainLine3.BorderSizePixel = 0
UICornerMainLine3.Parent = MainLine3
Line3.Parent = MainLine3
Line3.Position = UDim2.new(0, 0,0, 0)
Line3.Size = UDim2.new(1, 0,1, 0)
Line3.BackgroundColor3 = Color3.new(0.517647, 0.329412, 1)
Line3.BorderSizePixel = 0
UICornerLine3.Parent = Line3
LineButton3.Parent = MainLine3
LineButton3.Position = UDim2.new(0.9, 0,-0.1, 0)
LineButton3.Size = UDim2.new(0.1, 0,1.2, 0)
LineButton3.BackgroundColor3 = Color3.new(0.45098, 0, 1)
LineButton3.BorderSizePixel = 0
UICornerLineButton3.Parent = LineButton3
TextLabelButtonCon3.Parent = MainLine3
TextLabelButtonCon3.Position = UDim2.new(0, 0,-1.1, 0)
TextLabelButtonCon3.Size = UDim2.new(1, 0,1, 0)
TextLabelButtonCon3.BackgroundTransparency = 1
TextLabelButtonCon3.TextColor3 = Color3.new(0.501961, 0.4, 1)
TextLabelButtonCon3.Text = "<b> ความเร็วการซ่อม 8 วิ⚡ </b>"
TextLabelButtonCon3.TextXAlignment = Enum.TextXAlignment.Left
TextLabelButtonCon3.TextScaled = true
TextLabelButtonCon3.RichText = true
local Value3 = 8
local minValue = 0
local maxValue = 8
local function updateSlider3(inputX, fill, knob, valueLabel, slider, minValue, maxValue, Value3)
	local sliderSize = slider.AbsoluteSize.X
	local sliderPos = slider.AbsolutePosition.X
	local relativeX = math.clamp(inputX - sliderPos, 0, sliderSize)
	local percent = relativeX / sliderSize
	Value3 = minValue + (Value3 - minValue) * percent
	fill.Size = UDim2.new(percent, 0, 1, 0)
	knob.Position = UDim2.new(percent, -knob.AbsoluteSize.X / 2, 0.5, -knob.AbsoluteSize.Y / 2)
	valueLabel.Text = "<b> ความเร็วการซ่อม </b>" .. (math.floor(Value3 * 10) / 10) .. " วิ⚡ "
	FixGenTime = Value3
end
local function onInputBegan3(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		local moveConnection
		local releaseConnection
		moveConnection = UIS.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				updateSlider3(input.Position.X, Line3, LineButton3, TextLabelButtonCon3, MainLine3, minValue, maxValue, Value3)
				if input.UserInputType == Enum.UserInputType.Touch then
					Camera.CameraType = Enum.CameraType.Scriptable
				end
			end
		end)
		releaseConnection = UIS.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				moveConnection:Disconnect()
				releaseConnection:Disconnect()
				Camera.CameraType = Enum.CameraType.Custom
			end
		end)
	end
end
LineButton3.InputBegan:Connect(onInputBegan3)
wait(0.01)
local ButtonCon7 = Instance.new("TextButton")
local UICornerButtonCon7 = Instance.new("UICorner")
ButtonCon7.Parent = FrameContro3
ButtonCon7.Position = UDim2.new(0.06, 0,0.1, 0)
ButtonCon7.Size = UDim2.new(0.9, 0,0.1, 0)
ButtonCon7.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
ButtonCon7.Font = Enum.Font.Highway
ButtonCon7.TextScaled = true
ButtonCon7.RichText = true
ButtonCon7.Text = "<b> เปิดมองทะลุของต่างๆ 👁️ </b>"
ButtonCon7.BorderSizePixel = 0
ButtonCon7.TextColor3 = Color3.new(1, 1, 1)
UICornerButtonCon7.Parent = ButtonCon7
ButtonCon7.Activated:Connect(function()
	if Esp == false then
		Esp = true
		ButtonCon7.Text = "<b> ปิดมองทะลุของต่างๆ 👁️ </b>"
	else
		Esp = false
		ButtonCon7.Text = "<b> เปิดมองทะลุของต่างๆ 👁️ </b>"
		for _, Item138 in ipairs(espFolder:GetChildren()) do
			Item138.Visible = false
		end
	end	
end)
wait(0.01)
local Lighting8 = false
local ButtonCon8 = Instance.new("TextButton")
local UICornerButtonCon8 = Instance.new("UICorner")
ButtonCon8.Parent = FrameContro2
ButtonCon8.Position = UDim2.new(0.06, 0,0.1, 0)
ButtonCon8.Size = UDim2.new(0.9, 0,0.1, 0)
ButtonCon8.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
ButtonCon8.Font = Enum.Font.Highway
ButtonCon8.TextScaled = true
ButtonCon8.RichText = true
ButtonCon8.Text = "<b> เปิดลบหมอก ⛅ </b>"
ButtonCon8.BorderSizePixel = 0
ButtonCon8.TextColor3 = Color3.new(1, 1, 1)
UICornerButtonCon8.Parent = ButtonCon8
ButtonCon8.Activated:Connect(function()
	
	if Lighting8 == false then
		Lighting8 = true
		ButtonCon8.Text = "<b> ปิดลบหมอก ⛅ </b>"
	else
		Lighting8 = false
		ButtonCon8.Text = "<b> เปิดลบหมอก ⛅ </b>"
	end
		
end)

local Lighting9 = false
local ButtonCon9 = Instance.new("TextButton")
local UICornerButtonCon9 = Instance.new("UICorner")
ButtonCon9.Parent = FrameContro2
ButtonCon9.Position = UDim2.new(0.06, 0,0.25, 0)
ButtonCon9.Size = UDim2.new(0.9, 0,0.1, 0)
ButtonCon9.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
ButtonCon9.Font = Enum.Font.Highway
ButtonCon9.TextScaled = true
ButtonCon9.RichText = true
ButtonCon9.Text = "<b> เปิดเพิ่มแสง ☀️ </b>"
ButtonCon9.BorderSizePixel = 0
ButtonCon9.TextColor3 = Color3.new(1, 1, 1)
UICornerButtonCon9.Parent = ButtonCon9
ButtonCon9.Activated:Connect(function()
	
	if Lighting9 == false then
		Lighting9 = true
		ButtonCon9.Text = "<b> ปิดเพิ่มแสง ☀️ </b>"
	else
		Lighting9 = false
		ButtonCon9.Text = "<b> เปิดเพิ่มแสง ☀️ </b>"
	end
	
end)

wait(0.01)--------------------------------------------------------End Button Add
local ButtonMain1 = Instance.new("TextButton")
local UICornerButtonMain1 = Instance.new("UICorner")
ButtonMain1.Parent = Frame2
ButtonMain1.Position = UDim2.new(0.017, 0,0.1, 0)
ButtonMain1.Size = UDim2.new(0.37, 0,0.1, 0)
ButtonMain1.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
ButtonMain1.TextScaled = true
ButtonMain1.RichText = true
ButtonMain1.Text = "<b> หน้าหลัก 📱 </b>"
ButtonMain1.BorderSizePixel = 0
ButtonMain1.TextColor3 = Color3.new(1, 1, 1)
UICornerButtonMain1.Parent = ButtonMain1
wait(0.01)
local ButtonMain2 = Instance.new("TextButton")
local UICornerButtonMain2 = Instance.new("UICorner")
ButtonMain2.Parent = Frame2
ButtonMain2.Position = UDim2.new(0.017, 0,0.25, 0)
ButtonMain2.Size = UDim2.new(0.37, 0,0.1, 0)
ButtonMain2.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
ButtonMain2.TextScaled = true
ButtonMain2.RichText = true
ButtonMain2.Text = "<b> แสงเงา 💡 </b>"
ButtonMain2.BorderSizePixel = 0
ButtonMain2.TextColor3 = Color3.new(1, 1, 1)
UICornerButtonMain2.Parent = ButtonMain2
wait(0.01)
local ButtonMain3 = Instance.new("TextButton")
local UICornerButtonMain3 = Instance.new("UICorner")
ButtonMain3.Parent = Frame2
ButtonMain3.Position = UDim2.new(0.017, 0,0.4, 0)
ButtonMain3.Size = UDim2.new(0.37, 0,0.1, 0)
ButtonMain3.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
ButtonMain3.TextScaled = true
ButtonMain3.RichText = true
ButtonMain3.Text = "<b> [Esp] มองทะลุ 👁️ </b>"
ButtonMain3.BorderSizePixel = 0
ButtonMain3.TextColor3 = Color3.new(1, 1, 1)
UICornerButtonMain3.Parent = ButtonMain3
wait(0.01)
local Close = Instance.new("TextButton")
local UICornerClose = Instance.new("UICorner")
Close.Parent = Frame1
Close.Position = UDim2.new(0.91, 0,0.17, 0)
Close.Size = UDim2.new(0.08, 0,0.65, 0)
Close.BackgroundColor3 = Color3.new(1, 0.129412, 0.129412)
Close.Font = Enum.Font.Highway
Close.Text = "X"
Close.TextScaled = true
Close.ZIndex = 3
Close.TextColor3 = Color3.new(1, 1, 1)
UICornerClose.Parent = Close
Close.Activated:Connect(function()
	Close.Interactable = false
	local Bye = Instance.new("Sound")
	Bye.Parent = game.SoundService
	Bye.SoundId = "rbxassetid://154157386"
	Bye:Play()
	task.wait(1)
	Bye:Destroy()
	Frame1:Destroy()
	espFolder:Destroy()
end)
wait(0.01)
local CloseEye = Instance.new("TextButton")
local UICornerCloseEye = Instance.new("UICorner")
CloseEye.Parent = Frame1
CloseEye.Position = UDim2.new(0.8, 0,0.17, 0)
CloseEye.Size = UDim2.new(0.08, 0,0.65, 0)
CloseEye.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
CloseEye.Font = Enum.Font.Highway
CloseEye.Text = "-"
CloseEye.TextScaled = true
CloseEye.ZIndex = 3
CloseEye.TextColor3 = Color3.new(1, 1, 1)
UICornerCloseEye.Parent = CloseEye
CloseEye.Activated:Connect(function()
	if Frame2.Visible == true then		
		Frame2.Visible = false
		CloseEye.Text = "+"
		TextLabel1.ZIndex = -1
		local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
		local goal1 = {Size = UDim2.new(0.1, 0,0.09, 0)}
		local goal2 = {Position = UDim2.new(0.4, 0,0.17, 0),
			Size = UDim2.new(0.25, 0,0.65, 0)}
		local goal3 = {Position = UDim2.new(0.7, 0,0.17, 0),
			Size = UDim2.new(0.25, 0,0.65, 0)}
		local goal4 = {Position = UDim2.new(0, 0,0.05, 0),
			Size = UDim2.new(0.4, 0,0.9, 0)}
		local tween1 = TweenService:Create(Frame1, tweenInfo, goal1)
		local tween2 = TweenService:Create(CloseEye, tweenInfo, goal2)
		local tween3 = TweenService:Create(Close, tweenInfo, goal3)
		local tween4 = TweenService:Create(IconHack1, tweenInfo, goal4)
		tween1:Play()
		tween2:Play()
		tween3:Play()
		tween4:Play()
	else
		Frame2.Visible = true
		CloseEye.Text = "-"
		TextLabel1.ZIndex = 3
		local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
		local goal1 = {Size = UDim2.new(0.4, 0,0.09, 0)}
		local goal2 = {Position = UDim2.new(0.8, 0,0.17, 0),
			Size = UDim2.new(0.08, 0,0.65, 0)}
		loc
