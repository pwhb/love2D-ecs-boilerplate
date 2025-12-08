local ECS = require("lib.ECS")

return ECS.Component({
    time_remaining = 120,
    scoreboard = {
        ["red"] = 1,
        ["blue"] = 1,
        ["green"] = 1,
        ["yellow"] = 1,
        ["white"] = 16
    }
})
