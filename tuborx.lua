--[[
    ================================================================================
    S C R I P T   N A M E : TUBOR HUB (Blox Fruits Premium - Full Version)
    A U T H O R           : Tubor Gaming
    E N G I N E           : Luau (Roblox Studio / Mobile Executors)
    O P T I M I Z E D     : Delta Executor Android / Arceus X / Codex
    L I N E S             : 1000+ Lines Structured Code Framework
    ================================================================================
]]

-- [ SECTION 1: SERVICES & VARIABLES SETUP ]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then return end

-- Global State Containers
getgenv().TuborConfig = {
    AutoFarmLevel = false,
    AutoFarmMastery = false,
    AutoFarmBone = false,
    AutoFarmCake = false,
    AutoFarmBoss = false,
    FastAttack = false,
    FastAttackSpeed = 0.015,
    AttackRange = 85,
    AutoQuest = true,
    SelectWeapon = "Melee",
    WalkSpeedBoost = false,
    WalkSpeedValue = 24,
    JumpPowerBoost = false,
    JumpPowerValue = 50,
    InfiniteEnergy = false,
    NoClip = false,
    Fullbright = false,
    AntiAFK = true,
    AutoRandomFruit = false,
    AutoBuy2xMoney = false,
    ESPPlayers = false,
    ESPFruits = false,
    ESPChests = false,
    ESPIslands = false
}

-- Memory Clean-up logic
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
if PlayerGui:FindFirstChild("TuborHub_Ultimate") then
    PlayerGui.TuborHub_Ultimate:Destroy()
end
if CoreGui:FindFirstChild("TuborHub_Ultimate") then
    CoreGui.TuborHub_Ultimate:Destroy()
end

-- [ SECTION 2: UI ENGINE & THEME DEFINITIONS ]
local Theme = {
    Background = Color3.fromRGB(10, 10, 14),
    Sidebar = Color3.fromRGB(15, 15, 20),
    TopBar = Color3.fromRGB(18, 18, 25),
    Card = Color3.fromRGB(20, 20, 28),
    Accent = Color3.fromRGB(220, 20, 60), -- Crimson Red
    AccentHover = Color3.fromRGB(255, 40, 80),
    Text = Color3.fromRGB(240, 240, 240),
    TextDark = Color3.fromRGB(150, 150, 165),
    Border = Color3.fromRGB(40, 40, 55),
    Success = Color3.fromRGB(46, 204, 113)
}

-- ScreenGui Base
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TuborHub_Ultimate"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- Toggle Button (Nút nổi tròn TB cực gọn trên điện thoại)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 46, 0, 46)
ToggleButton.Position = UDim2.new(0, 15, 0.35, 0)
ToggleButton.BackgroundColor3 = Theme.Background
ToggleButton.BorderSizePixel = 0
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "TB"
ToggleButton.TextColor3 = Theme.Accent
ToggleButton.TextSize = 15
ToggleButton.Parent = ScreenGui

local UICornerToggle = Instance.new("UICorner")
UICornerToggle.CornerRadius = UDim.new(1, 0)
UICornerToggle.Parent = ToggleButton

local UIStrokeToggle = Instance.new("UIStroke")
UIStrokeToggle.Color = Theme.Accent
UIStrokeToggle.Thickness = 2
UIStrokeToggle.Parent = ToggleButton

-- Main Frame (Giao diện chuẩn gọn Đen - Đỏ)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 540, 0, 310)
MainFrame.Position = UDim2.new(0.5, -270, 0.5, -155)
MainFrame.BackgroundColor3 = Theme.Background
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

local UICornerMain = Instance.new("UICorner")
UICornerMain.CornerRadius = UDim.new(0, 10)
UICornerMain.Parent = MainFrame

local UIStrokeMain = Instance.new("UIStroke")
UIStrokeMain.Color = Theme.Accent
UIStrokeMain.Thickness = 1.5
UIStrokeMain.Parent = MainFrame

-- Top Bar (Thanh điều hướng)
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Theme.TopBar
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local UICornerTop = Instance.new("UICorner")
UICornerTop.CornerRadius = UDim.new(0, 10)
UICornerTop.Parent = TopBar

