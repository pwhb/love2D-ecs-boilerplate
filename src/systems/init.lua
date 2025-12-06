local MovementSystem = require("src.systems.movement_system")
local RenderSystem = require("src.systems.render_system")
local ControlInputSystem = require("src.systems.control_input_system")
local BoundarySystem = require("src.systems.boundary_system")
local WanderSystem = require("src.systems.wander_system")

return {
    list = {MovementSystem, RenderSystem, BoundarySystem, ControlInputSystem, WanderSystem},
    MovementSystem = MovementSystem,
    RenderSystem = RenderSystem,
    BoundarySystem = BoundarySystem,
    ControlInputSystem = ControlInputSystem,
    WanderSystem = WanderSystem
}
