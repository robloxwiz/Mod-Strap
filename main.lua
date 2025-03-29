local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

-- Creating the Window
local Window = OrionLib:MakeWindow({
    Name = "Mobile FishStrap",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "MobileFishStrap",
    IntroEnabled = true,
    IntroText = "Welcome to Mobile FishStrap!",
    Icon = "rbxassetid://123456789",
    IntroIcon = "rbxassetid://123456789",
    HidePremium = true,
    Draggable = true -- Make UI draggable
})

-- Settings Tab
local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

SettingsTab:AddSlider({
    Name = "Adjust FOV",
    Min = 70,
    Max = 120,
    Default = 90,
    Increment = 1,
    ValueName = "FOV",
    Callback = function(Value)
        game.Workspace.CurrentCamera.FieldOfView = Value
    end    
})

-- Themes Tab
local ThemesTab = Window:MakeTab({
    Name = "Themes",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

ThemesTab:AddDropdown({
    Name = "Select Theme",
    Default = "Default",
    Options = {"Default", "AmberGlow", "Amethyst", "Bloom", "DarkBlue", "Green", "Light", "Ocean", "Serenity"},
    Callback = function(Theme)
        OrionLib:SetTheme(Theme) -- Apply selected theme
    end
})

-- Status Tab
local StatusTab = Window:MakeTab({
    Name = "Status",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

StatusTab:AddLabel("Script Status: Running Properly")

-- Game Enhancements Tab
local GameTab = Window:MakeTab({
    Name = "Game Changer 🛠️",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

GameTab:AddToggle({
    Name = "Enable Night Mode",
    Default = false,
    Callback = function(Value)
        game.Lighting.Brightness = Value and 0.2 or 1
    end    
})

-- Reset All Settings with Countdown
SettingsTab:AddButton({
    Name = "Reset All Settings",
    Callback = function()
        local countdown = 3
        local function countdownNotify()
            if countdown > 0 then
                OrionLib:MakeNotification({
                    Name = "Resetting in " .. countdown,
                    Content = "All settings will be reset!",
                    Image = "rbxassetid://4483345998",
                    Time = 1
                })
                countdown = countdown - 1
                wait(1)
                countdownNotify()
            else
                OrionLib:ResetConfig()
                print("All settings reset to default")
            end
        end
        countdownNotify()
    end
})

-- User File Structure
local userFilePath = "MobileFishStrap/UserData/"
if not isfolder(userFilePath) then
    makefolder(userFilePath)
    makefolder(userFilePath .. "Cursors")
    makefolder(userFilePath .. "Fonts")
    makefolder(userFilePath .. "FastFlags")
end

OrionLib:Init()
