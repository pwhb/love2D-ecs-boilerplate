local ECS = require("lib.ECS")
local Velocity = require("src.components.velocity")
local ControlInput = require("src.components.control_input")
local ControlDevice = require("src.components.control_device")

local ControlInputSystem = ECS.System("process", ECS.Query.All(ControlInput, ControlDevice, Velocity))
local PLAYER_SPEED = 200

function ControlInputSystem:Update()
    for _, entity in self:Result():Iterator() do
        local control_input = entity[ControlInput]
        local device = entity[ControlDevice]
        local vel = entity[Velocity]

        control_input.move_x = 0
        control_input.move_y = 0

        if device.device_type == "keyboard" then

            if love.keyboard.isDown("a") then
                control_input.move_x = control_input.move_x - 1
            end
            if love.keyboard.isDown("d") then
                control_input.move_x = control_input.move_x + 1
            end
            if love.keyboard.isDown("w") then
                control_input.move_y = control_input.move_y - 1
            end
            if love.keyboard.isDown("s") then
                control_input.move_y = control_input.move_y + 1
            end

        elseif device.device_type == "keyboard_alt" then

            if love.keyboard.isDown("left") then
                control_input.move_x = control_input.move_x - 1
            end
            if love.keyboard.isDown("right") then
                control_input.move_x = control_input.move_x + 1
            end
            if love.keyboard.isDown("up") then
                control_input.move_y = control_input.move_y - 1
            end
            if love.keyboard.isDown("down") then
                control_input.move_y = control_input.move_y + 1
            end
        end

        vel.vx = control_input.move_x * PLAYER_SPEED
        vel.vy = control_input.move_y * PLAYER_SPEED
    end
end

return ControlInputSystem
