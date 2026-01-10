local player = game.Players.LocalPlayer

-- ===============================
-- KEY SYSTEM WARNING GUI
-- ===============================
task.spawn(function()
    -- Wait a moment for other GUIs to load
    task.wait(2)
    
    local warningGui = Instance.new("ScreenGui")
    warningGui.Name = "KeySystemWarning"
    warningGui.ResetOnSpawn = false
    warningGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    warningGui.DisplayOrder = 500 -- Medium priority
    warningGui.Parent = player.PlayerGui
    
    local warningFrame = Instance.new("Frame")
    warningFrame.Size = UDim2.new(0, 350, 0, 120)
    warningFrame.Position = UDim2.new(0.5, -175, 0.7, 0) -- Bottom center
    warningFrame.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
    warningFrame.BackgroundTransparency = 0.1
    warningFrame.BorderSizePixel = 0
    warningFrame.Parent = warningGui
    
    local warningCorner = Instance.new("UICorner")
    warningCorner.CornerRadius = UDim.new(0, 10)
    warningCorner.Parent = warningFrame
    
    -- Subtle border
    local warningStroke = Instance.new("UIStroke", warningFrame)
    warningStroke.Thickness = 1.5
    warningStroke.Color = Color3.fromRGB(100, 80, 120)
    warningStroke.Transparency = 0.5
    warningStroke.Parent = warningFrame
    
    -- Warning icon
    local icon = Instance.new("TextLabel")
    icon.Size = UDim2.new(0, 30, 0, 30)
    icon.Position = UDim2.new(0, 15, 0, 15)
    icon.BackgroundTransparency = 1
    icon.Text = "⚠"
    icon.Font = Enum.Font.Garamond
    icon.TextSize = 24
    icon.TextColor3 = Color3.fromRGB(180, 140, 100)
    icon.Parent = warningFrame
    
    -- Warning text
    local warningText = Instance.new("TextLabel")
    warningText.Size = UDim2.new(1, -60, 0, 60)
    warningText.Position = UDim2.new(0, 50, 0, 15)
    warningText.BackgroundTransparency = 1
    warningText.TextWrapped = true
    warningText.Font = Enum.Font.Garamond
    warningText.TextSize = 14
    warningText.TextColor3 = Color3.fromRGB(180, 180, 185)
    warningText.Text = "If multiple key systems load when you click the button, close the duplicates. The script will attempt to prevent this automatically. BTW LOOK RIGHT CORNER"
    warningText.Parent = warningFrame
    
    -- Close button for this warning
    local closeWarningBtn = Instance.new("TextButton")
    closeWarningBtn.Size = UDim2.new(0, 100, 0, 30)
    closeWarningBtn.Position = UDim2.new(0.5, -50, 0, 80)
    closeWarningBtn.BackgroundColor3 = Color3.fromRGB(50, 30, 60)
    closeWarningBtn.BackgroundTransparency = 0.3
    closeWarningBtn.BorderSizePixel = 0
    closeWarningBtn.Text = "Got It"
    closeWarningBtn.Font = Enum.Font.Garamond
    closeWarningBtn.TextSize = 14
    closeWarningBtn.TextColor3 = Color3.fromRGB(180, 160, 180)
    closeWarningBtn.Parent = warningFrame
    
    local closeWarningCorner = Instance.new("UICorner")
    closeWarningCorner.CornerRadius = UDim.new(0, 6)
    closeWarningCorner.Parent = closeWarningBtn
    
    local closeWarningStroke = Instance.new("UIStroke", closeWarningBtn)
    closeWarningStroke.Thickness = 1
    closeWarningStroke.Color = Color3.fromRGB(120, 80, 100)
    closeWarningStroke.Transparency = 0.6
    closeWarningStroke.Parent = closeWarningBtn
    
    -- Auto-close after 15 seconds
    task.spawn(function()
        task.wait(15)
        if warningGui and warningGui.Parent then
            for i = 1, 15 do
                local fade = i / 15
                warningFrame.BackgroundTransparency = 0.1 + (fade * 0.9)
                warningStroke.Transparency = 0.5 + (fade * 0.5)
                icon.TextTransparency = fade
                warningText.TextTransparency = fade
                closeWarningBtn.BackgroundTransparency = 0.3 + (fade * 0.7)
                closeWarningBtn.TextTransparency = fade
                closeWarningStroke.Transparency = 0.6 + (fade * 0.4)
                task.wait(0.03)
            end
            warningGui:Destroy()
        end
    end)
    
    -- Manual close
    closeWarningBtn.MouseButton1Click:Connect(function()
        for i = 1, 10 do
            local fade = i / 10
            warningFrame.BackgroundTransparency = 0.1 + (fade * 0.9)
            warningStroke.Transparency = 0.5 + (fade * 0.5)
            icon.TextTransparency = fade
            warningText.TextTransparency = fade
            closeWarningBtn.BackgroundTransparency = 0.3 + (fade * 0.7)
            closeWarningBtn.TextTransparency = fade
            closeWarningStroke.Transparency = 0.6 + (fade * 0.4)
            task.wait(0.02)
        end
        warningGui:Destroy()
    end)
    
    print("⚠ Key system warning displayed")
end)

