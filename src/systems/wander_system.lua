local ECS = require("lib.ECS")
local Position = require("src.components.position")
local Velocity = require("src.components.velocity")
local Wander = require("src.components.wander")

local WanderSystem = ECS.System("process", ECS.Query.All(Position, Velocity, Wander))

WanderSystem.dt = 0

function WanderSystem:Update()
    for _, entity in self:Result():Iterator() do
        local pos = entity[Position]
        local vel = entity[Velocity]
        local wander = entity[Wander]
        wander.time_to_change = wander.time_to_change - self.dt

        if wander.time_to_change <= 0 then
            wander.time_to_change = wander.turn_rate
            local target_angle = 0
            if wander.roam_type == "random" then
                target_angle = math.random() * math.pi * 2
            end
            vel.vx = math.cos(target_angle) * wander.speed
            vel.vy = math.sin(target_angle) * wander.speed
        end
    end
end

return WanderSystem
