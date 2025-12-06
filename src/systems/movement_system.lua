local ECS = require("lib.ECS")
local Position = require("src.components.position")
local Velocity = require("src.components.velocity")

local MovementSystem = ECS.System("process", ECS.Query.All(Position, Velocity))

MovementSystem.dt = 0

function MovementSystem:Update()
    for _, entity in self:Result():Iterator() do
        local pos = entity[Position]
        local vel = entity[Velocity]

        pos.x = pos.x + vel.vx * self.dt
        pos.y = pos.y + vel.vy * self.dt

        if pos.x < 0 or pos.x > 800 then
            vel.vx = -vel.vx
        end
        if pos.y < 0 or pos.y > 600 then
            vel.vy = -vel.vy
        end
    end
end

return MovementSystem
