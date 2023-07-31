



--create ice ghost roblox character
--circle for the head
--triangles for the body


--print the name of the script
print(script.Name)

print "Hello!"

--create a model to hold the ghost character
local ghost = Instance.new("Model")
ghost.Name = "IceGhost"
ghost.Parent = workspace

local head = Instance.new("Part")
head.Shape = Enum.PartType.Ball
head.Size = Vector3.new(2, 2, 2)
head.Name = "Head"

head.BrickColor = BrickColor.new("Blue")  -- Adjust the color of the body
head.Position = Vector3.new(0, 10, 0)
head.Parent = ghost


--create sound fuction to play sound
function playSound()
    print("Playing sound")
    -- Get the part to play the sound at
    local soundPart = workspace.IceGhost.Head

    if soundPart then
        -- Create a new Sound instance
        local sound = Instance.new("Sound")

        -- Set the SoundId to your audio asset
        sound.SoundId = "rbxassetid://14076389818"

        -- Parent the sound to the part
        sound.Parent = soundPart

        -- Play the sound
        sound:Play()
    else
        print("Part not found.")
    end

end

function playSound2()
    print("Playing sound")
    -- Get the part to play the sound at
    local soundPart = workspace.IceGhost.Head

    if soundPart then
        -- Create a new Sound instance
        local sound = Instance.new("Sound")

        -- Set the SoundId to your audio asset
        sound.SoundId = "rbxassetid://14076601898"

        -- Parent the sound to the part
        sound.Parent = soundPart

        -- Play the sound
        sound:Play()
    else
        print("Part not found.")
    end

end

--play sound 2
playSound2()

--three triangles for the body
local triangle1 = Instance.new("Part")
triangle1.Shape = Enum.PartType.Block
triangle1.Name = "Triangle1"
triangle1.Size = Vector3.new(2, 2, 2)
triangle1.BrickColor = BrickColor.new("Blue")  -- Adjust the color of the body
triangle1.Position = Vector3.new(0, 8, 0)
triangle1.Parent = ghost

local triangle2 = Instance.new("Part")
triangle2.Shape = Enum.PartType.Block
triangle2.Name = "Triangle2"
triangle2.Size = Vector3.new(2, 2, 2)
triangle2.BrickColor = BrickColor.new("Blue")  -- Adjust the color of the body
triangle2.Position = Vector3.new(0, 8, 0)
triangle2.Parent = ghost

local triangle3 = Instance.new("Part")
triangle3.Shape = Enum.PartType.Block
triangle3.Name = "Triangle3"
triangle3.Size = Vector3.new(2, 2, 2)
triangle3.BrickColor = BrickColor.new("Blue")  -- Adjust the color of the body
triangle3.Position = Vector3.new(0, 8, 0)
triangle3.Parent = ghost

--weld the triangles to the head
local weld1 = Instance.new("Weld")
weld1.Part0 = head
weld1.Part1 = triangle1
weld1.C0 = CFrame.new(0, 0, 0)
weld1.Parent = head

local weld2 = Instance.new("Weld")
weld2.Part0 = head
weld2.Part1 = triangle2
weld2.C0 = CFrame.new(0, 0, 0)
weld2.Parent = head

local weld3 = Instance.new("Weld")
weld3.Part0 = head
weld3.Part1 = triangle3
weld3.C0 = CFrame.new(0, 0, 0)
weld3.Parent = head

--make the ghost a humanoid
local humanoid = Instance.new("Humanoid")
humanoid.Parent = head
ghost.PrimaryPart = head



-- get the character
local character = ghost
--print character name
print(character.Name)

--get the humanoid
local humanoid = character:WaitForChild("Humanoid", 1)

--get the root part
local rootPart = ghost.Head



--make the ghost move
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
bodyVelocity.Velocity = Vector3.new(0, 0, 0)
bodyVelocity.Parent = head

--make the ghost move
local bodyGyro = Instance.new("BodyGyro")
bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
bodyGyro.CFrame = CFrame.new(0, 0, 0)
bodyGyro.Parent = head


--wait for players to spawn event
wait(10)

--have the ghost attack the player character
local Players = game:GetService("Players")
--print count of players
print('number of players:')
print(Players.NumPlayers)

playSound()

sound_seconds = 0
while(1)
do 
    for _,player in pairs(Players:GetPlayers()) do
        if player then
            playerCharacter = player.Character

            --print player name
            print(playerCharacter.Name)

            --get humanoid root part of player
            local playerRootPart = playerCharacter:WaitForChild("HumanoidRootPart", 1)

            --move the character to the player location
            rootPart.CFrame = playerRootPart.CFrame
            
            
        end
    end
    wait(1)
    sound_seconds = sound_seconds + 1
    -- if sounds seconds is multiple of 17, play sound
    if sound_seconds % 34 == 0 then
        playSound()
    end

    if sound_seconds % 152 == 0 then
        playSound2()
    end
end



