local ECS = require("lib.ECS")
local Quads, TILESET_IMG, TILE_SIZE = require("src.graphics.tile_quads")

return ECS.Component({
    tile_size = TILE_SIZE,
    tileset_img = TILESET_IMG,
    tile_quads = Quads,

    layer_data = nil,
    map_width = 0,
    map_height = 0
})
