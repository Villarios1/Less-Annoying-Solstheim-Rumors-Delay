local currentCell
local isInMournhold = false

local function checkIsInMournhold()
    if currentCell.isInterior then
        isInMournhold = currentCell.id:find("Mournhold", 1, true) ~= nil
    end
end

local function onCellChanged()
    currentCell = tes3.getPlayerCell()
    checkIsInMournhold()
end
event.register("cellChanged", onCellChanged)

-- нужен геттер, т.к isInMournhold - простой тип
local function getIsInMournhold()
    return isInMournhold
end

return getIsInMournhold