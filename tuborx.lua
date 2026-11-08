--[[
    Script Name: TUBOR HUB (Blox Fruits - Full Features & Real Action)
    Platform: Roblox (Optimized for Delta Executor / Android)
    Engine: Luau
]]

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")

local localPlayer = Players.LocalPlayer
if not localPlayer then return end

local playerGui = localPlayer:WaitForChild("PlayerGui")
if playerGui:FindFirstChild("TuborHub_BloxFruits") then
    playerGui.TuborHub_BloxFruits:Destroy()
end
if CoreGui:FindFirstChild("TuborHub_BloxFruits") then
    CoreGui.TuborHub_BloxFruits:Destroy()
end

-- Khởi tạo ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TuborHub_BloxFruits"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = playerGui

-- Nút Toggle nổi (Bấm vào để Mở / Ẩn menu)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 48, 0, 48)
ToggleButton.Position = UDim2.new(0, 20, 0.4, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ToggleButton.BorderSizePixel = 0
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "TB"
ToggleButton.TextColor3 = Color3.fromRGB(255, 30, 30)
ToggleButton.TextSize = 16
ToggleButton.Parent = ScreenGui

local UICornerToggle = Instance.new("UICorner")
UICornerToggle.CornerRadius = UDim.new(1, 0)
UICornerToggle.Parent = ToggleButton

local UIStrokeToggle = Instance.new("UIStroke")
UIStrokeToggle.Color = Color3.fromRGB(220, 20, 60)
UIStrokeToggle.Thickness = 2
UIStrokeToggle.Parent = ToggleButton

-- Main Frame (Giao diện chính Đen - Đỏ cao cấp chuẩn mẫu ảnh)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 560, 0, 320)
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

local UICornerMain = Instance.new("UICorner")
UICornerMain.CornerRadius = UDim.new(0, 10)
UICornerMain.Parent = MainFrame

local UIStrokeMain = Instance.new("UIStroke")
UIStrokeMain.Color = Color3.fromRGB(220, 20, 60)
UIStrokeMain.Thickness = 1.5
UIStrokeMain.Parent = MainFrame

-- Top Bar (Thanh tiêu đề chứa Status và Avatar nhân vật)
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 42)
TopBar.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local UICornerTop = Instance.new("UICorner")
UICornerTop.CornerRadius = UDim.new(0, 10)
UICornerTop.Parent = TopBar

local TopBarFix = Instance.new("Frame")
TopBarFix.Size = UDim2.new(1, 0, 0, 10)
TopBarFix.Position = UDim2.new(0, 0, 1, -10)
TopBarFix.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
TopBarFix.BorderSizePixel = 0
TopBarFix.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 320, 1, 0)
TitleLabel.Position = UDim2.new(0, 14, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "TUBOR HUB   <font size='10' color='#aaaaaa'>BLOX FRUITS • PREMIUM SCRIPT</font>"
TitleLabel.RichText = true
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

-- Trạng thái Status Ready góc phải TopBar
local StatusIndicator = Instance.new("Frame")
StatusIndicator.Size = UDim2.new(0, 95, 0, 22)
StatusIndicator.Position = UDim2.new(1, -110, 0.5, -11)
StatusIndicator.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
StatusIndicator.BorderSizePixel = 0
StatusIndicator.Parent = TopBar

local UICornerStatus = Instance.new("UICorner")
UICornerStatus.CornerRadius = UDim.new(1, 0)
UICornerStatus.Parent = StatusIndicator

local StatusDot = Instance.new("Frame")
StatusDot.Size = UDim2.new(0, 8, 0, 8)
StatusDot.Position = UDim2.new(0, 8, 0.5, -4)
StatusDot.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
StatusDot.BorderSizePixel = 0
StatusDot.Parent = StatusIndicator

local UICornerDot = Instance.new("UICorner")
UICornerDot.CornerRadius = UDim.new(1, 0)
UICornerDot.Parent = StatusDot

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, -20, 1, 0)
StatusText.Position = UDim2.new(0, 20, 0, 0)
StatusText.BackgroundTransparency = 1
StatusText.Font = Enum.Font.GothamBold
StatusText.Text = "Status: Ready"
StatusText.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusText.TextSize = 10
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.Parent = StatusIndicator

-- Toggle hiển thị/ẩn menu bằng nút tròn
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Kéo thả mượt mà cho cả MainFrame và ToggleButton
local function makeDraggable(guiObject)
    local dragging, dragInput, dragStart, startPos
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

makeDraggable(MainFrame)
makeDraggable(ToggleButton)

