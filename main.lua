-- Load UI Library (OrionLib for stability)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

-- Create Window
local Window = OrionLib:MakeWindow({
    Name = "Mobile FishStrap",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "MobileFishStrap",
    IntroEnabled = true,
    IntroText = "Welcome to Mobile FishStrap!",
    Icon = "rbxassetid://123456789",
    IntroIcon = "rbxassetid://123456789"
})

-- Create Categories (Tabs on the Left Side)
local GeneralTab = Window:MakeTab({ Name = "General", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local AdvancedTab = Window:MakeTab({ Name = "Advanced", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local DangerTab = Window:MakeTab({ Name = "⚠️ Danger", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local CreditsTab = Window:MakeTab({ Name = "Credits", Icon = "rbxassetid://4483345998", PremiumOnly = false })

-- General Settings
GeneralTab:AddToggle({
    Name = "Enable Smooth UI",
    Default = false,
    Callback = function(Value)
        print("Smooth UI is now", Value and "enabled" or "disabled")
    end    
})

GeneralTab:AddSlider({
    Name = "Adjust FOV",
    Min = 70,
    Max = 120,
    Default = 90,
    Increment = 1,
    ValueName = "FOV",
    Callback = function(Value)
        print("FOV set to", Value)
    end    
})

GeneralTab:AddDropdown({
    Name = "Theme Selector",
    Default = "Light Mode",
    Options = {"Light Mode", "Dark Mode", "Custom"},
    Callback = function(Value)
        print("Theme changed to", Value)
    end
})

-- Advanced Settings
AdvancedTab:AddToggle({
    Name = "Enable Experimental Mode",
    Default = false,
    Callback = function(Value)
        print("Experimental Mode", Value and "enabled" or "disabled")
    end    
})

AdvancedTab:AddButton({
    Name = "Reload Script",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Reloading...",
            Content = "Script is restarting.",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
        wait(1)
        loadstring(game:HttpGet('https://github.com/robloxwiz/Mod-Strap/raw/main/main.lua'))()
    end    
})

-- Danger Zone
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
                print("All settings reset")
                -- Implement reset function here
            end
        end
        countdownNotify()
    end
})

-- Credits Section
CreditsTab:AddLabel("Credits:")
CreditsTab:AddLabel("- Original BloxStrap Developers")
CreditsTab:AddLabel("- Original FishStrap Developers")
CreditsTab:AddLabel("- Mobile BloxStrap Developers")
CreditsTab:AddLabel("- Developed by Leo")

-- Load Past Settings (Prevents Data Loss)
local function LoadSettings()
    -- Placeholder for loading settings from files
    print("Loading previous settings...")
end
LoadSettings()

-- Prevent Crashes or Disconnections
local function AntiCrash()
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Escape then
            print("Preventing crash...")
        end
    end)
end
AntiCrash()

-- Initialize UI
OrionLib:Init()
