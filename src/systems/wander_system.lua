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
            local range = wander.turn_rate_max - wander.turn_rate_min
            wander.time_to_change = love.math.random() * range + wander.turn_rate_min
            local target_angle = 0
            if wander.roam_type == "random" then
                target_angle = love.math.random() * math.pi * 2
            end
            vel.vx = math.cos(target_angle) * wander.speed
            vel.vy = math.sin(target_angle) * wander.speed
        end
    end
end

return WanderSystem