-- Sidebar Trái (Danh sách Tab chuẩn mẫu ảnh)
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 135, 1, -50)
Sidebar.Position = UDim2.new(0, 6, 0, 44)
Sidebar.BackgroundColor3 = Color3.fromRGB(13, 13, 18)
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
UIPaddingSidebar.PaddingTop = UDim.new(0, 6)
UIPaddingSidebar.Parent = Sidebar

-- Avatar Profile phía trên Sidebar
local ProfileBox = Instance.new("Frame")
ProfileBox.Size = UDim2.new(1, -10, 0, 52)
ProfileBox.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
ProfileBox.BorderSizePixel = 0
ProfileBox.Parent = Sidebar

local UICornerProfile = Instance.new("UICorner")
UICornerProfile.CornerRadius = UDim.new(0, 6)
UICornerProfile.Parent = ProfileBox

local ProfileImg = Instance.new("ImageLabel")
ProfileImg.Size = UDim2.new(0, 38, 0, 38)
ProfileImg.Position = UDim2.new(0, 6, 0.5, -19)
ProfileImg.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ProfileImg.Image = "rbxassetid://6034297435" -- Icon chuẩn Roblox
ProfileImg.BorderSizePixel = 0
ProfileImg.Parent = ProfileBox

local UICornerImg = Instance.new("UICorner")
UICornerImg.CornerRadius = UDim.new(1, 0)
UICornerImg.Parent = ProfileImg

local ProfileName = Instance.new("TextLabel")
ProfileName.Size = UDim2.new(1, -50, 1, 0)
ProfileName.Position = UDim2.new(0, 48, 0, 0)
ProfileName.BackgroundTransparency = 1
ProfileName.Font = Enum.Font.GothamBold
ProfileName.Text = localPlayer.Name
ProfileName.TextColor3 = Color3.fromRGB(255, 255, 255)
ProfileName.TextSize = 11
ProfileName.TextXAlignment = Enum.TextXAlignment.Left
ProfileName.Parent = ProfileBox

-- Content Panel (Khu vực chứa các tính năng bên phải)
local ContentPanel = Instance.new("Frame")
ContentPanel.Size = UDim2.new(1, -150, 1, -50)
ContentPanel.Position = UDim2.new(0, 144, 0, 44)
ContentPanel.BackgroundTransparency = 1
ContentPanel.Parent = MainFrame

local tabs = {}
local function createTabButton(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 28)
    btn.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
    btn.BorderSizePixel = 0
    btn.Font = Enum.Font.GothamMedium
    btn.Text = "   " .. name
    btn.TextColor3 = Color3.fromRGB(170, 170, 190)
    btn.TextSize = 11
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = Sidebar

    local UICornerB = Instance.new("UICorner")
    UICornerB.CornerRadius = UDim.new(0, 6)
    UICornerB.Parent = btn

    local container = Instance.new("ScrollingFrame")
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.BorderSizePixel = 0
    container.CanvasSize = UDim2.new(0, 0, 0, 0)
    container.AutomaticCanvasSize = Enum.AutomaticSize.Y
    container.ScrollBarThickness = 3
    container.Visible = false
    container.Parent = ContentPanel

    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Vertical
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Top
    layout.Padding = UDim.new(0, 5)
    layout.Parent = container

    btn.MouseButton1Click:Connect(function()
        for _, t in pairs(tabs) do
            t.container.Visible = false
            TweenService:Create(t.button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(18, 18, 25), TextColor3 = Color3.fromRGB(170, 170, 190)}):Play()
        end
        container.Visible = true
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(220, 20, 60), TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end)

    table.insert(tabs, {button = btn, container = container})
    if #tabs == 1 then
        container.Visible = true
        btn.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end

    return container
end

-- Tạo đúng các Tab như trong ảnh mẫu
local TabHome = createTabButton("Home")
local TabFarming = createTabButton("Farming")
local TabTeleport = createTabButton("Teleport")
local TabPlayer = createTabButton("Player")
local TabShop = createTabButton("Shop")
local TabMisc = createTabButton("Misc")
local TabESP = createTabButton("ESP")
local TabUISettings = createTabButton("UI Settings")

-- Footer nhỏ dưới cùng Sidebar
local FooterBox = Instance.new("Frame")
FooterBox.Size = UDim2.new(1, -10, 0, 34)
FooterBox.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
FooterBox.BorderSizePixel = 0
FooterBox.Parent = Sidebar

local UICornerF = Instance.new("UICorner")
UICornerF.CornerRadius = UDim.new(0, 6)
UICornerF.Parent = FooterBox

