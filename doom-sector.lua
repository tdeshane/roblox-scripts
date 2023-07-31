--get humanoid for Doom Sector
local character = script.Parent
character.Humanoid.WalkSpeed = 1



--delete parts from character in loop
for _,part in pairs(character:GetChildren()) do
    part:destroy()
end

--add new part to character
HumanoidRootPart = Instance.new("Part")
HumanoidRootPart.Parent = character
character.HumanoidRootPart.Name = "HumanoidRootPart"
character.HumanoidRootPart.Size = Vector3.new(2, 2, 2)
character.HumanoidRootPart.BrickColor = BrickColor.new("Green")  -- Adjust the color of the body
character.HumanoidRootPart.Position = Vector3.new(0, 0, 0)



-- get the humanoid root part
local rootPart = character:WaitForChild("HumanoidRootPart", 1)

-- shoot shapes from the humanoid root part
local ball = Instance.new("Part")
ball.Shape = Enum.PartType.Ball
ball.Name = "Ball"
ball.Size = Vector3.new(2, 2, 2)
ball.BrickColor = BrickColor.new("Really black")  -- Adjust the color of the body
ball.Position = rootPart.Position
ball.Parent = character


-- define the function to execute when the ball collides with the player
local function onTouch(otherPart)
    local humanoid = otherPart.Parent:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:TakeDamage(10)
    end
end

-- shoot the ball using function
function shootBall()


    local ball = Instance.new("Part")
    ball.Shape = Enum.PartType.Ball
    ball.Name = "Ball"
    ball.Size = Vector3.new(2, 2, 2)
    ball.BrickColor = BrickColor.new("Really black")  -- Adjust the color of the body
    ball.Position = rootPart.Position
    ball.Parent = character

    ball.Touched:Connect(onTouch)

    ball.Position = rootPart.Position
    -- calculate direction based on postion of player character
    -- get players
    local players = game.Players:GetPlayers()
    -- get first player
    local player = players[1]
    rootPart = player.Character:WaitForChild("HumanoidRootPart", 1)
    -- get direction
    local direction = (rootPart.Position - ball.Position).unit
    -- shoot the ball
    speed = 50

    ball.Velocity = direction * speed


    --cause damage to the player when the ball hits them
    -- get collision event


-- connect the onTouch function to the Touched event of the ball
ball.Touched:Connect(onTouch)


    --destroy ball after 5 seconds
    wait(5)
    ball:Destroy()
    
end

-- function to make the ball explode
function explodeBall()
 

    local ball = Instance.new("Part")
    ball.Parent = character

    -- change ball into explosion like fire or bomb
    ball.Shape = Enum.PartType.Ball
    ball.Name = "Explosion"
    ball.Size = Vector3.new(2, 2, 2)
    ball.BrickColor = BrickColor.new("Really red")  -- Adjust the color of the body
    ball.Position = rootPart.Position
    ball.Parent = character

    local direction = (rootPart.Position - ball.Position).unit
    -- shoot the ball
    speed = 25

    ball.Velocity = direction * speed

    --destroy ball after 5 seconds
    wait(5)
    ball:Destroy()



end

-- shoot the ball every 2 seconds
wait(5)
while true do
    wait(5)
    shootBall()
    explodeBall()
end
