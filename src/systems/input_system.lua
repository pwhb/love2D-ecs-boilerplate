-- src/systems/input_system.lua
local ECS = require("lib.ECS")
local Input = require("src.components.input")
local Velocity = require("src.components.velocity")

local InputSystem = ECS.System("process", ECS.Query.All(Input, Velocity))
local PLAYER_SPEED = 200

function InputSystem:Update()
    for _, entity in self:Result():Iterator() do
        local input = entity[Input]
        local vel = entity[Velocity]

        input.move_x = 0
        input.move_y = 0

        if love.keyboard.isDown("a") then
            input.move_x = input.move_x - 1
        end
        if love.keyboard.isDown("d") then
            input.move_x = input.move_x + 1
        end

        if love.keyboard.isDown("w") then
            input.move_y = input.move_y - 1
        end
        if love.keyboard.isDown("s") then
            input.move_y = input.move_y + 1
        end

        vel.vx = input.move_x * PLAYER_SPEED
        vel.vy = input.move_y * PLAYER_SPEED
    end
end

return InputSystem
