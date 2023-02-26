local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DevPackages = ReplicatedStorage:FindFirstChild("DevPackages")
if DevPackages then
    local TestEZ = require(DevPackages.TestEZ)
    local Tests = script:GetChildren()
    for i=1, #Tests do
        local ThisTest = Tests[i]
        local Parent = ReplicatedStorage:FindFirstChild(ThisTest.Name, true)
        ThisTest.Parent = Parent
        ThisTest.Name = ThisTest.Name..".spec"
        Tests[i] = Parent
    end
    TestEZ.TestBootstrap:run(Tests)
end