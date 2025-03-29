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
    Draggable = true
})

-- Game Changer Tab 🫠️
local GameChangerTab = Window:MakeTab({
    Name = "Game Changer 🫠️",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Adjusting FOV with Text Input
GameChangerTab:AddTextbox({
    Name = "Adjust FOV",
    Default = "90",
    TextDisappear = false,
    Callback = function(Value)
        local numValue = tonumber(Value)
        if numValue and numValue >= 70 and numValue <= 120 then
            game.Workspace.CurrentCamera.FieldOfView = numValue
        end
    end    
})

-- Enable Feature Toggle
GameChangerTab:AddToggle({
    Name = "Enable Feature X",
    Default = false,
    Callback = function(Value)
        print("Feature X is now", Value and "enabled" or "disabled")
    end    
})

-- ⚠️ Danger Tab
local DangerTab = Window:MakeTab({
    Name = "⚠️ Danger",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Reset Settings Button with Countdown
DangerTab:AddButton({
    Name = "Reset All Settings",
    Callback = function()
        local countdown = 3
        for i = countdown, 1, -1 do
            OrionLib:MakeNotification({
                Name = "Resetting in " .. i,
                Content = "All settings will be reset!",
                Image = "rbxassetid://4483345998",
                Time = 1
            })
            wait(1)
        end
        OrionLib:ResetConfig()
        print("All settings reset to default")
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
        Window:SetTheme(Theme)
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