-- ===============================
-- GLIMMERY DRAGGABLE RETRY BUTTON (LOWERED POSITION)
-- ===============================
local retryGui = Instance.new("ScreenGui")
retryGui.Name = "PermanentRetryButton"
retryGui.ResetOnSpawn = false
retryGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
retryGui.IgnoreGuiInset = true
retryGui.DisplayOrder = 1000
retryGui.Parent = player:WaitForChild("PlayerGui")

-- Main button frame (MOVED LOWER - from 0.05 to 0.15)
local buttonFrame = Instance.new("Frame")
buttonFrame.Size = UDim2.new(0, 240, 0, 60)
buttonFrame.Position = UDim2.new(1, -260, 0.15, 0) -- Changed from 0.05 to 0.15
buttonFrame.BackgroundColor3 = Color3.fromRGB(40, 20, 35)
buttonFrame.BackgroundTransparency = 0.1
buttonFrame.BorderSizePixel = 0
buttonFrame.Active = true
buttonFrame.Selectable = true
buttonFrame.Draggable = true
buttonFrame.ZIndex = 1000
buttonFrame.Parent = retryGui

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = buttonFrame

local buttonStroke = Instance.new("UIStroke", buttonFrame)
buttonStroke.Thickness = 1.5
buttonStroke.Color = Color3.fromRGB(120, 80, 100)
buttonStroke.Transparency = 0.4
buttonStroke.Parent = buttonFrame

-- NEW: Glow effect for the button frame
local buttonGlow = Instance.new("ImageLabel")
buttonGlow.Name = "ButtonGlow"
buttonGlow.Size = UDim2.new(1, 10, 1, 10)
buttonGlow.Position = UDim2.new(0, -5, 0, -5)
buttonGlow.BackgroundTransparency = 1
buttonGlow.Image = "rbxassetid://8992231221" -- Soft glow texture
buttonGlow.ImageColor3 = Color3.fromRGB(150, 80, 130)
buttonGlow.ImageTransparency = 0.8
buttonGlow.ScaleType = Enum.ScaleType.Slice
buttonGlow.SliceCenter = Rect.new(100, 100, 100, 100)
buttonGlow.SliceScale = 0.03
buttonGlow.ZIndex = 999
buttonGlow.Parent = buttonFrame

local innerShadow = Instance.new("Frame")
innerShadow.Size = UDim2.new(1, -4, 1, -4)
innerShadow.Position = UDim2.new(0, 2, 0, 2)
innerShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
innerShadow.BackgroundTransparency = 0.8
innerShadow.BorderSizePixel = 0
innerShadow.ZIndex = 999
innerShadow.Parent = buttonFrame

local innerCorner = Instance.new("UICorner")
innerCorner.CornerRadius = UDim.new(0, 6)
innerCorner.Parent = innerShadow

-- Retry Button
local retryButton = Instance.new("TextButton")
retryButton.Size = UDim2.new(1, -20, 1, -20)
retryButton.Position = UDim2.new(0, 10, 0, 10)
retryButton.BackgroundColor3 = Color3.fromRGB(60, 30, 50)
retryButton.BackgroundTransparency = 0.3
retryButton.BorderSizePixel = 0
retryButton.Text = "Keep Clicking Here Until Gui Shows Up"
retryButton.Font = Enum.Font.Garamond
retryButton.TextSize = 16
retryButton.TextColor3 = Color3.fromRGB(180, 160, 180)
retryButton.TextStrokeTransparency = 0.7
retryButton.TextStrokeColor3 = Color3.fromRGB(20, 10, 20)
retryButton.ZIndex = 1001
retryButton.Parent = buttonFrame

