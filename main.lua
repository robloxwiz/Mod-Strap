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

-- Game Changer Tab 🛠️
local GameChangerTab = Window:MakeTab({
    Name = "Game Changer 🛠️",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Adjusting FOV
GameChangerTab:AddSlider({
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

-- Enable Feature
GameChangerTab:AddToggle({
    Name = "Enable Feature X",
    Default = false,
    Callback = function(Value)
        print("Feature X is now", Value and "enabled" or "disabled")
    end    
})

-- ⚠️ Danger Tab (for risky/reset options)
local DangerTab = Window:MakeTab({
    Name = "⚠️ Danger",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Reset Settings Button
DangerTab:AddButton({
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

-- Themes 🎨 Tab
local ThemesTab = Window:MakeTab({
    Name = "Themes 🎨",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Themes Dropdown
ThemesTab:AddDropdown({
    Name = "Select Theme",
    Default = "Default",
    Options = {"Default", "AmberGlow", "Amethyst", "Bloom", "DarkBlue", "Green", "Light", "Ocean", "Serenity"},
    Callback = function(Theme)
        Window:SetTheme(Theme) -- Make the theme change work properly
    end
})

-- Status 📊 Tab
local StatusTab = Window:MakeTab({
    Name = "Status 📊",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Script Status Label
StatusTab:AddLabel("Script Status: Running Properly")

-- Credits 💡 Tab
local CreditsTab = Window:MakeTab({
    Name = "Credits 💡",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Credits Label
CreditsTab:AddLabel("Mobile FishStrap by YourNameHere")
CreditsTab:AddLabel("Special thanks to OrionLib for providing the UI framework!")

-- User File Structure
local userFilePath = "MobileFishStrap/UserData/"
if not isfolder(userFilePath) then
    makefolder(userFilePath)
    makefolder(userFilePath .. "Cursors")
    makefolder(userFilePath .. "Fonts")
    makefolder(userFilePath .. "FastFlags")
end

OrionLib:Init()
