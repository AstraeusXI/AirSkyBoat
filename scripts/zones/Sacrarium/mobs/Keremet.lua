-----------------------------------
-- Area: Sacrarium
--   NM: Keremet
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onMobFight = function(mob, target)
    local keremet = mob:getID()

    -- Send spawned skeleton "pets" to Keremet's target
    for i = keremet + 1, keremet + 12 do
        local m = GetMobByID(i)
        if m:getCurrentAction() == xi.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    for i = mob:getID() + 1, mob:getID() + 12 do
        if GetMobByID(i):isAlive() then
            GetMobByID(i):setHP(0)
        end
    end
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(1200, 1800)) -- 20 to 30 minutes
end

return entity
