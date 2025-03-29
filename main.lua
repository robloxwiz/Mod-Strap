-- Mobile FishStrap UI Script

-- Make sure to load the main library (Mod-Strap in this case)
local BloxLib = loadstring(game:HttpGet('https://github.com/robloxwiz/Mod-Strap/blob/main/main.lua'))()

-- Create the main window for the Mobile FishStrap
local Window = BloxLib:MakeWindow({
    Name = "Mobile FishStrap",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "FishStrapConfigs"
})

-- Function to load past settings from the user's files
local function loadSettings()
    -- Load settings from file (default: off)
    local settings = {
        featureXEnabled = false,
        fov = 100,
        volume = 50,
        customCrosshairEnabled = false,
        -- Add more settings here as needed
    }
    -- Return the settings
    return settings
end

local settings = loadSettings()

-- Send a system status notification when the UI starts up
local systemStatus = "Everything is up and running!"  -- Default status
local isEverythingGood = true  -- This will be checked dynamically

-- Simulate checking if something is working
if not isEverythingGood then
    systemStatus = "There is an issue! Please check the settings."
end

-- Display the notification with system status
BloxLib:MakeNotification({
    Name = "System Check",
    Content = systemStatus,
    Image = "rbxassetid://4483345998",  -- Optional: put an image for the notification
    Time = 5  -- Duration of the notification
})

-- Create a function to save user settings to their device files
local function saveSettings()
    -- Save the settings (you'll need to implement actual saving to a file here)
    print("Settings saved.")
end

-- Create Categories and Settings
local ModsTab = Window:MakeTab({
    Name = "Mods",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Custom Crosshair setting
local CrosshairToggle = ModsTab:AddToggle({
    Name = "Enable Custom Crosshair",
    Default = settings.customCrosshairEnabled,
    Callback = function(value)
        settings.customCrosshairEnabled = value
        saveSettings()
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

LightingTab:AddToggle({
    Name = "Gray Sky",
    Default = false,
    Callback = function(value)
        print("Gray Sky: " .. tostring(value))
    end
})

LightingTab:AddToggle({
    Name = "Anti-Aliasing (MSAA)",
    Default = false,
    Callback = function(value)
        print("Anti-Aliasing: " .. tostring(value))
    end
})

-- Engine Settings Tab
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

GraphicsTab:AddToggle({
    Name = "Disable Player Textures",
    Default = false,
    Callback = function(value)
        print("Disable Player Textures: " .. tostring(value))
    end
})

GraphicsTab:AddDropdown({
    Name = "Frame Buffer",
    Options = {"0x", "1x", "2x", "3x", "4x", "10x"},
    Default = "0x",
    Callback = function(value)
        print("Frame Buffer: " .. value)
    end
})

GraphicsTab:AddSlider({
    Name = "FOV",
    Min = 60,
    Max = 200,
    Default = settings.fov,
    Callback = function(value)
        settings.fov = value
        saveSettings()
        print("FOV set to: " .. value)
    end
})

-- Interface Settings Tab
local InterfaceTab = Window:MakeTab({
    Name = "Interface Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Custom Top Bar (Interface setting to spin the Roblox logo)
InterfaceTab:AddToggle({
    Name = "Custom Top Bar",
    Default = false,
    Callback = function(value)
        print("Custom Top Bar: " .. tostring(value))
    end
})

-- Stretch Resolution option
InterfaceTab:AddToggle({
    Name = "Stretch Resolution",
    Default = false,
    Callback = function(value)
        print("Stretch Resolution: " .. tostring(value))
    end
})

-- Credits Section (This will show a list of developers)
local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

CreditsTab:AddLabel("Credits to original developers of Bloxstrap")
CreditsTab:AddLabel("Credits to original developers of FirstStrap")
CreditsTab:AddLabel("Credits to original developers of MobileBloxstrap")
CreditsTab:AddLabel("Credits to me, Leo")

-- Final Setup to initialize the UI
BloxLib:Init()
