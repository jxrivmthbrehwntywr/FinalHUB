--Just some easy access to things that I will probably use a lot
local player = game.Players.LocalPlayer

--Library stuff starts after this line
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local CurrentGame = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local Window = OrionLib:MakeWindow({Name = "Reality Hub - " .. CurrentGame, HidePremium = false, SaveConfig = true, IntroEnabled = false, ConfigFolder = "RealityHUB"})

--Just the notification that is sent if the script is executed without an ERR0R
OrionLib:MakeNotification({
	Name = "Reality Hub",
	Content = "Script Hub was executed successfully",
	Image = "rbxassetid://4483345998",
	Time = 3
})



local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddLabel("Farming Section")





Tab:AddToggle({
	Name = "AutoFarm Items",
	Default = false,
	Callback = function(Value)
		_G.AutoFarm = Value
	end    
})


local speed = 0.1
function everyItemFarm() 
	while true do wait(0.00000001)
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name:find("Block") and _G.AutoFarm then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.TouchTrigger.CFrame
					task.wait(speed)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.GroupBuildStructures.BlockTower.Trigger.CFrame + Vector3.new(0, 4, 0)
					task.wait(speed)
				end
			
				if v.Name:find("Food") and _G.AutoFarm then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.TouchTrigger.CFrame
					task.wait(speed)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.GroupBuildStructures.FoodCounter.Trigger.CFrame + Vector3.new(0, 4, 0)
					task.wait(speed)
				end
			
				if v.Name:find("Fuse") and _G.AutoFarm then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.TouchTrigger.CFrame
					task.wait(speed)
					game.Players.LocalPlayer.Character. HumanoidRootPart.CFrame = workspace.GroupBuildStructures.FuseBoard.Trigger.CFrame + Vector3.new(0, 4, 0)
					task.wait(speed)
				end
					
				if v.Name:find("Battery") and _G.AutoFarm then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.TouchTrigger.CFrame
					task.wait(speed)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.GroupBuildStructures.BatteryBox.Trigger.CFrame + Vector3.new(0, 4, 0)
					task.wait(speed)
				end
		end
	end	
end





Tab:AddLabel("Player Section")



Tab:AddSlider({
	Name = "WalkSpeed",
	Min = 1,
	Max = 100,
	Default = 60,
	Color = Color3.fromRGB(77,77,255),
	Increment = 1,
	ValueName = "amount",
	Callback = function(Value)
		_G.WalkSpeed = Value
	end    
})

Tab:AddButton({
	Name = "Set WalkSpeed",
	Callback = function()
      		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.WalkSpeed
  	end    
})

Tab:AddLabel("ESP Section")

Tab:AddButton({
	Name = "Player ESP",
	Callback = function()
      		playerESP()
  	end    
})

Tab:AddButton({
	Name = "Blue ESP",
	Callback = function()
      		blueESP()
  	end    
})

Tab:AddButton({
	Name = "Green ESP",
	Callback = function()
      		greenESP()
  	end    
})

Tab:AddButton({
	Name = "Orange ESP",
	Callback = function()
      		orangeESP()
  	end    
})


function playerESP()
	local players = game.Players:GetPlayers()
	for i,v in pairs(players) do
		if not v:FindFirstChild("Highlight") then
			local playerESP = Instance.new("Highlight", game:GetService("StarterGui"))
			
			playerESP.OutlineColor = Color3.fromRGB(255, 255, 255)
			playerESP.FillColor = Color3.fromRGB(255, 255, 255)
			playerESP.Parent = v.Character	
		end
	end
end

function blueESP()
	if not game:GetService("Workspace").Monsters.Blue:FindFirstChild("Highlight") and game:GetService("Workspace").Monsters.Blue then
		local blueESP = Instance.new("Highlight", game:GetService("StarterGui"))
			
		blueESP.OutlineColor = Color3.fromRGB(0, 166, 255)
		blueESP.FillColor = Color3.fromRGB(0, 166, 255)
		blueESP.Parent = game:GetService("Workspace").Monsters.Blue
	end
end


function greenESP()
	if not game:GetService("Workspace").Monsters.Green:FindFirstChild("Highlight") and game:GetService("Workspace").Monsters.Green then
		local greenESP = Instance.new("Highlight", game:GetService("StarterGui"))
		
		greenESP.OutlineColor = Color3.fromRGB(58, 226, 64)
		greenESP.FillColor = Color3.fromRGB(58, 226, 64)
		greenESP.Parent = game:GetService("Workspace").Monsters.Green
	end
end

function orangeESP()
	if not game:GetService("Workspace").Monsters.Orange:FindFirstChild("Highlight") and game:GetService("Workspace").Monsters.Orange then
		local orangeESP = Instance.new("Highlight", game:GetService("StarterGui"))
		
		orangeESP.OutlineColor = Color3.fromRGB(255, 100, 0)
		orangeESP.FillColor = Color3.fromRGB(255, 100, 0)
		orangeESP.Parent = game:GetService("Workspace").Monsters.Orange
	end
end

OrionLib:Init()

everyItemFarm()
