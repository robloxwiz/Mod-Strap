local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

-- Creating the Window
local Window = OrionLib:MakeWindow({
    Name = "Mobile FishStrap",
    SaveConfig = true,
    ConfigFolder = "MobileFishStrap",
    IntroEnabled = true,
    IntroText = "Welcome to Mobile FishStrap!",
    Icon = "rbxassetid://123456789",
    IntroIcon = "rbxassetid://123456789",
    HidePremium = true, -- Premium settings removed
    Draggable = true,
    Resizable = true, -- Allow resizing for mobile users
    SizeX = 600, -- Smaller window size for mobile users
    SizeY = 400  -- Adjust height as well for mobile
})

-- Game Changer Tab 🫠️
local GameChangerTab = Window:MakeTab({
    Name = "Game Changer 🫠️",
    Icon = "rbxassetid://4483345998"
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

-- ⚠️ Danger Tab
local DangerTab = Window:MakeTab({
    Name = "⚠️ Danger",
    Icon = "rbxassetid://4483345998"
})

-- Reset Settings Button with Countdown
DangerTab:AddButton({
    Name = "Reset All Settings",
    Callback = function()
        local countdown = 3
        for i = countdown, 1, -1 do
            wait(1)
        end
        OrionLib:ResetConfig()
        print("All settings reset to default")
    end
})

-- Themes 🎨 Tab
local ThemesTab = Window:MakeTab({
    Name = "Themes 🎨",
    Icon = "rbxassetid://4483345998"
})

-- Themes Dropdown
ThemesTab:AddDropdown({
    Name = "Select Theme",
    Default = "Default",
    Options = {"Default", "AmberGlow", "Amethyst", "Bloom", "DarkBlue", "Green", "Light", "Ocean", "Serenity"},
    Callback = function(Theme)
        Window:SetTheme(Theme)  -- Correct function for theme change
    end
})

-- Status 📊 Tab
local StatusTab = Window:MakeTab({
    Name = "Status 📊",
    Icon = "rbxassetid://4483345998"
})

-- Script Status Label
StatusTab:AddLabel("Script Status: Running Properly")

-- Credits 💡 Tab
local CreditsTab = Window:MakeTab({
    Name = "Credits 💡",
    Icon = "rbxassetid://4483345998"
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