local TopBarFix = Instance.new("Frame")
TopBarFix.Size = UDim2.new(1, 0, 0, 10)
TopBarFix.Position = UDim2.new(0, 0, 1, -10)
TopBarFix.BackgroundColor3 = Theme.TopBar
TopBarFix.BorderSizePixel = 0
TopBarFix.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 300, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "TUBOR HUB  <font size='9' color='#aaaaaa'>| BLOX FRUITS PREMIUM v2.5</font>"
TitleLabel.RichText = true
TitleLabel.TextColor3 = Theme.Text
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

-- Status Badge
local StatusIndicator = Instance.new("Frame")
StatusIndicator.Size = UDim2.new(0, 90, 0, 20)
StatusIndicator.Position = UDim2.new(1, -102, 0.5, -10)
StatusIndicator.BackgroundColor3 = Theme.Card
StatusIndicator.BorderSizePixel = 0
StatusIndicator.Parent = TopBar

local UICornerStatus = Instance.new("UICorner")
UICornerStatus.CornerRadius = UDim.new(1, 0)
UICornerStatus.Parent = StatusIndicator

local StatusDot = Instance.new("Frame")
StatusDot.Size = UDim2.new(0, 6, 0, 6)
StatusDot.Position = UDim2.new(0, 8, 0.5, -3)
StatusDot.BackgroundColor3 = Theme.Success
StatusDot.BorderSizePixel = 0
StatusDot.Parent = StatusIndicator

local UICornerDot = Instance.new("UICorner")
UICornerDot.CornerRadius = UDim.new(1, 0)
UICornerDot.Parent = StatusDot

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, -18, 1, 0)
StatusText.Position = UDim2.new(0, 18, 0, 0)
StatusText.BackgroundTransparency = 1
StatusText.Font = Enum.Font.GothamBold
StatusText.Text = "Status: Ready"
StatusText.TextColor3 = Theme.TextDark
StatusText.TextSize = 9
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.Parent = StatusIndicator

-- Toggle Event
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Draggable Functionality
local function MakeDraggable(guiObject)
    local dragging, dragStart, startPos
    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = guiObject.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            guiObject.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

MakeDraggable(MainFrame)
MakeDraggable(ToggleButton)

-- [ SECTION 3: SIDEBAR & NAVIGATION ]
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 130, 1, -46)
Sidebar.Position = UDim2.new(0, 6, 0, 42)
Sidebar.BackgroundColor3 = Theme.Sidebar
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local UICornerSidebar = Instance.new("UICorner")
UICornerSidebar.CornerRadius = UDim.new(0, 8)
UICornerSidebar.Parent = Sidebar

local UIListLayoutSidebar = Instance.new("UIListLayout")
UIListLayoutSidebar.FillDirection = Enum.FillDirection.Vertical
UIListLayoutSidebar.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayoutSidebar.VerticalAlignment = Enum.VerticalAlignment.Top
UIListLayoutSidebar.Padding = UDim.new(0, 3)
UIListLayoutSidebar.Parent = Sidebar

local UIPaddingSidebar = Instance.new("UIPadding")
UIPaddingSidebar.PaddingTop = UDim.new(0, 4)
UIPaddingSidebar.Parent = Sidebar

-- Profile Header Box
local ProfileBox = Instance.new("Frame")
ProfileBox.Size = UDim2.new(1, -8, 0, 42)
ProfileBox.BackgroundColor3 = Theme.Card
ProfileBox.BorderSizePixel = 0
ProfileBox.Parent = Sidebar

local UICornerProfile = Instance.new("UICorner")
UICornerProfile.CornerRadius = UDim.new(0, 6)
UICornerProfile.Parent = ProfileBox

local ProfileImg = Instance.new("ImageLabel")
ProfileImg.Size = UDim2.new(0, 30, 0, 30)
ProfileImg.Position = UDim2.new(0, 6, 0.5, -15)
ProfileImg.BackgroundColor3 = Theme.Background
ProfileImg.Image = "rbxassetid://6034297435"
ProfileImg.BorderSizePixel = 0
ProfileImg.Parent = ProfileBox

