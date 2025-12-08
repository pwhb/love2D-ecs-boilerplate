local love = require("love")
local SPRITE_CONFIG = require("src.graphics.sprite_config")

local ATLAS = {}
local ALL_IMAGES = {}
local ALL_QUADS = {}

local function generate_quads(config)
    local image = love.graphics.newImage(config.image_path)
    local quads = {}
    for clip_key, coordinates_array in pairs(config.clips) do
        quads[clip_key] = {}
        for i, coord_pair in ipairs(coordinates_array) do
            local col_index = coord_pair[1]
            local row_index = coord_pair[2]
            local p_x = col_index * config.frame_w
            local p_y = row_index * config.frame_h
            local quad = love.graphics.newQuad(p_x, p_y, config.frame_w, config.frame_h, image:getWidth(),
                image:getHeight())
            quads[clip_key][i] = quad
        end
    end

    return quads, image
end

function ATLAS.load_all()
    for asset_key, action_map in pairs(SPRITE_CONFIG) do
        for action_key, config in pairs(action_map) do
            local quads, image = generate_quads(config)
            ALL_IMAGES[string.format("%s_%s", asset_key, action_key)] = image
            for clip_key, quads_array in pairs(quads) do
                ALL_QUADS[string.format("%s_%s_%s", asset_key, action_key, clip_key)] = quads_array
            end
        end
    end
end

function ATLAS.get_quads_array(asset_key, action_key, clip_key)
    return ALL_QUADS[string.format("%s_%s_%s", asset_key, action_key, clip_key)]
end

function ATLAS.get_image(asset_key, action_key)
    return ALL_IMAGES[string.format("%s_%s", asset_key, action_key)]
end

return ATLAS
