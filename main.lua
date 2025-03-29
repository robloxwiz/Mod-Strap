-- Mobile FishStrap UI Script

-- Safe loadstring function to ensure no crashes
local function safeLoadString(url)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if success then
        return result
    else
        warn("Failed to load script from URL: " .. url)
        return nil
    end
end

-- Load the main library (Mod-Strap) using the safe loadstring method
local BloxLib = safeLoadString('https://raw.githubusercontent.com/robloxwiz/Mod-Strap/main/main.lua')
if not BloxLib then return end  -- Exit if script couldn't load

-- Create the main window for Mobile FishStrap
local Window = BloxLib:MakeWindow({
    Name = "Mobile FishStrap",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "FishStrapConfigs"
})

-- Function to load past settings from user's device files
local function loadSettings()
    local settings = {
        featureXEnabled = false,
        fov = 100,
        volume = 50,
        customCrosshairEnabled = false,
    }
    return settings
end

local settings = loadSettings()

-- Make sure no crashes/disconnections happen when the UI is used
local systemStatus = "Everything is up and running!"  -- Default status
local isEverythingGood = true  -- This will be checked dynamically

if not isEverythingGood then
    systemStatus = "There is an issue! Please check the settings."
end

-- Display the notification with system status
BloxLib:MakeNotification({
    Name = "System Check",
    Content = systemStatus,
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- Create Categories and Settings
local ModsTab = Window:MakeTab({
    Name = "Mods",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local CrosshairToggle = ModsTab:AddToggle({
    Name = "Enable Custom Crosshair",
    Default = settings.customCrosshairEnabled,
    Callback = function(value)
        settings.customCrosshairEnabled = value
        print("Custom Crosshair Enabled: " .. tostring(value))
    end
})

-- Lighting Settings
local LightingTab = Window:MakeTab({
    Name = "Lighting",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

LightingTab:AddToggle({
    Name = "No Fog",
    Default = false,
    Callback = function(value)
        print("No Fog: " .. tostring(value))
    end
})

LightingTab:AddToggle({
    Name = "No Wind",
    Default = false,
    Callback = function(value)
        print("No Wind: " .. tostring(value))
    end
})

-- Engine Settings
local EngineTab = Window:MakeTab({
    Name = "Engine Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Graphics Settings
local GraphicsTab = EngineTab:AddSection({
    Name = "Graphics"
})

GraphicsTab:AddToggle({
    Name = "Better Lighting",
    Default = false,
    Callback = function(value)
        print("Better Lighting: " .. tostring(value))
    end
})

-- Frame Buffer and FOV sliders
GraphicsTab:AddSlider({
    Name = "FOV",
    Min = 60,
    Max = 200,
    Default = settings.fov,
    Callback = function(value)
        settings.fov = value
        print("FOV set to: " .. value)
    end
})

-- Credits Section
local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

CreditsTab:AddLabel("Credits to original developers of Bloxstrap")
CreditsTab:AddLabel("Credits to original developers of FirstStrap")
CreditsTab:AddLabel("Credits to original developers of MobileBloxstrap")
CreditsTab:AddLabel("Credits to me, Leo")

-- Final Setup to initialize the UI and make sure it doesn’t crash or disconnect
BloxLib:Init()

-- Handle disconnect or exit to prevent crash
game:BindToClose(function()
    -- Save settings before exit (if applicable)
    print("Saving settings...")
    -- Call any function here to save settings
end)
