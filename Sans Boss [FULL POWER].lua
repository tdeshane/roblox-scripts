--print hello message
print("hello")
--move Sans Boss [FULL POWER] NPC to "Drooling Zombie" NPC
--get the NPC via parent
sans_boss = script.Parent




--loop through all the "Drooling Zombie" NPCs in workspace
for i, drooling_zombie in ipairs(workspace:GetChildren()) do
    --if child is a "Drooling Zombie" NPC
    if drooling_zombie.Name == "Drooling Zombie" then
        --move sans to drooling zombie
        sans_boss.HumanoidRootPart.CFrame = drooling_zombie.HumanoidRootPart.CFrame
        --cause damage to drooling zombie
        drooling_zombie.Humanoid:TakeDamage(100)
    end
end