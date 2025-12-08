local ECS = require("lib.ECS")

return ECS.Component({
    asset_key = nil,
    atlas_quads = nil,
    current_quad = nil,
    frame_w = 0,
    frame_h = 0,
    color_tint = {1, 1, 1, 1}
})
