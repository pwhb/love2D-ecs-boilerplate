local ECS = require("lib.ECS")

return ECS.Component({
    roam_type = "random",
    turn_rate = 2,
    speed = 50,
    time_to_change = 0
})
