local ECS = require("lib.ECS")
local Position = require("src.components.position")
local Drawable = require("src.components.drawable")
local Sprite = require("src.components.sprite")

local RenderSystem = ECS.System("render", ECS.Query.All(Position, ECS.Query.Any(Sprite, Drawable)))

function RenderSystem:Update()
    for _, entity in self:Result():Iterator() do
        local pos = entity[Position]
        local draw = entity[Drawable]
        local sprite = entity[Sprite]

        if sprite then
            local tint = sprite.color_tint or {1, 1, 1, 1}
            love.graphics.setColor(unpack(tint))
            love.graphics.draw(sprite.current_image, sprite.current_quad, pos.x, pos.y, 0, sprite.scale_x,
                sprite.scale_y)
        else
            love.graphics.setColor(unpack(draw.color))
            love.graphics.rectangle("fill", pos.x, pos.y, draw.width, draw.height)
        end

    end

    love.graphics.setColor(1, 1, 1)
end

return RenderSystem
