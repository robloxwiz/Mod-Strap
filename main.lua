local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

-- Creating the Window with a smaller size and simpler design
local Window = OrionLib:MakeWindow({
    Name = "Mobile UI Example", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "MobileUI", 
    IntroEnabled = true,
    IntroText = "Welcome to the clean UI!",
    Icon = "rbxassetid://123456789", -- Example icon
    IntroIcon = "rbxassetid://123456789", -- Example intro icon
    HidePremium = true -- Hide premium status
})

-- Creating a Tab with better mobile usability
local Tab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Adding a clean Section to the Tab
local Section = Tab:AddSection({
    Name = "General Settings"
})

-- Adding a Button with a smooth action
Tab:AddButton({
    Name = "Reset Settings",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Settings Reset!",
            Content = "The settings have been reset to default.",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
        -- Reset action here (example)
        print("Settings reset")
    end    
})

-- Adding a Toggle for easy enable/disable feature
Tab:AddToggle({
    Name = "Enable Feature X",
    Default = false,
    Callback = function(Value)
        print("Feature X is now", Value and "enabled" or "disabled")
    end    
})

-- Adding a Slider with a user-friendly design
Tab:AddSlider({
    Name = "Adjust Volume",
    Min = 0,
    Max = 100,
    Default = 50,
    Increment = 1,
    ValueName = "volume",
    Callback = function(Value)
        print("Volume set to", Value)
    end    
})

-- Adding a Colorpicker for custom colors
Tab:AddColorpicker({
    Name = "Background Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(Value)
        print("Background color changed to", Value)
    end
})

-- Adding a Dropdown menu for selecting options
Tab:AddDropdown({
    Name = "Select Option",
    Default = "Option 1",
    Options = {"Option 1", "Option 2", "Option 3"},
    Callback = function(Value)
        print("You selected:", Value)
    end
})

-- Create a button to reset all settings to default with countdown
Tab:AddButton({
    Name = "Reset All Settings",
    Callback = function()
        -- Countdown before resetting
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

-- Initialize the library and finish the setup
OrionLib:Init()
