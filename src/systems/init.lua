local MovementSystem = require("src.systems.movement_system")
local RenderSystem = require("src.systems.render_system")

return {
    list = {MovementSystem, RenderSystem},
    MovementSystem = MovementSystem,
    RenderSystem = RenderSystem
}