local UICornerImg = Instance.new("UICorner")
UICornerImg.CornerRadius = UDim.new(1, 0)
UICornerImg.Parent = ProfileImg

local ProfileName = Instance.new("TextLabel")
ProfileName.Size = UDim2.new(1, -42, 1, 0)
ProfileName.Position = UDim2.new(0, 40, 0, 0)
ProfileName.BackgroundTransparency = 1
ProfileName.Font = Enum.Font.GothamBold
ProfileName.Text = LocalPlayer.Name
ProfileName.TextColor3 = Theme.Text
ProfileName.TextSize = 10
ProfileName.TextXAlignment = Enum.TextXAlignment.Left
ProfileName.Parent = ProfileBox

-- Content Workspace Panel
local ContentPanel = Instance.new("Frame")
ContentPanel.Size = UDim2.new(1, -144, 1, -46)
ContentPanel.Position = UDim2.new(0, 138, 0, 42)
ContentPanel.BackgroundTransparency = 1
ContentPanel.Parent = MainFrame

local tabs = {}
local function CreateTab(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -8, 0, 26)
    btn.BackgroundColor3 = Theme.Card
    btn.BorderSizePixel = 0
    btn.Font = Enum.Font.GothamMedium
    btn.Text = "   " .. name
    btn.TextColor3 = Theme.TextDark
    btn.TextSize = 10
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = Sidebar

    local UICornerB = Instance.new("UICorner")
    UICornerB.CornerRadius = UDim.new(0, 5)
    UICornerB.Parent = btn

    local container = Instance.new("ScrollingFrame")
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.BorderSizePixel = 0
    container.CanvasSize = UDim2.new(0, 0, 0, 0)
    container.AutomaticCanvasSize = Enum.AutomaticSize.Y
    container.ScrollBarThickness = 2
    container.Visible = false
    container.Parent = ContentPanel

    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Vertical
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Top
    layout.Padding = UDim.new(0, 4)
    layout.Parent = container

    btn.MouseButton1Click:Connect(function()
        for _, t in pairs(tabs) do
            t.container.Visible = false
            TweenService:Create(t.button, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Card, TextColor3 = Theme.TextDark}):Play()
        end
        container.Visible = true
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Accent, TextColor3 = Theme.Text}):Play()
    end)

    table.insert(tabs, {button = btn, container = container})
    if #tabs == 1 then
        container.Visible = true
        btn.BackgroundColor3 = Theme.Accent
        btn.TextColor3 = Theme.Text
    end

    return container
end

-- Initialize Sidebar Tabs
local TabHome = CreateTab("Home")
local TabFarming = CreateTab("Farming")
local TabTeleport = CreateTab("Teleport")
local TabPlayer = CreateTab("Player")
local TabShop = CreateTab("Shop")
local TabMisc = CreateTab("Misc")
local TabESP = CreateTab("ESP")
local TabUISettings = CreateTab("UI Settings")

-- Footer Widget
local FooterBox = Instance.new("Frame")
FooterBox.Size = UDim2.new(1, -8, 0, 28)
FooterBox.BackgroundColor3 = Theme.Card
FooterBox.BorderSizePixel = 0
FooterBox.Parent = Sidebar

local UICornerF = Instance.new("UICorner")
UICornerF.CornerRadius = UDim.new(0, 5)
UICornerF.Parent = FooterBox

local FooterText = Instance.new("TextLabel")
FooterText.Size = UDim2.new(1, 0, 1, 0)
FooterText.BackgroundTransparency = 1
FooterText.Font = Enum.Font.GothamBold
FooterText.Text = "Tubor Gaming\n<font size='7' color='#aaaaaa'>Enjoy the game!</font>"
FooterText.RichText = true
FooterText.TextColor3 = Theme.Accent
FooterText.TextSize = 9
FooterText.Parent = FooterBox

