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
    HidePremium = true,
    Draggable = true,
    Resizable = true,
    SizeX = 600,
    SizeY = 400
})

-- Game Changer Tab 🫠️
local GameChangerTab = Window:MakeTab({
    Name = "Game Changer 🫠️",
    Icon = "rbxassetid://4483345998"
})

local fovValue = 100
GameChangerTab:AddTextbox({
    Name = "Adjust FOV",
    Default = tostring(fovValue),
    TextDisappear = false,
    Callback = function(Value)
        local numValue = tonumber(Value)
        if numValue and numValue >= 80 and numValue <= 110 then
            game.Workspace.CurrentCamera.FieldOfView = numValue
            fovValue = numValue
        end
    end
})

GameChangerTab:AddButton({
    Name = "Unlock FOV",
    Callback = function()
        game.Workspace.CurrentCamera.FieldOfView = 120
        fovValue = 120
        print("FOV unlocked")
    end
})

-- Disabling font, cursor, and FastFlags loading until the logic is added
-- You can enable and fill in these parts later when the logic is ready.

GameChangerTab:AddButton({
    Name = "Load Fonts (Coming Soon)",
    Callback = function()
        print("Fonts loading logic not implemented yet.")
    end
})

GameChangerTab:AddButton({
    Name = "Load Cursors (Coming Soon)",
    Callback = function()
        print("Cursors loading logic not implemented yet.")
    end
})

GameChangerTab:AddButton({
    Name = "Load FastFlags (Coming Soon)",
    Callback = function()
        print("FastFlags loading logic not implemented yet.")
    end
})

-- ⚠️ Danger Tab
local DangerTab = Window:MakeTab({
    Name = "⚠️ Danger",
    Icon = "rbxassetid://4483345998"
})

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
    Icon = "rbxassetid://4483345998"
})

StatusTab:AddLabel("Script Status: Running Properly")

-- Credits 💡 Tab
local CreditsTab = Window:MakeTab({
    Name = "Credits 💡",
    Icon = "rbxassetid://4483345998"
})

CreditsTab:AddLabel("Mobile FishStrap by Leo yes you read that right!")
CreditsTab:AddLabel("Special thanks to you all!")

-- User File Structure
local userFilePath = "MobileFishStrap/UserData/"
if not isfolder(userFilePath) then
    makefolder(userFilePath)
    makefolder(userFilePath .. "Cursors")
    makefolder(userFilePath .. "Fonts")
    makefolder(userFilePath .. "FastFlags")
end

-- Initialize the script
OrionLib:Init()
