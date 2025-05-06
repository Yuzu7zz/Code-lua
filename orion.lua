local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "SeNa 🌸", HidePremium = false,IntroText = "Sena hub" SaveConfig = true, ConfigFolder = "OrionTest"})

local Player = Window:MakeTab({
	Name = "Character",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Player:AddTextbox({
	Name = "Speed",
	Default = "16",
	TextDisappear = true,
	Callback = function(Value)
		local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
		if humanoid then
			humanoid.WalkSpeed = tonumber(Value) or 16
		end
	end	  
})
