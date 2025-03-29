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

-- Ensure all required folders exist
local userFilePath = "MobileFishStrap/UserData/"
local folders = { "Audio", "Core", "Fonts", "Images", "Logs", "Cursors" }
for _, folder in ipairs(folders) do
    if not isfolder(userFilePath .. folder) then
        makefolder(userFilePath .. folder)
    end
end

-- Game Changer Tab 🛠️
local GameChangerTab = Window:MakeTab({
    Name = "Game Changer 🛠️",
    Icon = "rbxassetid://4483345998"
})

GameChangerTab:AddTextbox({
    Name = "Adjust FOV",
    Default = "100",
    TextDisappear = false,
    Callback = function(Value)
        local numValue = tonumber(Value)
        if numValue and numValue >= 80 and numValue <= 110 then
            game.Workspace.CurrentCamera.FieldOfView = numValue
        end
    end
})

GameChangerTab:AddButton({
    Name = "Unlock FOV",
    Callback = function()
        game.Workspace.CurrentCamera.FieldOfView = 120
    end
})

GameChangerTab:AddButton({
    Name = "Load Fonts",
    Callback = function()
        print("Loading Fonts...")
    end
})

GameChangerTab:AddButton({
    Name = "Load Cursors",
    Callback = function()
        print("Loading Cursors...")
    end
})

GameChangerTab:AddButton({
    Name = "Load FastFlags",
    Callback = function()
        print("Loading FastFlags...")
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
        for i = 3, 1, -1 do
            wait(1)
        end
        OrionLib:ResetConfig()
    end
})

DangerTab:AddButton({
    Name = "Uneject",
    Callback = function()
        OrionLib:Exit()
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

-- FastFlag Editor Tab
local FastFlagTab = Window:MakeTab({
    Name = "FastFlag Editor",
    Icon = "rbxassetid://4483345998"
})

FastFlagTab:AddTextbox({
    Name = "FastFlag Text",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        print("FastFlag applied: " .. Value)
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

OrionLib:Init()
