local ECS = require("lib.ECS")
local Input = require("src.components.input")
local Velocity = require("src.components.velocity")
local ControlDevice = require("src.components.control_device")

local InputSystem = ECS.System("process", ECS.Query.All(Input, ControlDevice, Velocity))
local PLAYER_SPEED = 200

function InputSystem:Update()
    for _, entity in self:Result():Iterator() do
        local input = entity[Input]
        local device = entity[ControlDevice]
        local vel = entity[Velocity]

        input.move_x = 0
        input.move_y = 0

        if device.device_type == "keyboard" then

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

        elseif device.device_type == "keyboard_alt" then

            if love.keyboard.isDown("left") then
                input.move_x = input.move_x - 1
            end
            if love.keyboard.isDown("right") then
                input.move_x = input.move_x + 1
            end
            if love.keyboard.isDown("up") then
                input.move_y = input.move_y - 1
            end
            if love.keyboard.isDown("down") then
                input.move_y = input.move_y + 1
            end
        end

        vel.vx = input.move_x * PLAYER_SPEED
        vel.vy = input.move_y * PLAYER_SPEED
    end
end

return InputSystem
