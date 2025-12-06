local ECS = require("lib.ECS")
local Position = require("src.components.position")
local Drawable = require("src.components.drawable")
local Collision = require("src.components.collision")
local Destroy = require("src.components.destroy")

local CollisionSystem = ECS.System("process", ECS.Query.All(Position, Drawable, Collision))

function check_overlap(entity_a, entity_b)
    local pos_a = entity_a[Position]
    local dim_a = entity_a[Drawable]
    local pos_b = entity_b[Position]
    local dim_b = entity_b[Drawable]
    if pos_a.x < pos_b.x + dim_b.width and pos_a.x + dim_a.width > pos_b.x and pos_a.y < pos_b.y + dim_b.height and
        pos_a.y + dim_a.height > pos_b.y then
        return true
    end
    return false
end

function CollisionSystem:Update()

    local collidables_snapshot = {}
    for _, entity in self:Result():Iterator() do

        if not entity[Destroy] then
            table.insert(collidables_snapshot, entity)
        end
    end

    local num_collidables = #collidables_snapshot

    for i = 1, num_collidables do
        local entity_a = collidables_snapshot[i]
        local collision_a = entity_a[Collision]
        local group_a = collision_a.collision_group

        for j = i + 1, num_collidables do
            local entity_b = collidables_snapshot[j]
            local collision_b = entity_b[Collision]
            local group_b = collision_b.collision_group
            if check_overlap(entity_a, entity_b) then
                if (group_a == "player" and group_b == "enemy") or (group_a == "enemy" and group_b == "player") then
                    local enemy_entity = (group_a == "enemy") and entity_a or entity_b
                    if not enemy_entity[Destroy] then
                        enemy_entity[Destroy] = {}
                    end

                end
            end
        end
    end
end

return CollisionSystem
