local ECS = require("lib.ECS")

return ECS.Component({
    current_action_key = nil,
    current_clip_key = nil,
    frame_index = 1,
    frame_duration = 0.05,
    timer = 0,
    is_looping = false
})