local innerButtonCorner = Instance.new("UICorner")
innerButtonCorner.CornerRadius = UDim.new(0, 6)
innerButtonCorner.Parent = retryButton

local innerButtonStroke = Instance.new("UIStroke", retryButton)
innerButtonStroke.Thickness = 1
innerButtonStroke.Color = Color3.fromRGB(140, 100, 120)
innerButtonStroke.Transparency = 0.7
innerButtonStroke.Parent = retryButton

-- NEW: Text glow effect
local textGlow = Instance.new("TextLabel")
textGlow.Name = "TextGlow"
textGlow.Size = UDim2.new(1, 0, 1, 0)
textGlow.Position = UDim2.new(0, 0, 0, 0)
textGlow.BackgroundTransparency = 1
textGlow.Text = "Keep Clicking Here Until Gui Shows Up"
textGlow.Font = Enum.Font.Garamond
textGlow.TextSize = 16
textGlow.TextColor3 = Color3.fromRGB(200, 180, 200)
textGlow.TextStrokeTransparency = 0.5
textGlow.TextStrokeColor3 = Color3.fromRGB(255, 200, 255)
textGlow.TextStrokeTransparency = 0.8
textGlow.Visible = false
textGlow.ZIndex = 1000
textGlow.Parent = retryButton

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 18, 0, 18)
closeButton.Position = UDim2.new(1, -23, 0, -9)
closeButton.BackgroundColor3 = Color3.fromRGB(50, 25, 40)
closeButton.BackgroundTransparency = 0.4
closeButton.BorderSizePixel = 0
closeButton.Text = "×"
closeButton.Font = Enum.Font.Garamond
closeButton.TextSize = 14
closeButton.TextColor3 = Color3.fromRGB(180, 160, 180)
closeButton.ZIndex = 1002
closeButton.Parent = buttonFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeButton

local closeStroke = Instance.new("UIStroke", closeButton)
closeStroke.Thickness = 1
closeStroke.Color = Color3.fromRGB(120, 80, 100)
closeStroke.Transparency = 0.6
closeStroke.Parent = closeButton

-- NEW: GLIMMERY ANIMATION
local pulseTime = 0
local glowPulseTime = 0
local pulseDirection = 1
local isMouseOver = false

-- Create a subtle sparkle effect
local sparkles = {}
for i = 1, 3 do
    local sparkle = Instance.new("Frame")
    sparkle.Name = "Sparkle" .. i
    sparkle.Size = UDim2.new(0, 4, 0, 4)
    sparkle.BackgroundColor3 = Color3.fromRGB(255, 220, 255)
    sparkle.BackgroundTransparency = 0.7
    sparkle.BorderSizePixel = 0
    sparkle.ZIndex = 1002
    
    local sparkleCorner = Instance.new("UICorner")
    sparkleCorner.CornerRadius = UDim.new(1, 0)
    sparkleCorner.Parent = sparkle
    
    table.insert(sparkles, sparkle)
    sparkle.Parent = buttonFrame
end

