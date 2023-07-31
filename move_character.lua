--roblox script to move character
-- Path: move_character.lua

-- Create a new script in StarterPlayerScripts
-- Copy and paste this code into the script

--print the name of the script
print(script.Name)

print "Hello!"

-- get the character
local character = script.Parent
--print character name
print(character.Name)

--get the humanoid
local humanoid = character:WaitForChild("Humanoid", 1)
--print humanoid name
print(humanoid.Name)

--get the root part
local rootPart = character:WaitForChild("HumanoidRootPart", 1)
--print root part name
print(rootPart.Name)

--wait for the player to spawn
wait(3)

local Players = game:GetService("Players")
--print count of players
print(Players.NumPlayers)

while(1)
do 
    for _,player in pairs(Players:GetPlayers()) do
        if player then
            playerCharacter = player.Character

            --print player name
            print(playerCharacter.Name)

            --get the player location
            local playerLocation = playerCharacter.HumanoidRootPart.Position

            --print player location
            print(playerLocation)

            --move the character to the player location
            rootPart.CFrame = CFrame.new(playerLocation)
        end
    end
    wait(1)
end