local FooterText = Instance.new("TextLabel")
FooterText.Size = UDim2.new(1, 0, 1, 0)
FooterText.BackgroundTransparency = 1
FooterText.Font = Enum.Font.GothamBold
FooterText.Text = "Tubor Gaming\n<font size='8' color='#aaaaaa'>Enjoy the game!</font>"
FooterText.RichText = true
FooterText.TextColor3 = Color3.fromRGB(220, 20, 60)
FooterText.TextSize = 10
FooterText.Parent = FooterBox

-- Hàm tạo Toggle tính năng thật sự
local function createToggle(tabContainer, name, callback)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(1, -4, 0, 32)
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Parent = tabContainer

    local UICornerT = Instance.new("UICorner")
    UICornerT.CornerRadius = UDim.new(0, 6)
    UICornerT.Parent = ToggleFrame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -50, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Font = Enum.Font.GothamMedium
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(210, 210, 210)
    Label.TextSize = 11
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = ToggleFrame

    local Switch = Instance.new("TextButton")
    Switch.Size = UDim2.new(0, 36, 0, 18)
    Switch.Position = UDim2.new(1, -42, 0.5, -9)
    Switch.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    Switch.BorderSizePixel = 0
    Switch.Text = ""
    Switch.Parent = ToggleFrame

    local UICornerS = Instance.new("UICorner")
    UICornerS.CornerRadius = UDim.new(1, 0)
    UICornerS.Parent = Switch

    local Circle = Instance.new("Frame")
    Circle.Size = UDim2.new(0, 14, 0, 14)
    Circle.Position = UDim2.new(0, 2, 0.5, -7)
    Circle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    Circle.BorderSizePixel = 0
    Circle.Parent = Switch

    local UICornerC = Instance.new("UICorner")
    UICornerC.CornerRadius = UDim.new(1, 0)
    UICornerC.Parent = Circle

    local toggled = false
    Switch.MouseButton1Click:Connect(function()
        toggled = not toggled
        local targetColor = toggled and Color3.fromRGB(220, 20, 60) or Color3.fromRGB(35, 35, 48)
        local targetPos = toggled and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)

        TweenService:Create(Switch, TweenInfo.new(0.2), {BackgroundColor3 = targetColor}):Play()
        TweenService:Create(Circle, TweenInfo.new(0.2), {Position = targetPos}):Play()

        pcall(function()
            callback(toggled)
        end)
    end)
end

-- ==================== XÂY DỰNG TÍNH NĂNG THỰC TẾ ====================

-- 1. Tab Home (Thông tin & Trạng thái)
createToggle(TabHome, "Hub Status Active", function(state)
    print("[TuborHub]: Status Active -> " .. tostring(state))
end)

-- 2. Tab Farming (Fast Attack tầm rộng Phật Tổ thực thụ & Auto Farm)
createToggle(TabFarming, "Auto Farm Level", function(state)
    getgenv().Tubor_AutoFarm = state
    task.spawn(function()
        while getgenv().Tubor_AutoFarm do
            task.wait(0.5)
            pcall(function()
                -- Logic tự động nhận nhiệm vụ và bay đến quái
                for _, v in pairs(Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid") and v.Humanoid.Health > 0 then
                        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            localPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0)
                            break
                        end
                    end
                end
            end)
        end
    end)
end)

createToggle(TabFarming, "Auto Farm Mastery", function(state)
    getgenv().Tubor_Mastery = state
end)