-- Animation loop for glimmery effect
task.spawn(function()
    while buttonFrame and buttonFrame.Parent do
        pulseTime = (pulseTime + 0.05) % (math.pi * 2)
        glowPulseTime = (glowPulseTime + 0.03) % (math.pi * 2)
        
        -- Pulsing border and glow
        local pulseValue = math.sin(pulseTime) * 0.5 + 0.5
        local glowValue = math.sin(glowPulseTime) * 0.4 + 0.6
        
        buttonStroke.Transparency = 0.4 - (pulseValue * 0.15)
        innerButtonStroke.Transparency = 0.7 - (pulseValue * 0.2)
        
        -- Pulsing glow effect
        buttonGlow.ImageTransparency = 0.8 - (glowValue * 0.15)
        
        -- Color cycling for extra glimmery effect
        local hueShift = math.sin(pulseTime * 0.5) * 0.05
        buttonGlow.ImageColor3 = Color3.fromHSV(
            (0.8 + hueShift) % 1, -- Hue (purple range)
            0.6, -- Saturation
            0.8 -- Value
        )
        
        -- Sparkle animation
        for i, sparkle in ipairs(sparkles) do
            local sparkleTime = pulseTime + (i * 0.3)
            local xPos = 0.2 + 0.6 * math.sin(sparkleTime * 1.5)
            local yPos = 0.2 + 0.6 * math.cos(sparkleTime * 1.2)
            
            sparkle.Position = UDim2.new(xPos, -2, yPos, -2)
            sparkle.BackgroundTransparency = 0.7 - (math.sin(sparkleTime * 2) * 0.3)
            
            -- Make sparkles more visible when mouse is over
            if isMouseOver then
                sparkle.BackgroundTransparency = 0.5 - (math.sin(sparkleTime * 3) * 0.3)
            end
        end
        
        -- Text glow pulse (subtle)
        local textPulse = math.sin(glowPulseTime * 1.5) * 0.3 + 0.7
        retryButton.TextColor3 = Color3.fromRGB(
            180 + math.sin(pulseTime) * 20,
            160 + math.cos(pulseTime * 0.7) * 15,
            180 + math.sin(pulseTime * 0.8) * 15
        )
        
        -- Enhanced pulse when mouse is over
        if isMouseOver then
            buttonFrame.BackgroundColor3 = Color3.fromRGB(
                40 + math.sin(pulseTime) * 5,
                20 + math.cos(pulseTime) * 3,
                35 + math.sin(pulseTime * 0.5) * 5
            )
            
            buttonGlow.ImageTransparency = 0.6 - (glowValue * 0.25)
            buttonStroke.Thickness = 1.5 + math.sin(pulseTime * 2) * 0.3
        else
            buttonFrame.BackgroundColor3 = Color3.fromRGB(40, 20, 35)
            buttonStroke.Thickness = 1.5
        end
        
        task.wait(0.03) -- Smooth animation
    end
end)

-- Mouse enter/leave effects
retryButton.MouseEnter:Connect(function()
    isMouseOver = true
    textGlow.Visible = true
    
    -- Quick pulse on hover
    for i = 1, 5 do
        buttonGlow.ImageTransparency = 0.5 - (i * 0.05)
        task.wait(0.02)
    end
end)

retryButton.MouseLeave:Connect(function()
    isMouseOver = false
    textGlow.Visible = false
    
    -- Return to normal
    for i = 1, 5 do
        buttonGlow.ImageTransparency = 0.6 + (i * 0.04)
        task.wait(0.02)
    end
end)

