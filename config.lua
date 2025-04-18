Config = {}

-- Notify system: currently only "okokNotify" is supported but you can config in client.lua:41
Config.NotifyType = "okokNotify"

-- Interaction button (E)
Config.InteractKey = 38

-- Marker settings
Config.MarkerType = 1
Config.MarkerSize = vector3(1.0, 1.0, 1.0)
Config.MarkerColor = { r = 0, g = 255, b = 100, a = 150 }

-- More teleport locations
Config.Locations = {
    {
        marker = vector3(-552.5726, -259.8552, 36.0691),     -- Point A (marker)
        teleport = vector3(-541.7925, -210.0193, 37.6512)    -- Point B (target)
    },
    {
        marker = vector3(-493.4368, -218.8025, 36.5021),
        teleport = vector3(-541.7925, -210.0193, 37.6512)
    }
    -- You can add more places here in the same way
}
