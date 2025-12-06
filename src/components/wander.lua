local ECS = require("lib.ECS")

return ECS.Component({
    roam_type = "random",
    turn_rate_min = 1,
    turn_rate_max = 3,
    speed = 100,
    time_to_change = 0
})