-- ===============================
-- ANNOUNCEMENT GUI FUNCTION
-- ===============================
local function showAnnouncement(message, duration)
    local announcementGui = Instance.new("ScreenGui")
    announcementGui.Name = "KeySystemAnnouncement"
    announcementGui.ResetOnSpawn = false
    announcementGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    announcementGui.DisplayOrder = 999
    announcementGui.Parent = player:WaitForChild("PlayerGui")
    
    local announcementFrame = Instance.new("Frame")
    announcementFrame.Size = UDim2.new(0, 320, 0, 100)
    announcementFrame.Position = UDim2.new(0.5, -160, 0.2, 0)
    announcementFrame.BackgroundColor3 = Color3.fromRGB(30, 15, 40)
    announcementFrame.BackgroundTransparency = 0.1
    announcementFrame.BorderSizePixel = 0
    announcementFrame.Parent = announcementGui
    
    local announcementCorner = Instance.new("UICorner")
    announcementCorner.CornerRadius = UDim.new(0, 10)
    announcementCorner.Parent = announcementFrame
    
    local announcementStroke = Instance.new("UIStroke", announcementFrame)
    announcementStroke.Thickness = 2
    announcementStroke.Color = Color3.fromRGB(150, 100, 140)
    announcementStroke.Transparency = 0.4
    announcementStroke.Parent = announcementFrame
    
    -- Glow effect
    local announcementGlow = Instance.new("ImageLabel")
    announcementGlow.Size = UDim2.new(1, 10, 1, 10)
    announcementGlow.Position = UDim2.new(0, -5, 0, -5)
    announcementGlow.BackgroundTransparency = 1
    announcementGlow.Image = "rbxassetid://8992231221"
    announcementGlow.ImageColor3 = Color3.fromRGB(180, 100, 160)
    announcementGlow.ImageTransparency = 0.7
    announcementGlow.ScaleType = Enum.ScaleType.Slice
    announcementGlow.SliceCenter = Rect.new(100, 100, 100, 100)
    announcementGlow.SliceScale = 0.03
    announcementGlow.ZIndex = -1
    announcementGlow.Parent = announcementFrame
    
    -- Info icon
    local infoIcon = Instance.new("TextLabel")
    infoIcon.Size = UDim2.new(0, 25, 0, 25)
    infoIcon.Position = UDim2.new(0, 10, 0, 10)
    infoIcon.BackgroundTransparency = 1
    infoIcon.Text = "ℹ"
    infoIcon.Font = Enum.Font.Garamond
    infoIcon.TextSize = 20
    infoIcon.TextColor3 = Color3.fromRGB(200, 150, 180)
    infoIcon.Parent = announcementFrame
    
    -- Announcement text
    local announcementText = Instance.new("TextLabel")
    announcementText.Size = UDim2.new(1, -45, 1, -20)
    announcementText.Position = UDim2.new(0, 40, 0, 10)
    announcementText.BackgroundTransparency = 1
    announcementText.TextWrapped = true
    announcementText.Font = Enum.Font.Garamond
    announcementText.TextSize = 14
    announcementText.TextColor3 = Color3.fromRGB(200, 180, 200)
    announcementText.Text = message
    announcementText.Parent = announcementFrame
    
    -- Fade in animation
    announcementFrame.BackgroundTransparency = 1
    announcementStroke.Transparency = 1
    announcementGlow.ImageTransparency = 1
    infoIcon.TextTransparency = 1
    announcementText.TextTransparency = 1
    
    for i = 1, 10 do
        local fade = 1 - (i / 10)
        announcementFrame.BackgroundTransparency = 0.1 + (fade * 0.9)
        announcementStroke.Transparency = 0.4 + (fade * 0.6)
        announcementGlow.ImageTransparency = 0.7 + (fade * 0.3)
        infoIcon.TextTransparency = fade
        announcementText.TextTransparency = fade
        task.wait(0.02)
    end
    
    -- Pulsing glow animation
    task.spawn(function()
        local pulse = 0
        while announcementGui and announcementGui.Parent do
            pulse = (pulse + 0.05) % (math.pi * 2)
            announcementGlow.ImageTransparency = 0.7 - (math.sin(pulse) * 0.2)
            announcementStroke.Transparency = 0.4 - (math.sin(pulse) * 0.1)
            task.wait(0.05)
        end
    end)
    
    -- Auto-close after duration
    task.spawn(function()
        task.wait(duration)
        if announcementGui and announcementGui.Parent then
            for i = 1, 15 do
                local fade = i / 15
                announcementFrame.BackgroundTransparency = 0.1 + (fade * 0.9)
                announcementStroke.Transparency = 0.4 + (fade * 0.6)
                announcementGlow.ImageTransparency = 0.7 + (fade * 0.3)
                infoIcon.TextTransparency = fade
                announcementText.TextTransparency = fade
                task.wait(0.02)
            end
            announcementGui:Destroy()
        end
    end)
    
    -- Manual close on click
    announcementFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            for i = 1, 10 do
                local fade = i / 10
                announcementFrame.BackgroundTransparency = 0.1 + (fade * 0.9)
                announcementStroke.Transparency = 0.4 + (fade * 0.6)
                announcementGlow.ImageTransparency = 0.7 + (fade * 0.3)
                infoIcon.TextTransparency = fade
                announcementText.TextTransparency = fade
                task.wait(0.01)
            end
            announcementGui:Destroy()
        end
    end)
    
    return announcementGui
end

-- ===============================
-- DUPLICATE KEY SYSTEM DETECTOR AND CLEANER
-- ===============================
local function cleanupDuplicateKeySystems()
    local playerGui = player:WaitForChild("PlayerGui")
    local guisToCheck = {}
    
    -- Look for duplicate junkie/key GUIs (common names)
    for _, child in ipairs(playerGui:GetChildren()) do
        if child:IsA("ScreenGui") then
            local name = child.Name:lower()
            if string.find(name, "junkie") or 
               string.find(name, "key") or 
               string.find(name, "login") or 
               string.find(name, "main") or
               string.find(name, "gui") then
                
                if child.Name ~= "PermanentRetryButton" and 
                   child.Name ~= "GothicExecutionWarning" and 
                   child.Name ~= "KeySystemWarning" then
                    
                    if not guisToCheck[name] then
                        guisToCheck[name] = {child}
                    else
                        table.insert(guisToCheck[name], child)
                    end
                end
            end
        end
    end
    
    -- Destroy duplicates
    local destroyedCount = 0
    for guiName, guiList in pairs(guisToCheck) do
        if #guiList > 1 then
            -- Keep the first one, destroy the rest
            for i = 2, #guiList do
                guiList[i]:Destroy()
                destroyedCount = destroyedCount + 1
            end
        end
    end
    
    if destroyedCount > 0 then
        print("🧹 Cleaned up " .. destroyedCount .. " duplicate GUI(s)")
        return true
    end
    
    return false
