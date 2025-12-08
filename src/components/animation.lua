local ECS = require("lib.ECS")

return ECS.Component({
    current_clip_key = 0,
    frame_duration = 1,
    timer = 0,
    frame_index = 0,
    is_looping = false
})
