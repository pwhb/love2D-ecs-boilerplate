local ECS = require("lib.ECS")

return ECS.Component({
    asset_key = nil,
    current_image = nil,
    current_quad = nil,
    scale_x = 1,
    scale_y = 1,
    color_tint = {1, 1, 1, 1}
})
