local MovementSystem = require("src.systems.movement_system")
local RenderSystem = require("src.systems.render_system")
local ControlInputSystem = require("src.systems.control_input_system")
local BoundarySystem = require("src.systems.boundary_system")
local WanderSystem = require("src.systems.wander_system")
local CollisionSystem = require("src.systems.collision_system")
local CleanUpSystem = require("src.systems.clean_up_system")
local systems_list = {ControlInputSystem, WanderSystem, MovementSystem, BoundarySystem, CollisionSystem, CleanUpSystem,
                      RenderSystem}

local Systems = {
    systems_list = systems_list,
    ControlInputSystem = ControlInputSystem,
    WanderSystem = WanderSystem,
    MovementSystem = MovementSystem,
    BoundarySystem = BoundarySystem,
    CollisionSystem = CollisionSystem,
    CleanUpSystem = CleanUpSystem,
    RenderSystem = RenderSystem
}

function Systems.setup(world_instance)
    for _, system in ipairs(systems_list) do
        if system.setWorld then
            system:setWorld(world_instance)
        end
    end
end

return Systems