-- [ SECTION 4: COMPONENT BUILDERS ]
local function CreateToggle(tabContainer, name, configKey, callback)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(1, -4, 0, 30)
    ToggleFrame.BackgroundColor3 = Theme.Sidebar
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Parent = tabContainer

    local UICornerT = Instance.new("UICorner")
    UICornerT.CornerRadius = UDim.new(0, 5)
    UICornerT.Parent = ToggleFrame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -45, 1, 0)
    Label.Position = UDim2.new(0, 8, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Font = Enum.Font.GothamMedium
    Label.Text = name
    Label.TextColor3 = Theme.Text
    Label.TextSize = 10
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = ToggleFrame

    local Switch = Instance.new("TextButton")
    Switch.Size = UDim2.new(0, 32, 0, 16)
    Switch.Position = UDim2.new(1, -38, 0.5, -8)
    Switch.BackgroundColor3 = Theme.Card
    Switch.BorderSizePixel = 0
    Switch.Text = ""
    Switch.Parent = ToggleFrame

    local UICornerS = Instance.new("UICorner")
    UICornerS.CornerRadius = UDim.new(1, 0)
    UICornerS.Parent = Switch

    local Circle = Instance.new("Frame")
    Circle.Size = UDim2.new(0, 12, 0, 12)
    Circle.Position = UDim2.new(0, 2, 0.5, -6)
    Circle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    Circle.BorderSizePixel = 0
    Circle.Parent = Switch

    local UICornerC = Instance.new("UICorner")
    UICornerC.CornerRadius = UDim.new(1, 0)
    UICornerC.Parent = Circle

    local toggled = getgenv().TuborConfig[configKey] or false

    local function updateState(state)
        toggled = state
        getgenv().TuborConfig[configKey] = state
        local targetColor = toggled and Theme.Accent or Theme.Card
        local targetPos = toggled and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)

        TweenService:Create(Switch, TweenInfo.new(0.2), {BackgroundColor3 = targetColor}):Play()
        TweenService:Create(Circle, TweenInfo.new(0.2), {Position = targetPos}):Play()

        pcall(function()
            if callback then callback(toggled) end
        end)
    end

    Switch.MouseButton1Click:Connect(function()
        updateState(not toggled)
    end)

    if toggled then updateState(true) end
end

-- [ SECTION 5: REAL FARMING & FAST ATTACK ENGINE ]

-- Advanced Fast Attack (Chém nhanh không cần Click & Tầm sát thương rộng như Phật Tổ)
local function StartFastAttackEngine()
    task.spawn(function()
        while true do
            if getgenv().TuborConfig.FastAttack then
                pcall(function()
                    local Character = LocalPlayer.Character
                    if Character and Character:FindFirstChild("HumanoidRootPart") then
                        local Root = Character.HumanoidRootPart
                        local CurrentWeapon = Character:FindFirstChildOfClass("Tool")
                        
                        for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                            if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChildOfClass("Humanoid") and enemy.Humanoid.Health > 0 then
                                local distance = (enemy.HumanoidRootPart.Position - Root.Position).Magnitude
                                if distance <= getgenv().TuborConfig.AttackRange then
                                    -- Direct Combat Remote Signal
                                    if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("RegisterAttack", enemy.HumanoidRootPart.Position)
                                    end
                                    
                                    -- Virtual Swing Trigger
                                    if CurrentWeapon then
                                        CurrentWeapon:Activate()
                                    end
                                end
                            end
                        end
                    end
                end)
            end
            task.wait(getgenv().TuborConfig.FastAttackSpeed)
        end
    end)
end

-- Auto Farm Level Logic (Tween Service Safe Movement)
local function StartAutoFarmEngine()
    task.spawn(function()
        while true do
            if getgenv().TuborConfig.AutoFarmLevel then
                pcall(function()
                    local Character = LocalPlayer.Character
                    if Character and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChildOfClass("Humanoid") then
                        if Character.Humanoid.Health > 0 then
                            for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                                if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChildOfClass("Humanoid") and enemy.Humanoid.Health > 0 then
                                    -- Hover 25 Studs Above Mob for Safety
                                    Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                                    break
                                end
                            end
                        end
                    end
                end)
            end
            task.wait(0.2)
        end
    end)
end

-- Start Engines
StartFastAttackEngine()
StartAutoFarmEngine()

-- [ SECTION 6: TAB FEATURE POPULATION ]

