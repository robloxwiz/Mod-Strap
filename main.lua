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
    background.BorderSizePixel = 0 -- Remove border for smooth edges
    background.Parent = window

    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Dark gray bar
    titleBar.Parent = background

    -- Title Label
    local title = Instance.new("TextLabel")
    title.Text = "Bloxstrap Mobile Interface"
    title.Font = Enum.Font.SourceSans
    title.TextSize = 24
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Size = UDim2.new(0.9, 0, 1, 0)
    title.Position = UDim2.new(0.05, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Parent = titleBar

    -- Minimize Button
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Text = "-"
    minimizeButton.Font = Enum.Font.SourceSans
    minimizeButton.TextSize = 20
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.Size = UDim2.new(0.1, 0, 1, 0)
    minimizeButton.Position = UDim2.new(0.9, 0, 0, 0)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    minimizeButton.Parent = titleBar

    -- Close Button
    local closeButton = Instance.new("TextButton")
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.SourceSans
    closeButton.TextSize = 20
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Size = UDim2.new(0.1, 0, 1, 0)
    closeButton.Position = UDim2.new(0.8, 0, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    closeButton.Parent = titleBar

    -- Minimize functionality
    minimizeButton.MouseButton1Click:Connect(function()
        window.Enabled = false -- Minimize the window
    end)

    -- Close functionality
    closeButton.MouseButton1Click:Connect(function()
        window:Destroy() -- Close the window
    end)

    -- Main Content Frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 0.85, 0)
    contentFrame.Position = UDim2.new(0, 0, 0.1, 0)
    contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- Slightly lighter than background
    contentFrame.Parent = background

    -- Theme Toggle Button
    local themeButton = Instance.new("TextButton")
    themeButton.Text = "Change Theme"
    themeButton.Font = Enum.Font.SourceSans
    themeButton.TextSize = 20
    themeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    themeButton.Size = UDim2.new(0.8, 0, 0.1, 0)
    themeButton.Position = UDim2.new(0.1, 0, 0.1, 0)
    themeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    themeButton.Parent = contentFrame

    -- Button functionality for Theme change
    themeButton.MouseButton1Click:Connect(function()
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
    resetButton.Size = UDim2.new(0.8, 0, 0.1, 0)
    resetButton.Position = UDim2.new(0.1, 0, 0.3, 0)
    resetButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    resetButton.Parent = contentFrame

    -- Reset functionality
    resetButton.MouseButton1Click:Connect(function()
        background.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Reset to dark theme
        title.Text = "Bloxstrap Mobile Interface" -- Reset title text
    end)

    -- Customize Game Settings Button
    local customizeButton = Instance.new("TextButton")
    customizeButton.Text = "Customize Game Settings"
    customizeButton.Font = Enum.Font.SourceSans
    customizeButton.TextSize = 20
    customizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    customizeButton.Size = UDim2.new(0.8, 0, 0.1, 0)
    customizeButton.Position = UDim2.new(0.1, 0, 0.5, 0)
    customizeButton.BackgroundColor3 = Color3.fromRGB(100, 150, 200)
    customizeButton.Parent = contentFrame

    -- Placeholder functionality for Game Customization
    customizeButton.MouseButton1Click:Connect(function()
        print("Game customization options go here.")
    end)

    -- Advanced Settings Button
    local advancedSettingsButton = Instance.new("TextButton")
    advancedSettingsButton.Text = "Advanced Settings"
    advancedSettingsButton.Font = Enum.Font.SourceSans
    advancedSettingsButton.TextSize = 20
    advancedSettingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    advancedSettingsButton.Size = UDim2.new(0.8, 0, 0.1, 0)
    advancedSettingsButton.Position = UDim2.new(0.1, 0, 0.7, 0)
    advancedSettingsButton.BackgroundColor3 = Color3.fromRGB(150, 100, 150)
    advancedSettingsButton.Parent = contentFrame

    -- Placeholder functionality for Advanced Settings
    advancedSettingsButton.MouseButton1Click:Connect(function()
        print("Advanced settings (e.g., graphics, reset) go here.")
    end)
end

-- Create the Window
CreateWindow()
