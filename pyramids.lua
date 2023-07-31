-- Import service references
local workspace = game:GetService("Workspace")
local players = game:GetService("Players")
local debrisService = game:GetService("Debris")

-- Parameters
local pyramidHeight = 10
local partSize = Vector3.new(1, 1, 1)
local ballSize = Vector3.new(1, 1, 1)
local offset = 15
local damage = 100 -- Damage to player by the ball explosion


-- Function to create and drop a ball
function dropBall(pyramidPosition, targetPosition)
	print("Attempting to drop a ball...") -- Debug print

	local ball = Instance.new("Part", workspace)
	ball.Name = "Ball"
	ball.Size = ballSize
	ball.Shape = Enum.PartType.Ball
	ball.Material = Enum.Material.Neon
	ball.BrickColor = BrickColor.new("Bright red")
	ball.Position = pyramidPosition + Vector3.new(0, pyramidHeight + 1, 0)
	ball.CanCollide = true
	ball.Anchored = false

	print("Ball created at position: ".. tostring(ball.Position)) -- Debug print

	-- Add BodyVelocity to make the ball move
	local bodyVelocity = Instance.new("BodyVelocity", ball)
	bodyVelocity.Velocity = (targetPosition - ball.Position).Unit * 30 -- Decreased the velocity for slower movement

	-- When the ball touches anything, create an explosion
	ball.Touched:Connect(function(hit)
		wait(1) -- Wait for 1 second before reacting to the hit
		-- Check if it hits a player
		local humanoid = hit.Parent:FindFirstChild("Humanoid")
		if humanoid then
			humanoid:TakeDamage(damage) -- Decrease player health
		end

		-- Create explosion
		local explosion = Instance.new("Explosion")
		explosion.Position = ball.Position
		explosion.BlastRadius = 5
		explosion.BlastPressure = 100000
		explosion.DestroyJointRadiusPercent = 0
		explosion.Parent = workspace

		print("Ball exploded at position: ".. tostring(explosion.Position)) -- Debug print

		ball:Destroy()
	end)

	-- Clean up the ball after some time
	debrisService:AddItem(ball, 10)
end




-- Function to create and place pyramids
function placePyramids(player)
	print("Placing pyramids...") -- Debug print

	-- Define pyramid positions around the player
	local pyramidPositions = {
		Vector3.new(offset, 0, 0),
		Vector3.new(-offset, 0, 0),
		Vector3.new(0, 0, offset),
		Vector3.new(0, 0, -offset),
		Vector3.new(offset, 0, offset)
	}

	-- Create and place pyramids
	for _, position in ipairs(pyramidPositions) do
		local pyramidParts = createPyramid(pyramidHeight, player.Character.HumanoidRootPart.Position + position)
		weldParts(pyramidParts) -- Weld the parts together

		-- Drop a ball from each pyramid
		dropBall(player.Character.HumanoidRootPart.Position + position, player.Character.HumanoidRootPart.Position)
	end
end



-- Basic pyramid
local pyramidHeight = 10 -- Change this to the desired height of the pyramid
local partSize = Vector3.new(1, 1, 1) -- Change this to adjust the size of the pyramid's parts
local offset = 15 -- Distance from the player to the pyramids



-- Function to create a part
function createPart(size, position)
	local part = Instance.new("Part") -- Create a new part
	part.Size = size -- Set the size of the part
	part.Position = position -- Set the position of the part
	part.BrickColor = BrickColor.new("Bright yellow") -- Set the brick color
	part.Anchored = true -- To prevent parts from falling due to gravity
	part.Parent = workspace -- Set the part's parent to the workspace
	return part
end

-- Function to create a layer of the pyramid
function createPyramidLayer(height, baseSize, spawnLocation)
	local layerParts = {} -- Store all the parts in this layer
	for x = -baseSize, baseSize do
		for z = -baseSize, baseSize do
			if math.abs(x) + math.abs(z) <= baseSize then -- This condition ensures the pyramid shape
				local part = createPart(partSize, spawnLocation + Vector3.new(x, height, z))
				table.insert(layerParts, part)
			end
		end
	end
	return layerParts -- Return all parts created in this layer
end

-- Function to create the entire pyramid
function createPyramid(height, spawnLocation)
	local allParts = {} -- To store all parts of the pyramid
	for h = 1, height do
		local layerParts = createPyramidLayer(h, height - h, spawnLocation)
		for _, part in ipairs(layerParts) do
			table.insert(allParts, part)
		end
	end
	return allParts -- Return all parts of the pyramid
end

-- Function to weld parts together
function weldParts(parts)
	for i = 2, #parts do -- Start from the second part
		local weld = Instance.new("WeldConstraint") -- Create a new weld
		weld.Part0 = parts[1] -- The first part will be the main part
		weld.Part1 = parts[i] -- Attach each other part to the main part
		weld.Parent = parts[1] -- Set the weld's parent to be the main part
	end
end



-- Function to clear old pyramids
function clearOldPyramids()
	for _, item in ipairs(workspace:GetChildren()) do
		if item:IsA("Part") and item.BrickColor == BrickColor.new("Bright yellow") then
			item:Destroy()
		end
	end
end

players.PlayerAdded:Connect(function(player)
	print("Player added: " .. player.Name) -- Debug print
	player.CharacterAdded:Connect(function(character)
		print("Character added for player: " .. player.Name) -- Debug print
		wait(2) -- Wait for 2 seconds
		-- Continuously update pyramids' position
		while wait(5) do -- Increase the wait time to 5 seconds
			clearOldPyramids() -- Clear old pyramids
			placePyramids(player) -- Create new pyramids
		end
	end)
end)



