--get ai character called GOLDEN BOSS
local character = script.Parent

-- get the humanoid root part
local rootPart = character:WaitForChild("HumanoidRootPart", 1)

-- shoot a golden ball from the humanoid root part
local ball = Instance.new("Part")
ball.Shape = Enum.PartType.Ball
ball.Name = "Ball"
ball.Size = Vector3.new(2, 2, 2)
ball.BrickColor = BrickColor.new("Gold")  -- Adjust the color of the body
ball.Position = rootPart.Position
ball.Parent = character

-- shoot the ball using function
function shootBall()
    ball.Position = rootPart.Position
    --ball.Velocity = rootPart.CFrame.lookVector * -1
end

-- shoot the ball every 2 seconds
while true do
    wait(2)
    shootBall()
end
