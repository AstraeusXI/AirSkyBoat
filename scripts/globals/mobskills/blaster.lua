-----------------------------------
-- Blaster
--
-- Description: Paralyzes enemy.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows.
-- Range: Melee?
-- Notes: Very potent paralysis xi.effect. Is NOT a Gaze Attack, unlike Chaotic Eye.
-- TODO: Blaster is a 70% paralyze chance with a 15-60 second duration.
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.PARALYSIS

    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 50, 0, 60))

    return typeEffect
end

return mobskillObject
