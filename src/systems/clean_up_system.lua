local ECS = require("lib.ECS")
local Destroy = require("src.components.destroy")

local CleanUpSystem = ECS.System("process", ECS.Query.All(Destroy))

function CleanUpSystem:setWorld(world_instance)
    self.world = world_instance
end

function CleanUpSystem:Update()
    for _, entity in self:Result():Iterator() do
        self.world:Remove(entity)
    end
end

return CleanUpSystem
