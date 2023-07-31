--create a cicada in roblox
local partSize = Vector3.new(2, 4, 2)  -- Adjust the size of the bug's body parts

-- Create the bug's body parts
--create a head as a sphere or ball
local head = Instance.new("Part")
head.Shape = Enum.PartType.Ball
head.Size = Vector3.new(2, 2, 2)
head.Name = "Head"
head.Size = partSize
head.BrickColor = BrickColor.new("Medium stone grey")  -- Adjust the color of the body
head.Position = Vector3.new(0, 10, 0)
head.Parent = workspace

local thorax = Instance.new("Part")
--shape the thorax as a cube
thorax.Shape = Enum.PartType.Block

thorax.Name = "Thorax"
thorax.Size = partSize
thorax.BrickColor = BrickColor.new("Medium stone grey")  -- Adjust the color of the body
thorax.Position = Vector3.new(0, 8, 0)
thorax.Parent = workspace

local abdomen = Instance.new("Part")
abdomen.Name = "Abdomen"
abdomen.Size = partSize
abdomen.BrickColor = BrickColor.new("Medium stone grey")  -- Adjust the color of the body
abdomen.Position = Vector3.new(0, 6, 0)
abdomen.Parent = workspace

local leftWing = Instance.new("Part")
leftWing.Name = "LeftWing"
leftWing.Size = partSize
leftWing.BrickColor = BrickColor.new("Medium stone grey")  -- Adjust the color of the body
leftWing.Position = Vector3.new(0, 4, 0)
leftWing.Parent = workspace

local rightWing = Instance.new("Part")
rightWing.Name = "RightWing"
rightWing.Size = partSize
rightWing.BrickColor = BrickColor.new("Medium stone grey")  -- Adjust the color of the body
rightWing.Position = Vector3.new(0, 4, 0)
rightWing.Parent = workspace

local leftLeg = Instance.new("Part")
leftLeg.Name = "LeftLeg"
leftLeg.Size = partSize
leftLeg.BrickColor = BrickColor.new("Medium stone grey")  -- Adjust the color of the body
leftLeg.Position = Vector3.new(0, 2, 0)
leftLeg.Parent = workspace

local rightLeg = Instance.new("Part")
rightLeg.Name = "RightLeg"
rightLeg.Size = partSize
rightLeg.BrickColor = BrickColor.new("Medium stone grey")  -- Adjust the color of the body
rightLeg.Position = Vector3.new(0, 2, 0)
rightLeg.Parent = workspace

local leftAntenna = Instance.new("Part")
leftAntenna.Name = "LeftAntenna"
leftAntenna.Size = partSize
leftAntenna.BrickColor = BrickColor.new("Medium stone grey")  -- Adjust the color of the body
leftAntenna.Position = Vector3.new(0, 0, 0)
leftAntenna.Parent = workspace

local rightAntenna = Instance.new("Part")
rightAntenna.Name = "RightAntenna"
rightAntenna.Size = partSize
rightAntenna.BrickColor = BrickColor.new("Medium stone grey")  -- Adjust the color of the body
rightAntenna.Position = Vector3.new(0, 0, 0)
rightAntenna.Parent = workspace

-- Create the bug's body connections
local headWeld = Instance.new("Weld")
headWeld.Part0 = head
headWeld.Part1 = thorax
headWeld.C0 = CFrame.new(0, 0, 0)
headWeld.C1 = CFrame.new(0, 2, 0)
headWeld.Parent = head

local thoraxWeld = Instance.new("Weld")
thoraxWeld.Part0 = thorax
thoraxWeld.Part1 = abdomen
thoraxWeld.C0 = CFrame.new(0, 0, 0)
thoraxWeld.C1 = CFrame.new(0, 2, 0)
thoraxWeld.Parent = thorax

local abdomenWeld = Instance.new("Weld")
abdomenWeld.Part0 = abdomen
abdomenWeld.Part1 = leftWing
abdomenWeld.C0 = CFrame.new(0, 0, 0)
abdomenWeld.C1 = CFrame.new(0, 2, 0)
abdomenWeld.Parent = abdomen

local leftWingWeld = Instance.new("Weld")
leftWingWeld.Part0 = leftWing
leftWingWeld.Part1 = rightWing
leftWingWeld.C0 = CFrame.new(0, 0, 0)
leftWingWeld.C1 = CFrame.new(0, 2, 0)
leftWingWeld.Parent = leftWing

local rightWingWeld = Instance.new("Weld")
rightWingWeld.Part0 = rightWing
rightWingWeld.Part1 = abdomen
rightWingWeld.C0 = CFrame.new(0, 0, 0)
rightWingWeld.C1 = CFrame.new(0, 2, 0)
rightWingWeld.Parent = rightWing

local leftLegWeld = Instance.new("Weld")
leftLegWeld.Part0 = leftLeg
leftLegWeld.Part1 = abdomen
leftLegWeld.C0 = CFrame.new(0, 0, 0)
leftLegWeld.C1 = CFrame.new(0, 2, 0)
leftLegWeld.Parent = leftLeg

local rightLegWeld = Instance.new("Weld")
rightLegWeld.Part0 = rightLeg
rightLegWeld.Part1 = abdomen
rightLegWeld.C0 = CFrame.new(0, 0, 0)
rightLegWeld.C1 = CFrame.new(0, 2, 0)
rightLegWeld.Parent = rightLeg

local leftAntennaWeld = Instance.new("Weld")
leftAntennaWeld.Part0 = leftAntenna
leftAntennaWeld.Part1 = head
leftAntennaWeld.C0 = CFrame.new(0, 0, 0)
leftAntennaWeld.C1 = CFrame.new(0, 2, 0)
leftAntennaWeld.Parent = leftAntenna

local rightAntennaWeld = Instance.new("Weld")
rightAntennaWeld.Part0 = rightAntenna
rightAntennaWeld.Part1 = head
rightAntennaWeld.C0 = CFrame.new(0, 0, 0)
rightAntennaWeld.C1 = CFrame.new(0, 2, 0)
rightAntennaWeld.Parent = rightAntenna


-- Create the bug's body parts
local leftEye = Instance.new("Part")
leftEye.Name = "LeftEye"
leftEye.Size = Vector3.new(0.5, 0.5, 0.5)
leftEye.BrickColor = BrickColor.new("Black")  -- Adjust the color of the body
leftEye.Position = Vector3.new(0, 0, 0)
leftEye.Parent = workspace

local rightEye = Instance.new("Part")
rightEye.Name = "RightEye"
rightEye.Size = Vector3.new(0.5, 0.5, 0.5)
rightEye.BrickColor = BrickColor.new("Black")  -- Adjust the color of the body
rightEye.Position = Vector3.new(0, 0, 0)
rightEye.Parent = workspace

local leftEyeWeld = Instance.new("Weld")
leftEyeWeld.Part0 = leftEye
leftEyeWeld.Part1 = head
leftEyeWeld.C0 = CFrame.new(0, 0, 0)
leftEyeWeld.C1 = CFrame.new(0, 2, 0)
leftEyeWeld.Parent = leftEye

local rightEyeWeld = Instance.new("Weld")
rightEyeWeld.Part0 = rightEye
rightEyeWeld.Part1 = head
rightEyeWeld.C0 = CFrame.new(0, 0, 0)
rightEyeWeld.C1 = CFrame.new(0, 2, 0)
rightEyeWeld.Parent = rightEye

