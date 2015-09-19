
----------------------------------------------------------
--              HideHouseName
--              Copyright (c) J Teatime.
----------------------------------------------------------


require "Window"

local HideHouseName = {}

function HideHouseName:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    return o
end

function HideHouseName:OnDependencyError(strDep, strError)
    return true
end

function HideHouseName:Init()
    local bHasConfigureFunction = false
    local strConfigureButtonText = ""
    local tDependencies = {
        -- "None",
    }
    Apollo.RegisterAddon(self, bHasConfigureFunction, strConfigureButtonText, tDependencies)

    Apollo.RegisterEventHandler("ObscuredAddonVisible", "onObscuredAddonVisible", self)
end

function HideHouseName:OnLoad()
end

function HideHouseName:onObscuredAddonVisible(strLoadedAddon)
    Print("DEBUG #001")
    if strLoadedAddon == "HousingRemodel" then
        Print("DEBUG #002")
        local HousingRemodel = Apollo.GetAddon("HousingRemodel")
        if HousingRemodel then
            Print("DEBUG #003")
            if HousingRemodel.wndConfigure then
                Print("DEBUG #004")
                HousingRemodel.wndConfigure:SetSprite(nil)
                Print("DEBUG #005")
            end
        end
    end
end

-- HideHouseName Instance
local HideHouseNameInst = HideHouseName:new()
HideHouseNameInst:Init()