end

-- ===============================
-- MODIFIED EXECUTION FUNCTION WITH DUPLICATE PREVENTION
-- ===============================
local JUNKIE_URL = "https://api.junkie-development.de/api/v1/luascripts/public/3e73ebff1af450511d7cf0bda858517be15f5f269ac343792ac557701ce4a4f1/download"

-- Smart execution with duplicate prevention
local function executeJunkieSmart(times)
    print("🚀 Executing " .. times .. " times with duplicate protection...")
    
    local originalText = retryButton.Text
    retryButton.Text = "Executing " .. times .. "x..."
    retryButton.BackgroundColor3 = Color3.fromRGB(80, 50, 70)
    
    -- Flash effect when executing
    for i = 1, 3 do
        buttonGlow.ImageColor3 = Color3.fromRGB(255, 100, 150)
        task.wait(0.1)
        buttonGlow.ImageColor3 = Color3.fromRGB(150, 80, 130)
        task.wait(0.1)
    end
    
    -- Show announcement message
    local announcement = showAnnouncement(
        "IMPORTANT: If the script doesn't load after entering key,\n" ..
        "1. Load the key system again\n" ..
        "2. Put your key again\n" ..
        "3. Wait for verification\n" ..
        "This button helps if the GUI doesn't appear!",
        8
    )
    
    local successCount = 0
    local executionDelay = 0.3 -- Increased delay to prevent overload
    
    -- Clean up any existing duplicates before starting
    cleanupDuplicateKeySystems()
    
    -- Execute with controlled timing
    for i = 1, times do
        task.spawn(function()
            -- Clean up before each execution attempt
            cleanupDuplicateKeySystems()
            
            local success, err = pcall(function()
                local content = game:HttpGet(JUNKIE_URL)
                if content then
                    loadstring(content)()
                    return true
                end
            end)
            
            if success then
                successCount = successCount + 1
                print("✓ Execution " .. i .. " succeeded")
                
                -- Visual feedback
                if i % 2 == 0 then
                    buttonGlow.ImageColor3 = Color3.fromRGB(100, 255, 150)
                    task.wait(0.2)
                    buttonGlow.ImageColor3 = Color3.fromRGB(150, 80, 130)
                end
                
                -- Clean up after successful execution
                task.wait(0.5) -- Wait a moment for GUI to load
                cleanupDuplicateKeySystems()
            else
                print("✗ Execution " .. i .. " failed")
                
                -- Error visual feedback
                buttonGlow.ImageColor3 = Color3.fromRGB(255, 50, 50)
                task.wait(0.2)
                buttonGlow.ImageColor3 = Color3.fromRGB(150, 80, 130)
            end
        end)
        
        -- Increased delay between executions to prevent overload
        if i < times then
            task.wait(executionDelay)
        end
    end
    
    -- Final cleanup after all executions
    task.wait(1)
    cleanupDuplicateKeySystems()
    
    -- Update button with visual feedback
    if successCount > 0 then
        retryButton.Text = "✓ " .. successCount .. "/" .. times
        retryButton.BackgroundColor3 = Color3.fromRGB(60, 80, 60)
        
        -- Success glow effect
        buttonGlow.ImageColor3 = Color3.fromRGB(100, 255, 100)
        for i = 1, 10 do
            buttonGlow.ImageTransparency = 0.5 - (i * 0.03)
            task.wait(0.05)
        end
        
        -- Show success announcement
        task.spawn(function()
            task.wait(1)
            showAnnouncement(
                "✅ Executions complete!\n" ..
                "If key system loaded but script doesn't work,\n" ..
                "enter your key again in the key system GUI.",
                6
            )
        end)
        
        -- Final cleanup after success
        task.wait(1)
        cleanupDuplicateKeySystems()
        
        -- Return to normal
        for i = 1, 10 do
            buttonGlow.ImageTransparency = 0.2 + (i * 0.06)
            task.wait(0.05)
        end
        buttonGlow.ImageColor3 = Color3.fromRGB(150, 80, 130)
    else
        retryButton.Text = "✗ 0/" .. times
        retryButton.BackgroundColor3 = Color3.fromRGB(80, 50, 50)
        
        -- Error glow effect
        buttonGlow.ImageColor3 = Color3.fromRGB(255, 50, 50)
        
        -- Show error announcement
        task.spawn(function()
            task.wait(1)
            showAnnouncement(
                "❌ Executions failed!\n" ..
                "Try clicking the button 1-2 more times.\n" ..
                "If key system appears, enter your key.",
                6
            )
        end)
        
        task.wait(1)
        buttonGlow.ImageColor3 = Color3.fromRGB(150, 80, 130)
    end
    
    task.wait(1.5)
    retryButton.Text = originalText
    retryButton.BackgroundColor3 = Color3.fromRGB(60, 30, 50)
    
    print("✅ Executions complete. Successes: " .. successCount .. "/" .. times)
