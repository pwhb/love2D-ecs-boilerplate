local MovementSystem = require("src.systems.movement_system")
local RenderSystem = require("src.systems.render_system")
local ControlInputSystem = require("src.systems.control_input_system")
local BoundarySystem = require("src.systems.boundary_system")

return {
    list = {MovementSystem, RenderSystem, BoundarySystem, ControlInputSystem},
    MovementSystem = MovementSystem,
    RenderSystem = RenderSystem,
    BoundarySystem = BoundarySystem,
    ControlInputSystem = ControlInputSystem
}
