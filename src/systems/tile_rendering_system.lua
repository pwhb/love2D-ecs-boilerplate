local MapData = require("src.components.map_data")

local TileRenderingSystem = ECS.System("render", ECS.Query.All(MapData))

function TileRenderingSystem:Update()
    for _, entity in self:Result():Iterator() do
        local pos = entity[Position]
        local draw = entity[Drawable]

        love.graphics.setColor(unpack(draw.color))
        love.graphics.rectangle("fill", pos.x, pos.y, draw.width, draw.height)
    end

    love.graphics.setColor(1, 1, 1)
end

return TileRenderingSystem
