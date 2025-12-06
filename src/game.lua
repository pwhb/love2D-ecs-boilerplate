local ECS = require("lib.ECS")
local Components = require("src.components.init")
local Systems = require("src.systems.init")

local player1, player2
local Game = {}

local screen_w = love.graphics.getWidth()
local screen_h = love.graphics.getHeight()

local DEFAULT_WIDTH = 20
local DEFAULT_HEIGHT = 40

function Game:load()
    love.math.setRandomSeed(os.time())

    Game.world = ECS.World(Systems.systems_list)
    Systems.setup(Game.world)

    player1 = Game.world:Entity(Components.Position({
        x = 100,
        y = 100
    }), Components.Velocity({
        vx = 0,
        vy = 0
    }), Components.Drawable({
        color = {1, 0.5, 0.5},
        width = DEFAULT_WIDTH,
        height = DEFAULT_HEIGHT
    }), Components.Boundary(), Components.ControlInput(), Components.ControlDevice({
        device_type = "keyboard",
        joystick_id = nil
    }), Components.Collision({
        collision_group = "player"
    }))

    player2 = Game.world:Entity(Components.Position({
        x = screen_w - 100 - DEFAULT_WIDTH,
        y = screen_h - 100 - DEFAULT_HEIGHT
    }), Components.Velocity({
        vx = 0,
        vy = 0
    }), Components.Drawable({
        color = {1, 0.75, 0.25},
        width = DEFAULT_WIDTH,
        height = DEFAULT_HEIGHT
    }), Components.Boundary(), Components.ControlInput(), Components.ControlDevice({
        device_type = "keyboard_alt"
    }), Components.Collision({
        collision_group = "player"
    }))

    for i = 1, 50 do
        x = love.math.random(0, screen_w)
        y = love.math.random(0, screen_h)
        Game.world:Entity(Components.Position({
            x = x,
            y = y
        }), Components.Velocity({
            vx = -20,
            vy = 20
        }), Components.Drawable({
            color = {0.5, 0.5, 1},
            width = DEFAULT_WIDTH,
            height = DEFAULT_HEIGHT
        }), Components.Wander({}), Components.Collision({
            collision_group = "enemy"
        }))
    end

end

function Game:update(dt)

    Systems.MovementSystem.dt = dt
    Systems.WanderSystem.dt = dt

    local now = love.timer.getTime()
    Game.world:Update("process", now)
end

function Game:draw()

    local now = love.timer.getTime()
    Game.world:Update("render", now)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("ESC to quit.", 10, 10)
end

function Game:keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function Game:keyreleased(key)

end

return Game
