local love = require("love")
local SPRITE_CONFIG = require("src.graphics.sprite_config")

local ATLAS = {}

local function generate_quads(config)
    local img = love.graphics.newImage(config.image_path)
    local quads = {}

    for clip_key, coordinates_array in pairs(config.clips) do

        quads[clip_key] = {}

        for i, coord_pair in ipairs(coordinates_array) do
            local col_index = coord_pair[1]
            local row_index = coord_pair[2]

            local p_x = col_index * config.frame_width
            local p_y = row_index * config.frame_height

            local quad = love.graphics.newQuad(p_x, p_y, config.frame_width, config.frame_height, img:getWidth(),
                img:getHeight())

            quads[clip_key][i] = quad
        end
    end

    return quads, img
end

function ATLAS.load_all()
    for asset_key, config in pairs(SPRITE_CONFIG) do
        local quads, img = generate_quads(config)

        ATLAS[asset_key] = {
            image = img,
            quads = quads,
            frame_w = config.frame_width,
            frame_h = config.frame_height
        }
    end
end

return ATLAS
