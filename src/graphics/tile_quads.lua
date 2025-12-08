local TILESET_IMG = love.graphics.newImage("assets/tilemap.png")
local TILE_SIZE = 16
local SPACING = 1
local COLUMNS = 27
local ROWS = 18
local Quads = {}

local function get_quad_by_id(index)
    if index < 0 then
        return nil
    end

    local i_x = index % COLUMNS
    local i_y = math.floor(index / COLUMNS)

    local p_x = (i_x * TILE_SIZE) + (i_x * SPACING)
    local p_y = (i_y * TILE_SIZE) + (i_y * SPACING)

    return love.graphics.newQuad(p_x, p_y, TILE_SIZE, TILE_SIZE, TILESET_IMG:getWidth(), TILESET_IMG:getHeight())
end

for i = 0, COLUMNS * ROWS - 1 do
    Quads[i] = get_quad_by_id(i)
end

return Quads, TILESET_IMG, TILE_SIZE