end

-- ===============================
-- BUTTON CLICK HANDLER WITH DUPLICATE PROTECTION
-- ===============================
local isExecuting = false
retryButton.MouseButton1Click:Connect(function()
    if not isExecuting then
        isExecuting = true
        
        -- Click visual feedback
        retryButton.BackgroundColor3 = Color3.fromRGB(100, 50, 90)
        buttonGlow.ImageTransparency = 0.3
        
        -- Clean up existing duplicates before starting
        cleanupDuplicateKeySystems()
        
        -- Execute with controlled timing
        executeJunkieSmart(4)
        
        isExecuting = false
        
        -- Return to normal after execution
        task.wait(0.5)
        retryButton.BackgroundColor3 = Color3.fromRGB(60, 30, 50)
        buttonGlow.ImageTransparency = 0.8
    end
end)

-- ===============================
-- PERIODIC CLEANUP
-- ===============================
task.spawn(function()
    while retryGui and retryGui.Parent do
        task.wait(10) -- Check every 10 seconds
        cleanupDuplicateKeySystems()
    end
end)

-- ===============================
-- CLOSE BUTTON HANDLER
-- ===============================
closeButton.MouseButton1Click:Connect(function()
    -- Fade out animation with glimmery effect
    for i = 1, 15 do
        local fade = i / 15
        
        -- Main fade
        buttonFrame.BackgroundTransparency = fade
        buttonStroke.Transparency = 0.4 + (fade * 0.6)
        retryButton.BackgroundTransparency = 0.3 + (fade * 0.7)
        retryButton.TextTransparency = fade
        innerButtonStroke.Transparency = 0.7 + (fade * 0.3)
        closeButton.BackgroundTransparency = 0.4 + (fade * 0.6)
        closeButton.TextTransparency = fade
        closeStroke.Transparency = 0.6 + (fade * 0.4)
        
        -- Glow fade with final sparkle
        buttonGlow.ImageTransparency = 0.8 + (fade * 0.2)
        if i == 5 then
            buttonGlow.ImageColor3 = Color3.fromRGB(255, 200, 255)
        elseif i == 10 then
            buttonGlow.ImageColor3 = Color3.fromRGB(255, 100, 200)
        end
        
        -- Sparkles fade out
        for _, sparkle in ipairs(sparkles) do
            sparkle.BackgroundTransparency = 0.7 + (fade * 0.3)
        end
        
        task.wait(0.03)
    end
    retryGui:Destroy()
end)

