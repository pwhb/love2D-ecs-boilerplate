local C = require("src.consts")
local ECS = require("lib.ECS")
local Animation = require("src.components.animation")
local Sprite = require("src.components.sprite")
local Velocity = require("src.components.velocity")
local ATLAS = require("src.graphics.sprite_atlas")
local AnimationSystem = ECS.System("process", ECS.Query.All(Animation, Sprite))

function AnimationSystem:get_new_clip_key(entity)
    local vel = entity[Velocity]
    local clip_key = "front"

    local abs_vx = math.abs(vel.vx)
    local abs_vy = math.abs(vel.vy)
    local is_moving = abs_vx > C.EPSILON or abs_vy > C.EPSILON
    if is_moving then
        if abs_vx > abs_vy then
            if vel.vx > C.EPSILON then
                clip_key = "right"
            elseif vel.vx < -C.EPSILON then
                clip_key = "left"
            end
        else
            if vel.vy > C.EPSILON then

                clip_key = "front"
            elseif vel.vy < -C.EPSILON then

                clip_key = "back"
            end
        end
    end

    return clip_key
end
function AnimationSystem:Update()
    for _, entity in self:Result():Iterator() do
        local anim = entity[Animation]
        local sprite = entity[Sprite]
        local vel = entity[Velocity]
        local is_moving = (math.abs(vel.vx) > C.EPSILON) or (math.abs(vel.vy) > C.EPSILON)
        local new_action_key = is_moving and "move" or "idle"
        local new_clip_key = anim.current_clip_key
        if is_moving then
            new_clip_key = self:get_new_clip_key(entity, new_action_key)
        end
        if new_action_key ~= anim.current_action_key or new_clip_key ~= anim.current_clip_key then
            if anim.current_action_key ~= new_action_key then
                sprite.current_image = ATLAS.get_image(sprite.asset_key, new_action_key)
                anim.current_action_key = new_action_key
            end
            anim.current_clip_key = new_clip_key
            anim.frame_index = 1
            anim.timer = 0
        end

        anim.timer = anim.timer + self.dt
        if anim.timer >= anim.frame_duration then
            anim.timer = anim.timer % anim.frame_duration

            local quads_array = ATLAS.get_quads_array(sprite.asset_key, anim.current_action_key, anim.current_clip_key)
            local max_frames = #quads_array
            anim.frame_index = anim.frame_index + 1
            if anim.frame_index > max_frames then
                if anim.is_looping then
                    anim.frame_index = 1
                else
                    anim.frame_index = max_frames
                end
            end
            sprite.current_quad = quads_array[anim.frame_index]
        end
    end
end

return AnimationSystem
