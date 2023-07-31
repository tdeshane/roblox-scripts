-- script to teleport to player
character = script.Parent

-- get the humanoid root part
local rootPart = character:WaitForChild("HumanoidRootPart", 1)


wait(10)


-- function to teleport to player
function teleportToPlayer()
    -- get list of players
    local players = game:GetService("Players")
    -- loop through players
    for _, player in pairs(players:GetPlayers()) do
        -- get the humanoid root part
        local rootPart = player.Character:WaitForChild("HumanoidRootPart", 1)
        -- teleport to player
        character.HumanoidRootPart.CFrame = rootPart.CFrame
    end
end

while true do
    wait(2)
    teleportToPlayer()
end


