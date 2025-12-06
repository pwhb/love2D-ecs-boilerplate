local MovementSystem = require("src.systems.movement_system")
local RenderSystem = require("src.systems.render_system")
local InputSystem = require("src.systems.input_system")
return {
    list = {MovementSystem, RenderSystem, InputSystem},
    MovementSystem = MovementSystem,
    RenderSystem = RenderSystem,
    InputSystem = InputSystem
}