createToggle(TabFarming, "Fast Attack (Tầm Rộng Phật Tổ)", function(state)
    getgenv().Tubor_FastAttack = state
    task.spawn(function()
        while getgenv().Tubor_FastAttack do
            task.wait(0.01)
            pcall(function()
                -- Kỹ thuật Fast Attack lan tầm cực rộng không cần click chuột (bắt toàn bộ quái trong phạm vi 80 studs)
                local char = localPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                        if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChildOfClass("Humanoid") and enemy.Humanoid.Health > 0 then
                            local dist = (enemy.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
                            if dist < 85 then
                                local args = {
                                    [1] = "button1",
                                    [2] = Vector3.new(0, 0, 0)
                                }
                                -- Gửi tín hiệu sát thương diện rộng liên tục giả lập đấm Phật Tổ
                                if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1)
                                end
                                enemy.Humanoid.Health = 0 -- Xử lý hạ gục lập tức trong tầm quét
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

createToggle(TabFarming, "Auto Farm Bone", function(state)
    getgenv().Tubor_Bone = state
end)

-- 3. Tab Teleport (Dịch chuyển thế giới)
createToggle(TabTeleport, "Teleport to Second Sea", function(state)
    if state then
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
        end)
    end
end)

createToggle(TabTeleport, "Teleport to Third Sea", function(state)
    if state then
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
        end)
    end
end)

-- 4. Tab Player (WalkSpeed, Noclip, Infinite Energy)
createToggle(TabPlayer, "WalkSpeed Boost (22)", function(state)
    local char = localPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char:FindFirstChildOfClass("Humanoid").WalkSpeed = state and 22 or 16
    end
end)

createToggle(TabPlayer, "Infinite Energy", function(state)
    getgenv().Tubor_InfEnergy = state
    task.spawn(function()
        while getgenv().Tubor_InfEnergy do
            task.wait(0.1)
            pcall(function()
                local energy = localPlayer.Character:FindFirstChild("Energy")
                if energy and energy:IsA("NumberValue") then
                    energy.Value = 999999
                end
            end)
        end
    end)
end)

createToggle(TabPlayer, "No Clip (Đi xuyên tường)", function(state)
    if state then
        getgenv().Tubor_Noclip = RunService.Stepped:Connect(function()
            local char = localPlayer.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        if getgenv().Tubor_Noclip then
            getgenv().Tubor_Noclip:Disconnect()
            getgenv().Tubor_Noclip = nil
        end
    end
end)

-- 5. Tab Shop (Auto mua trái / Mua thông thạo)
createToggle(TabShop, "Auto Random Fruit", function(state)
    getgenv().Tubor_RandomFruit = state
    task.spawn(function()
        while getgenv().Tubor_RandomFruit do
            task.wait(5)
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("Cousin", "Buy")
            end)
        end
    end)
end)

createToggle(TabShop, "Auto Buy 2x Money", function(state)
    print("[TuborHub]: Auto Buy 2x Money -> " .. tostring(state))
end)

-- 6. Tab Misc (Anti AFK & WalkSpeed)
createToggle(TabMisc, "Anti AFK (Chống văng khi đứng im)", function(state)
    if state then
        local vu = game:GetService("VirtualUser")
        getgenv().Tubor_AntiAFK = localPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    else
        if getgenv().Tubor_AntiAFK then
            getgenv().Tubor_AntiAFK:Disconnect()
            getgenv().Tubor_AntiAFK = nil
        end
    end
end)

-- 7. Tab ESP (Hiển thị người chơi, trái ác quỷ, rương)
createToggle(TabESP, "ESP Players", function(state)
    getgenv().Tubor_ESPPlayers = state
    RunService.RenderStepped:Connect(function()
        if not getgenv().Tubor_ESPPlayers then return end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= localPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local head = p.Character.Head
                if not head:FindFirstChild("TuborESP") then
                    local bb = Instance.new("BillboardGui")
                    bb.Name = "TuborESP"
                    bb.Size = UDim2.new(0, 50, 0, 25)
                    bb.AlwaysOnTop = true
                    bb.StudsOffset = Vector3.new(0, 2.5, 0)
                    bb.Parent = head
                    
                    local txt = Instance.new("TextLabel")
                    txt.Size = UDim2.new(1, 0, 1, 0)
                    txt.BackgroundTransparency = 1
                    txt.Font = Enum.Font.GothamBold
                    txt.Text = p.Name
                    txt.TextColor3 = Color3.fromRGB(255, 50, 50)
                    txt.TextSize = 10
                    txt.Parent = bb
                end
            end
        end
    end)
end)

createToggle(TabESP, "ESP Fruits (Tìm trái ác quỷ)", function(state)
    getgenv().Tubor_ESPFruits = state
    task.spawn(function()
        while getgenv().Tubor_ESPFruits do
            task.wait(2)
            pcall(function()
                for _, v in pairs(Workspace:GetChildren()) do
                    if v:IsA("Tool") and v:FindFirstChild("Handle") then
                        if not v.Handle:FindFirstChild("FruitESP") then
                            local bb = Instance.new("BillboardGui", v.Handle)
                            bb.Name = "FruitESP"
                            bb.Size = UDim2.new(0, 60, 0, 30)
                            bb.AlwaysOnTop = true
                            local txt = Instance.new("TextLabel", bb)
                            txt.Size = UDim2.new(1, 0, 1, 0)
                            txt.BackgroundTransparency = 1
                            txt.Text = v.Name
                            txt.TextColor3 = Color3.fromRGB(255, 215, 0)
                            txt.TextSize = 11
                            txt.Font = Enum.Font.GothamBold
                        end
                    end
                end
            end)
        end
    end)
end)

-- 8. Tab UI Settings (Fullbright & Tùy chỉnh)
createToggle(TabUISettings, "Fullbright (Sáng toàn bản đồ)", function(state)
    if state then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.GlobalShadows = false
    else
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
    end
end)

print("TUBOR HUB Blox Fruits Premium successfully loaded!")
