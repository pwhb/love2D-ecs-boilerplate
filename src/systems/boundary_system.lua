local ECS = require("lib.ECS")
local Position = require("src.components.position")
local Drawable = require("src.components.drawable")
local Boundary = require("src.components.boundary")

local BoundarySystem = ECS.System("process", ECS.Query.All(Position, Drawable, Boundary))

function BoundarySystem:Update()
    local screen_w = love.graphics.getWidth()
    local screen_h = love.graphics.getHeight()

    for _, entity in self:Result():Iterator() do
        local pos = entity[Position]
        local draw = entity[Drawable]
        local boundary = entity[Boundary]

        local padding = boundary.padding or 0
        local entity_w = draw.width
        local entity_h = draw.height

        local min_x = 0 + padding
        local max_x = screen_w - entity_w - padding
        pos.x = math.max(min_x, math.min(pos.x, max_x))

        local min_y = 0 + padding
        local max_y = screen_h - entity_h - padding
        pos.y = math.max(min_y, math.min(pos.y, max_y))
    end
end

return BoundarySystem
