local ECS = require("lib.ECS")
local Position = require("src.components.position")
local Drawable = require("src.components.drawable")

local RenderSystem = ECS.System("render", ECS.Query.All(Position, Drawable))

function RenderSystem:Update()
    for _, entity in self:Result():Iterator() do
        local pos = entity[Position]
        local draw = entity[Drawable]

        love.graphics.setColor(unpack(draw.color))
        love.graphics.rectangle("fill", pos.x, pos.y, draw.width, draw.height)
    end

    love.graphics.setColor(1, 1, 1)
end

return RenderSystem
