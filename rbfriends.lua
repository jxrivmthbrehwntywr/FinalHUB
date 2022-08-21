--Just some easy access to things that I will probably use a lot
local player = game.Players.LocalPlayer

--Library stuff starts after this line
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local CurrentGame = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

repeat wait() until game:isLoaded()

local Window = OrionLib:MakeWindow({Name = "Reality Hub - " .. CurrentGame, HidePremium = false, SaveConfig = true, IntroEnabled = false, ConfigFolder = "RealityHUB"})


--Just the notification that is sent if the script is executed without an ERR0R
OrionLib:MakeNotification({
	Name = "Reality Hub",
	Content = "Script Hub was executed successfully",
	Image = "rbxassetid://4483345998",
	Time = 3
})


local Farming = Window:MakeTab({
	Name = "Farming",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Farming:AddLabel("Farming Section")


Farming:AddToggle({
	Name = "AutoFarm Items",
	Default = false,
	Callback = function(Value)
		_G.AutoFarm = Value
	end    
})

Farming:AddToggle({
	Name = "Auto Place Blocks",
	Default = false,
	Callback = function(Value)
		_G.autoPlace = Value
	end    
})

local speed = 0.001

function autoPlace()
	while _G.autoPlace == true do wait(0.00001)
		if workspace.GroupBuildStructures.BlockTower then
			firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.BlockTower.Trigger, 0)
			task.wait(speed)
			firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.BlockTower.Trigger, 1)
			task.wait(speed)
		end
		if workspace.GroupBuildStructures.FoodCounter then
			firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.FoodCounter.Trigger, 0)
			task.wait(speed)
			firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.FoodCounter.Trigger, 1)
			task.wait(speed)
		end
		if workspace.GroupBuildStructures.FuseBoard then
			firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.FuseBoard.Trigger, 0)
			task.wait(speed)
			firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.FuseBoard.Trigger, 1)
			task.wait(speed)
		end
		if workspace.GroupBuildStructures.BatteryBox then
			firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.BatteryBox.Trigger, 0)
			task.wait(speed)
			firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.BatteryBox.Trigger, 1)
			task.wait(speed)	
		end
	end
end


Farming:AddButton({
	Name = "TP to end of game",
	Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-399.289794921875, 18.798019409179688, 645.77490234375)
  	end    
})



local root = player.Character.HumanoidRootPart

function everyItemFarm() 
	while true do wait(0.00000001)
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name:find("Block") and _G.AutoFarm then
					firetouchinterest(player.Character.Head, v.TouchTrigger, 0)
					task.wait(speed)
					firetouchinterest(player.Character.Head, v.TouchTrigger, 1)
					task.wait(speed)
					firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.BlockTower.Trigger, 0)
					task.wait(speed)
					firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.BlockTower.Trigger, 1)
					task.wait(speed)
				end
			
				if v.Name:find("Food") and _G.AutoFarm then
					firetouchinterest(player.Character.Head, v.TouchTrigger, 0)
					task.wait(speed)
					firetouchinterest(player.Character.Head, v.TouchTrigger, 1)
					task.wait(speed)
					firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.FoodCounter.Trigger, 0)
					task.wait(speed)
					firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.FoodCounter.Trigger, 1)
					task.wait(speed)
				end
			
				if v.Name:find("Fuse") and _G.AutoFarm then
					firetouchinterest(player.Character.Head, v.TouchTrigger, 0)
					task.wait(speed)
					firetouchinterest(player.Character.Head, v.TouchTrigger, 1)
					task.wait(speed)
					firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.FuseBoard.Trigger, 0)
					task.wait(speed)
					firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.FuseBoard.Trigger, 1)
					task.wait(speed)
				end
					
				if v.Name:find("Battery") and _G.AutoFarm then
					firetouchinterest(player.Character.Head, v.TouchTrigger, 0)
					task.wait(speed)
					firetouchinterest(player.Character.Head, v.TouchTrigger, 1)
					task.wait(speed)
					firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.BatteryBox.Trigger, 0)
					task.wait(speed)
					firetouchinterest(player.Character.Head, workspace.GroupBuildStructures.BatteryBox.Trigger, 1)
					task.wait(speed)
				end
		end
	end	
end


local Player = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Player:AddLabel("Player Section")



Player:AddSlider({
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

Player:AddButton({
	Name = "Set WalkSpeed",
	Callback = function()
      		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.WalkSpeed
  	end    
})

Player:AddToggle({
	Name = "Noclip",
	Callback = function(Value)
			_G.Noclip = Value
	end
})

function noclip()
	game:GetService("RunService").Stepped:Connect(function()
		for i,v in pairs(player.Character:GetDescendants()) do
			if v:IsA("BasePart") and _G.Noclip then
				v.CanCollide = false
			end
		end
	end)
end

local Visuals = Window:MakeTab({
	Name = "Visuals",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Visuals:AddLabel("ESP Section")

Visuals:AddButton({
	Name = "Player ESP",
	Callback = function()
      		playerESP()
  	end    
})

Visuals:AddButton({
	Name = "Blue ESP",
	Callback = function()
      		blueESP()
  	end    
})

Visuals:AddButton({
	Name = "Green ESP",
	Callback = function()
      		greenESP()
  	end    
})

Visuals:AddButton({
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

noclip()
everyItemFarm()