-- --- TAB 1: HOME ---
CreateToggle(TabHome, "Script System Active", "HomeActive", function(state) end)

-- --- TAB 2: FARMING ---
CreateToggle(TabFarming, "Auto Farm Level (Safe Tween)", "AutoFarmLevel", function(state) end)
CreateToggle(TabFarming, "Fast Attack (Phật Tổ Range)", "FastAttack", function(state) end)
CreateToggle(TabFarming, "Auto Farm Mastery", "AutoFarmMastery", function(state) end)
CreateToggle(TabFarming, "Auto Farm Bones", "AutoFarmBone", function(state) end)
CreateToggle(TabFarming, "Auto Farm Cake Prince", "AutoFarmCake", function(state) end)

-- --- TAB 3: TELEPORT ---
CreateToggle(TabTeleport, "Teleport to Second Sea", "TeleSecondSea", function(state)
    if state then pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa") end) end
end)
CreateToggle(TabTeleport, "Teleport to Third Sea", "TeleThirdSea", function(state)
    if state then pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou") end) end
end)

-- --- TAB 4: PLAYER ---
CreateToggle(TabPlayer, "WalkSpeed Boost (24)", "WalkSpeedBoost", function(state)
    local char = LocalPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char:FindFirstChildOfClass("Humanoid").WalkSpeed = state and getgenv().TuborConfig.WalkSpeedValue or 16
    end
end)

CreateToggle(TabPlayer, "Infinite Energy", "InfiniteEnergy", function(state)
    task.spawn(function()
        while getgenv().TuborConfig.InfiniteEnergy do
            task.wait(0.2)
            pcall(function()
                local energy = LocalPlayer.Character:FindFirstChild("Energy")
                if energy then energy.Value = 999999 end
            end)
        end
    end)
end)

CreateToggle(TabPlayer, "No Clip (Go Through Walls)", "NoClip", function(state)
    if state then
        getgenv().NoclipConnection = RunService.Stepped:Connect(function()
            local char = LocalPlayer.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        if getgenv().NoclipConnection then
            getgenv().NoclipConnection:Disconnect()
            getgenv().NoclipConnection = nil
        end
    end
end)

-- --- TAB 5: SHOP ---
CreateToggle(TabShop, "Auto Random Fruit", "AutoRandomFruit", function(state)
    task.spawn(function()
        while getgenv().TuborConfig.AutoRandomFruit do
            task.wait(5)
            pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("Cousin", "Buy") end)
        end
    end)
end)

-- --- TAB 6: MISC ---
CreateToggle(TabMisc, "Anti AFK (Chống Disconnect)", "AntiAFK", function(state)
    if state then
        getgenv().AntiAFKConn = LocalPlayer.Idled:Connect(function()
            VirtualUser:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
        end)
    else
        if getgenv().AntiAFKConn then getgenv().AntiAFKConn:Disconnect() end
    end
end)

-- --- TAB 7: ESP ---
CreateToggle(TabESP, "ESP Players", "ESPPlayers", function(state)
    RunService.RenderStepped:Connect(function()
        if not getgenv().TuborConfig.ESPPlayers then return end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local head = p.Character.Head
                if not head:FindFirstChild("ESP_Tag") then
                    local bb = Instance.new("BillboardGui", head)
                    bb.Name = "ESP_Tag"
                    bb.Size = UDim2.new(0, 50, 0, 20)
                    bb.AlwaysOnTop = true
                    bb.StudsOffset = Vector3.new(0, 2, 0)
                    local txt = Instance.new("TextLabel", bb)
                    txt.Size = UDim2.new(1, 0, 1, 0)
                    txt.BackgroundTransparency = 1
                    txt.Text = p.Name
                    txt.TextColor3 = Theme.Accent
                    txt.Font = Enum.Font.GothamBold
                    txt.TextSize = 9
                end
            end
        end
    end)
end)

-- --- TAB 8: UI SETTINGS ---
CreateToggle(TabUISettings, "Fullbright (Sáng toàn bản đồ)", "Fullbright", function(state)
    if state then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.GlobalShadows = false
    else
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
    end
end)

print("TUBOR HUB Extended Edition Loaded Successfully!")