-- ===============================
-- GOTHIC GUI (SAME AS BEFORE)
-- ===============================
local gui = Instance.new("ScreenGui")
gui.Name = "GothicExecutionWarning"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 100
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 160)
frame.Position = UDim2.new(0.5, -200, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.ZIndex = 100
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(140, 110, 100)
stroke.Transparency = 0.5
stroke.Parent = frame

local innerFrame = Instance.new("Frame")
innerFrame.Size = UDim2.new(1, -8, 1, -8)
innerFrame.Position = UDim2.new(0, 4, 0, 4)
innerFrame.BackgroundTransparency = 1
innerFrame.BorderSizePixel = 0
innerFrame.Parent = frame

local innerStroke = Instance.new("UIStroke", innerFrame)
innerStroke.Thickness = 1
innerStroke.Color = Color3.fromRGB(80, 60, 90)
innerStroke.Transparency = 0.7
innerStroke.Parent = innerFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.Position = UDim2.new(0, 0, 0, 5)
title.BackgroundTransparency = 1
title.Font = Enum.Font.Garamond
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(170, 140, 120)
title.Text = "⚜ EXECUTION RITUAL ⚜"
title.Parent = frame

local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, -30, 0, 50)
text.Position = UDim2.new(0, 15, 0, 45)
text.BackgroundTransparency = 1
text.TextWrapped = true
text.Font = Enum.Font.Garamond
text.TextSize = 16
text.TextColor3 = Color3.fromRGB(180, 180, 185)
text.Text = "Initiating ceremonial sequence..."
text.Parent = frame

local progress = Instance.new("TextLabel")
progress.Size = UDim2.new(1, -30, 0, 25)
progress.Position = UDim2.new(0, 15, 0, 100)
progress.BackgroundTransparency = 1
progress.Font = Enum.Font.Garamond
progress.TextSize = 14
progress.TextColor3 = Color3.fromRGB(150, 130, 100)
progress.Text = "Phase: 1/3 • Step: 1/2"
progress.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -30, 0, 20)
status.Position = UDim2.new(0, 15, 0, 130)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Garamond
status.TextSize = 12
status.TextColor3 = Color3.fromRGB(140, 140, 140)
status.Text = "Status: Beginning ritual..."
status.Parent = frame

-- ===============================
-- GOTHIC GUI ANIMATION AND RITUAL
-- ===============================
task.spawn(function()
    local pulse = 0
    while gui and gui.Parent do
        pulse = (pulse + 0.03) % (math.pi * 2)
        stroke.Transparency = 0.5 + (math.sin(pulse) * 0.2)
        task.wait(0.1)
    end
end)

local function performRitual()
    local phases = 3
    local stepsPerPhase = 2
    
    -- Mention duplicate prevention
    task.spawn(function()
        task.wait(1)
        text.Text = "Script includes duplicate prevention..."
        task.wait(1.5)
        text.Text = "Check bottom warning for details..."
        task.wait(1.5)
        text.Text = "Initiating ceremonial sequence..."
    end)
    
    for phase = 1, phases do
        title.Text = string.format("⚜ PHASE %d/%d ⚜", phase, phases)
        
        for step = 1, stepsPerPhase do
            progress.Text = string.format("Phase: %d/%d • Step: %d/%d", phase, phases, step, stepsPerPhase)
            text.Text = "Executing sequence " .. step .. "..."
            task.wait(0.8)
        end
    end
    
    title.Text = "⚜ COMPLETE ⚜"
    text.Text = "Button has duplicate protection"
    progress.Text = "Will clean up extra GUIs"
    status.Text = "Check bottom warning message"
    
    task.wait(4)
    
    for i = 1, 20 do
        local fade = i / 20
        frame.BackgroundTransparency = 0.1 + (fade * 0.9)
        stroke.Transparency = 0.5 + (fade * 0.5)
        text.TextTransparency = fade
        title.TextTransparency = fade
        progress.TextTransparency = fade
        status.TextTransparency = fade
        task.wait(0.04)
    end
    
    gui:Destroy()
end

-- Start ritual
task.spawn(function()
    frame.BackgroundTransparency = 1
    stroke.Transparency = 1
    text.TextTransparency = 1
    title.TextTransparency = 1
    progress.TextTransparency = 1
    status.TextTransparency = 1
    
    for i = 1, 15 do
        local fade = 1 - (i / 15)
        frame.BackgroundTransparency = 0.1 + (fade * 0.9)
        stroke.Transparency = 0.5 + (fade * 0.5)
        text.TextTransparency = fade
        title.TextTransparency = fade
        progress.TextTransparency = fade
        status.TextTransparency = fade
        task.wait(0.02)
    end
    
    performRitual()
end)

print("✅ Script loaded with duplicate protection")
print("⚠ Warning GUI about duplicate key systems")
print("📢 Announcement system added")
print("✨ Glimmery button animation active")
print("🧹 Automatic cleanup for duplicate GUIs")
print("🔄 Button executes 4 times with controlled timing")
print("📌 Duplicate prevention active")
