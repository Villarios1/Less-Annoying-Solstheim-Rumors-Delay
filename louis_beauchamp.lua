local config = require("Less Annoying Solstheim Rumors & Delay.config")

local function manageNpc()
    local louisBeauchamp = tes3.getReference("louis beauchamp")

    local shouldExist = tes3.player.object.level >= config.requiredPlayerLevel
    if shouldExist and louisBeauchamp.disabled then
        louisBeauchamp:enable()
    elseif not shouldExist and not louisBeauchamp.disabled then
        louisBeauchamp:disable()
        louisBeauchamp.modified = false
    end
end

local function onLoaded()
    manageNpc()
end
event.register("loaded", onLoaded)

local function onLevelUp()
    manageNpc()
end
event.register(tes3.event.levelUp, onLevelUp)

-- Без этого при загрузке старого low-lvl сохранения 2 раза подряд,
-- в котором вы смотрите на Луи - выкинет с ошибкой анимации Луи
local function onLoad()
    tes3.getReference("louis beauchamp"):enable()
end
event.register("load", onLoad)