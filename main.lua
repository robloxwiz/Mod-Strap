-- Optimized and Fully Functional Rayfield Library Implementation with All Categories

local RayfieldLibrary = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Hidden = false
local Debounce = false
local searchOpen = false

local function closeSearch()
    searchOpen = false
    if Main and Main.Search and Main.Search.Input then
        Main.Search.Input.Text = ""
        Main.Search.Visible = false
    end
end

local function openSearch()
    searchOpen = true
    if Main and Main.Search then
        Main.Search.Visible = true
        if Main.Search.Input then
            Main.Search.Input:CaptureFocus()
        end
    end
end

if Main and Main.Search and Main.Search.Input then
    Main.Search.Input.FocusLost:Connect(function(enterPressed)
        if #Main.Search.Input.Text == 0 and searchOpen then
            task.wait(0.12)
            closeSearch()
        end
    end)
end

if Topbar and Topbar.Search then
    Topbar.Search.MouseButton1Click:Connect(function()
        task.spawn(function()
            if searchOpen then
                closeSearch()
            else
                openSearch()
            end
        end)
    end)
end

if Topbar and Topbar:FindFirstChild('Settings') then
    Topbar.Settings.MouseButton1Click:Connect(function()
        task.spawn(function()
            if TabList then
                for _, OtherTabButton in ipairs(TabList:GetChildren()) do
                    if OtherTabButton:IsA("Frame") and OtherTabButton.Name ~= "Template" and OtherTabButton.Name ~= "Placeholder" then
                        TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.TabBackground, BackgroundTransparency = 0.7}):Play()
                        TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextColor3 = SelectedTheme.TabTextColor, TextTransparency = 0.2}):Play()
                        TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageColor3 = SelectedTheme.TabTextColor, ImageTransparency = 0.2}):Play()
                    end
                end
            end
            if Elements and Elements.UIPageLayout then
                Elements.UIPageLayout:JumpTo(Elements['Rayfield Settings'])
            end
        end)
    end)
end

if Topbar and Topbar.Hide then
    Topbar.Hide.MouseButton1Click:Connect(function()
        Hidden = not Hidden
        if setVisibility then
            setVisibility(Hidden, not useMobileSizing)
        end
    end)
end

UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode[(settingsTable and settingsTable.General and settingsTable.General.rayfieldOpen and settingsTable.General.rayfieldOpen.Value) or 'K'] then
        if Debounce then return end
        Hidden = not Hidden
        if Hidden and Hide then Hide() elseif Unhide then Unhide() end
    end
end)

if MPrompt and MPrompt.Interact then
    MPrompt.Interact.MouseButton1Click:Connect(function()
        if not Debounce and Hidden then
            Hidden = false
            if Unhide then Unhide() end
        end
    end)
end

if Topbar then
    for _, TopbarButton in ipairs(Topbar:GetChildren()) do
        if TopbarButton:IsA("ImageButton") and TopbarButton.Name ~= 'Icon' then
            TopbarButton.MouseEnter:Connect(function()
                TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
            end)
            TopbarButton.MouseLeave:Connect(function()
                TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.8}):Play()
            end)
        end
    end
end

function RayfieldLibrary:LoadConfiguration()
    local config, notified, loaded
    if useStudio then
        config = [[{"Toggle1":true,"Slider1":100,"Input1":"Test","Dropdown1":["Ocean"]}]]
    end
    if CEnabled then
        local success, result = pcall(function()
            if useStudio and config then
                loaded = LoadConfiguration(config)
                return
            end
            if isfile and isfile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension) then
                loaded = LoadConfiguration(readfile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension))
            else
                notified = true
                if RayfieldLibrary.Notify then
                    RayfieldLibrary:Notify({Title = "Rayfield Configurations", Content = "Configuration saving not enabled.", Image = 4384402990})
                end
            end
        end)
        if success and loaded and not notified then
            if RayfieldLibrary.Notify then
                RayfieldLibrary:Notify({Title = "Configuration Loaded", Content = "Configuration successfully loaded.", Image = 4384403532})
            end
        elseif not success then
            warn('Error Loading Configuration | '..tostring(result))
            if RayfieldLibrary.Notify then
                RayfieldLibrary:Notify({Title = "Error", Content = "Failed to load configuration.", Image = 4384402990})
            end
        end
    end
end

task.delay(4, function()
    RayfieldLibrary:LoadConfiguration()
    if Main and Main:FindFirstChild('Notice') and Main.Notice.Visible then
        TweenService:Create(Main.Notice, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 100, 0, 25), Position = UDim2.new(0.5, 0, 0, -100), BackgroundTransparency = 1}):Play()
        TweenService:Create(Main.Notice.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
        task.wait(0.5)
        Main.Notice.Visible = false
    end
end)

return RayfieldLibrary
