-- Create a UI for Bloxstrap on Mobile

local function CreateWindow()
    -- Window Settings
    local window = Instance.new("ScreenGui")
    window.Name = "BloxstrapUI"
    window.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Window Background
    local background = Instance.new("Frame")
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Dark background
    background.Parent = window

    -- Title
    local title = Instance.new("TextLabel")
    title.Text = "Bloxstrap Mobile Interface"
    title.Font = Enum.Font.SourceSans
    title.TextSize = 30
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Parent = background

    -- Theme Toggle Button
    local themeButton = Instance.new("TextButton")
    themeButton.Text = "Change Theme"
    themeButton.Font = Enum.Font.SourceSans
    themeButton.TextSize = 20
    themeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    themeButton.Size = UDim2.new(0.5, 0, 0, 50)
    themeButton.Position = UDim2.new(0.25, 0, 0.2, 0)
    themeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    themeButton.Parent = background

    -- Button functionality for Theme change
    themeButton.MouseButton1Click:Connect(function()
        -- Cycle themes
        if background.BackgroundColor3 == Color3.fromRGB(30, 30, 30) then
            background.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Light theme
        else
            background.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Dark theme
        end
    end)

    -- Reset Button
    local resetButton = Instance.new("TextButton")
    resetButton.Text = "Reset Settings"
    resetButton.Font = Enum.Font.SourceSans
    resetButton.TextSize = 20
    resetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    resetButton.Size = UDim2.new(0.5, 0, 0, 50)
    resetButton.Position = UDim2.new(0.25, 0, 0.3, 0)
    resetButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    resetButton.Parent = background

    -- Reset functionality
    resetButton.MouseButton1Click:Connect(function()
        -- Reset to default settings (dark theme)
        background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        title.Text = "Bloxstrap Mobile Interface"
    end)

    -- Customization Button (Example of Game Settings)
    local customizeButton = Instance.new("TextButton")
    customizeButton.Text = "Customize Game Settings"
    customizeButton.Font = Enum.Font.SourceSans
    customizeButton.TextSize = 20
    customizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    customizeButton.Size = UDim2.new(0.5, 0, 0, 50)
    customizeButton.Position = UDim2.new(0.25, 0, 0.4, 0)
    customizeButton.BackgroundColor3 = Color3.fromRGB(100, 150, 200)
    customizeButton.Parent = background

    -- Button functionality for Game Customization (You can add specific game customizations here)
    customizeButton.MouseButton1Click:Connect(function()
        -- Placeholder for adding game customization functionality
        print("Game customization options go here.")
    end)

    -- Advanced Settings (Example of further customization)
    local advancedSettingsButton = Instance.new("TextButton")
    advancedSettingsButton.Text = "Advanced Settings"
    advancedSettingsButton.Font = Enum.Font.SourceSans
    advancedSettingsButton.TextSize = 20
    advancedSettingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    advancedSettingsButton.Size = UDim2.new(0.5, 0, 0, 50)
    advancedSettingsButton.Position = UDim2.new(0.25, 0, 0.5, 0)
    advancedSettingsButton.BackgroundColor3 = Color3.fromRGB(150, 100, 150)
    advancedSettingsButton.Parent = background

    -- Button functionality for Advanced Settings (Example: Reset, Graphics, etc.)
    advancedSettingsButton.MouseButton1Click:Connect(function()
        -- Placeholder for advanced settings functionality
        print("Advanced settings (e.g., graphics, reset) go here.")
    end)
end

-- Create the Window
CreateWindow()
