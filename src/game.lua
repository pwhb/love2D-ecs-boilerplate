local ECS = require("lib.ECS")
local Components = require("src.components.init")
local Systems = require("src.systems.init")

local world
local player
local Game = {}

function Game:load()

    world = ECS.World(Systems.list)

    player = world:Entity(Components.Position({
        x = 100,
        y = 100
    }), Components.Velocity({
        vx = 0,
        vy = 0
    }), Components.Drawable({
        color = {1, 0.5, 0.5},
        width = 40,
        height = 40
    }), Components.Input())

    world:Entity(Components.Position({
        x = 300,
        y = 150
    }), Components.Velocity({
        vx = -20,
        vy = 20
    }), Components.Drawable({
        color = {0.5, 0.5, 1},
        width = 20,
        height = 20
    }))
end

function Game:update(dt)

    Systems.MovementSystem.dt = dt

    local now = love.timer.getTime()
    world:Update("process", now)
end

function Game:draw()

    local now = love.timer.getTime()
    world:Update("render", now)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("ESC to quit. Two entities moving with ECS.", 10, 10)
end

function Game:keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function Game:keyreleased(key)

end

return Game
