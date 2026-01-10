local player = game.Players.LocalPlayer

-- ===============================
-- WARNING GUI (SHOWS BEFORE MAIN RITUAL)
-- ===============================
local warningGui = Instance.new("ScreenGui")
warningGui.Name = "ExecutionWarning"
warningGui.ResetOnSpawn = false
warningGui.Parent = player:WaitForChild("PlayerGui")

local warningFrame = Instance.new("Frame")
warningFrame.Size = UDim2.new(0, 450, 0, 220)
warningFrame.Position = UDim2.new(0.5, -225, 0.4, -110)
warningFrame.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
warningFrame.BorderSizePixel = 0
warningFrame.Parent = warningGui

local warningCorner = Instance.new("UICorner")
warningCorner.CornerRadius = UDim.new(0, 12)
warningCorner.Parent = warningFrame

local warningStroke = Instance.new("UIStroke", warningFrame)
warningStroke.Thickness = 4
warningStroke.Color = Color3.fromRGB(255, 100, 100)
warningStroke.Transparency = 0.2
warningStroke.Parent = warningFrame

local warningTitle = Instance.new("TextLabel")
warningTitle.Size = UDim2.new(1, 0, 0, 50)
warningTitle.Position = UDim2.new(0, 0, 0, 10)
warningTitle.BackgroundTransparency = 1
warningTitle.Font = Enum.Font.Garamond
warningTitle.TextSize = 28
warningTitle.TextColor3 = Color3.fromRGB(255, 100, 100)
warningTitle.Text = "⚠ EXECUTION WARNING ⚠"
warningTitle.TextStrokeTransparency = 0.6
warningTitle.TextStrokeColor3 = Color3.fromRGB(10, 10, 12)
warningTitle.Parent = warningFrame

local warningText = Instance.new("TextLabel")
warningText.Size = UDim2.new(1, -40, 0, 100)
warningText.Position = UDim2.new(0, 20, 0, 60)
warningText.BackgroundTransparency = 1
warningText.TextWrapped = true
warningText.Font = Enum.Font.Garamond
warningText.TextSize = 18
warningText.TextColor3 = Color3.fromRGB(220, 180, 180)
warningText.Text = [[EXECUTION PROTOCOL ACTIVE:

• Script will attempt multiple executions
• If first attempt fails, it will retry repeatedly
• Successful double execution will bypass key systems
• Prepare for aggressive loading sequence]]
warningText.TextStrokeTransparency = 0.7
warningText.Parent = warningFrame

local warningStatus = Instance.new("TextLabel")
warningStatus.Size = UDim2.new(1, -40, 0, 30)
warningStatus.Position = UDim2.new(0, 20, 0, 170)
warningStatus.BackgroundTransparency = 1
warningStatus.Font = Enum.Font.Garamond
warningStatus.TextSize = 16
warningStatus.TextColor3 = Color3.fromRGB(255, 150, 100)
warningStatus.Text = "Starting in: 5 seconds..."
warningStatus.TextStrokeTransparency = 0.7
warningStatus.Parent = warningFrame

-- Warning animation
task.spawn(function()
    local pulse = 0
    while warningGui and warningGui.Parent do
        pulse = (pulse + 0.15) % (math.pi * 2)
        local glow = 0.2 + (math.sin(pulse) * 0.3)
        warningStroke.Transparency = glow
        task.wait(0.08)
    end
end)

-- ===============================
-- MAIN GOTHIC EXECUTION GUI (WILL SHOW AFTER WARNING)
-- ===============================
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "GothicExecutionWarning"
mainGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 180)
frame.Position = UDim2.new(0.5, -210, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(15, 12, 20)
frame.BorderSizePixel = 0

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
title.Text = "⚜ ULTIMATE EXECUTION RITUAL ⚜"
title.TextStrokeTransparency = 0.7
title.TextStrokeColor3 = Color3.fromRGB(10, 10, 12)
title.Parent = frame

local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, -40, 0, 60)
text.Position = UDim2.new(0, 20, 0, 60)
text.BackgroundTransparency = 1
text.TextWrapped = true
text.Font = Enum.Font.Garamond
text.TextSize = 18
text.TextColor3 = Color3.fromRGB(180, 180, 185)
text.Text = "Initiating ultimate execution sequence..."
text.TextStrokeTransparency = 0.8
text.Parent = frame

local progress = Instance.new("TextLabel")
progress.Size = UDim2.new(1, -40, 0, 30)
progress.Position = UDim2.new(0, 20, 0, 125)
progress.BackgroundTransparency = 1
progress.Font = Enum.Font.Garamond
progress.TextSize = 16
progress.TextColor3 = Color3.fromRGB(150, 130, 70)
progress.Text = "Attempt: 1 • Execution: 0/4"
progress.TextStrokeTransparency = 0.8
progress.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -40, 0, 20)
status.Position = UDim2.new(0, 20, 0, 155)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Garamond
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(120, 120, 120)
status.Text = "Status: Beginning ultimate execution..."
status.TextStrokeTransparency = 0.8
status.Parent = frame

local function createOrnament(posX, posY, anchorX, anchorY)
    local ornament = Instance.new("Frame")
    ornament.Size = UDim2.new(0, 12, 0, 12)
    ornament.Position = UDim2.new(posX, 0, posY, 0)
    ornament.AnchorPoint = Vector2.new(anchorX, anchorY)
    ornament.BackgroundColor3 = Color3.fromRGB(200, 170, 100)
    ornament.BackgroundTransparency = 0.5
    ornament.BorderSizePixel = 0
    ornament.Parent = frame
    
    local ornamentCorner = Instance.new("UICorner")
    ornamentCorner.CornerRadius = UDim.new(0, 3)
    ornamentCorner.Parent = ornament
    
    return ornament
end

createOrnament(0, 0, 0, 0)
createOrnament(1, 0, 1, 0)
createOrnament(0, 1, 0, 1)
createOrnament(1, 1, 1, 1)

-- ===============================
-- EXECUTION LOGIC WITH AGGRESSIVE RETRY
-- ===============================
local JUNKIE_URL = "https://api.junkie-development.de/api/v1/luascripts/public/3e73ebff1af450511d7cf0bda858517be15f5f269ac343792ac557701ce4a4f1/download"

-- Track execution success
local totalSuccessfulExecutions = 0
local totalAttemptsMade = 0
local maxRetries = 10  -- Maximum number of retry attempts
local bypassKeySystem = false  -- Will be set to true if we get double execution

-- Function to execute script with multiple fallbacks
local function executeScriptWithRetry()
    local methods = {
        function() return loadstring(game:HttpGet(JUNKIE_URL))() end,
        function() return loadstring(game:HttpGet(JUNKIE_URL, true))() end,
        function() 
            local HttpService = game:GetService("HttpService")
            local response = HttpService:RequestAsync({Url = JUNKIE_URL, Method = "GET"})
            if response.Success then return loadstring(response.Body)() end
            return nil
        end,
        function()
            if syn and syn.request then
                local response = syn.request({Url = JUNKIE_URL, Method = "GET"})
                if response.Success then return loadstring(response.Body)() end
            end
            return nil
        end
    }
    
    for _, method in ipairs(methods) do
        totalAttemptsMade = totalAttemptsMade + 1
        local success, result = pcall(method)
        if success then
            return true
        end
    end
    return false
end

-- Main execution function with aggressive retry
local function performAggressiveExecution()
    local maxExecutions = 4
    local currentExecution = 0
    local consecutiveSuccesses = 0
    local currentRetry = 0
    
    -- Animation pulse for main GUI
    task.spawn(function()
        local pulse = 0
        while mainGui and mainGui.Parent do
            pulse = (pulse + 0.1) % (math.pi * 2)
            local glow = 0.3 + (math.sin(pulse) * 0.2)
            stroke.Transparency = glow
            task.wait(0.05)
        end
    end)
    
    -- AGGRESSIVE EXECUTION LOOP
    while currentExecution < maxExecutions and currentRetry < maxRetries do
        currentExecution = currentExecution + 1
        progress.Text = string.format("Attempt: %d • Execution: %d/%d • Retry: %d", 
            currentExecution, currentExecution, maxExecutions, currentRetry)
        title.Text = string.format("⚜ EXECUTION %d/%d ⚜", currentExecution, maxExecutions)
        text.Text = "Executing script..."
        status.Text = "Status: Running..."
        status.TextColor3 = Color3.fromRGB(200, 170, 100)
        
        -- Try to execute
        local success = executeScriptWithRetry()
        
        if success then
            -- SUCCESS
            text.Text = string.format("Execution %d successful!", currentExecution)
            status.Text = "✓ Success!"
            status.TextColor3 = Color3.fromRGB(100, 255, 100)
            totalSuccessfulExecutions = totalSuccessfulExecutions + 1
            consecutiveSuccesses = consecutiveSuccesses + 1
            
            -- Check for double execution success
            if consecutiveSuccesses >= 2 then
                bypassKeySystem = true
                text.Text = "DOUBLE EXECUTION ACHIEVED!"
                status.Text = "✓ Key system bypass activated!"
                
                -- Special effect for bypass
                for i = 1, 5 do
                    stroke.Color = Color3.fromRGB(100, 255, 100)
                    task.wait(0.1)
                    stroke.Color = Color3.fromRGB(200, 170, 100)
                    task.wait(0.1)
                end
            end
            
            -- Success flash
            stroke.Color = Color3.fromRGB(100, 255, 100)
            task.wait(0.2)
            stroke.Color = Color3.fromRGB(200, 170, 100)
            currentRetry = 0  -- Reset retry counter on success
            
        else
            -- FAILURE - PREPARE FOR RETRY
            text.Text = string.format("Execution %d failed!", currentExecution)
            status.Text = "✗ Failed! Preparing retry..."
            status.TextColor3 = Color3.fromRGB(255, 100, 100)
            consecutiveSuccesses = 0  -- Reset consecutive successes
            
            -- Error flash
            for i = 1, 3 do
                stroke.Color = Color3.fromRGB(255, 100, 100)
                task.wait(0.1)
                stroke.Color = Color3.fromRGB(200, 170, 100)
                task.wait(0.1)
            end
            
            -- Check if we should retry this execution
            if currentRetry < maxRetries then
                currentRetry = currentRetry + 1
                currentExecution = currentExecution - 1  -- Stay on same execution number
                
                -- Show retry warning
                text.Text = string.format("RETRYING... (Attempt %d/%d)", currentRetry, maxRetries)
                status.Text = "⚠ Aggressive retry in progress..."
                status.TextColor3 = Color3.fromRGB(255, 200, 100)
                
                -- Retry animation
                for i = 1, 3 do
                    stroke.Color = Color3.fromRGB(255, 200, 100)
                    task.wait(0.2)
                    stroke.Color = Color3.fromRGB(200, 170, 100)
                    task.wait(0.2)
                end
            else
                -- Max retries reached for this execution
                status.Text = "✗ Max retries reached, moving on..."
                status.TextColor3 = Color3.fromRGB(255, 150, 150)
                currentRetry = 0  -- Reset for next execution
            end
        end
        
        -- Brief pause between execution attempts
        if currentExecution < maxExecutions then
            task.wait(0.5)
        end
    end
    
    -- FINAL RESULTS
    title.Text = "⚜ EXECUTION COMPLETE ⚜"
    progress.Text = string.format("Total: %d/%d successful", totalSuccessfulExecutions, maxExecutions)
    
    if bypassKeySystem then
        text.Text = "KEY SYSTEM BYPASSED!\nDouble execution successful!"
        text.TextColor3 = Color3.fromRGB(100, 255, 100)
        status.Text = "✓ No key required - Direct access granted!"
        status.TextColor3 = Color3.fromRGB(100, 255, 100)
    elseif totalSuccessfulExecutions > 0 then
        text.Text = string.format("%d execution(s) successful", totalSuccessfulExecutions)
        text.TextColor3 = Color3.fromRGB(255, 200, 100)
        status.Text = "Partial success achieved"
        status.TextColor3 = Color3.fromRGB(255, 200, 100)
    else
        text.Text = "All executions failed despite retries"
        text.TextColor3 = Color3.fromRGB(255, 100, 100)
        status.Text = "✗ Complete failure"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
    
    -- Show final stats
    task.wait(1)
    text.Text = text.Text .. string.format("\nTotal attempts: %d", totalAttemptsMade)
    if bypassKeySystem then
        text.Text = text.Text .. "\n[KEY SYSTEM DISABLED]"
    end
    
    -- Victory celebration
    for i = 1, 15 do
        if bypassKeySystem then
            stroke.Color = Color3.fromHSV((i * 0.1) % 1, 0.9, 0.9)
        else
            stroke.Color = Color3.fromRGB(200, 170, 100)
        end
        
        local scale = 1 + math.sin(i * 0.5) * 0.04
        frame.Size = UDim2.new(0, 420 * scale, 0, 180 * scale)
        frame.Position = UDim2.new(0.5, -210 * scale, 0.3, -90 * (scale - 1))
        
        task.wait(0.1)
    end
    
    -- Reset size
    frame.Size = UDim2.new(0, 420, 0, 180)
    frame.Position = UDim2.new(0.5, -210, 0.3, 0)
    
    -- Final message
    if bypassKeySystem then
        text.Text = "SYSTEM UNLOCKED: Key requirement bypassed\nEnjoy unlimited access!"
    end
    
    -- Fade out
    task.wait(3)
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
    
    -- Destroy GUIs
    mainGui:Destroy()
end

-- ===============================
-- START THE EXECUTION SEQUENCE
-- ===============================
task.spawn(function()
    -- Show warning first
    for countdown = 5, 1, -1 do
        warningStatus.Text = "Starting in: " .. countdown .. " seconds..."
        task.wait(1)
    end
    
    -- Fade out warning
    for i = 1, 15 do
        local fade = i / 15
        warningFrame.BackgroundTransparency = fade
        warningStroke.Transparency = 0.2 + (fade * 0.8)
        warningTitle.TextTransparency = fade
        warningText.TextTransparency = fade
        warningStatus.TextTransparency = fade
        task.wait(0.03)
    end
    
    warningGui:Destroy()
    
    -- Show main execution GUI
    mainGui.Parent = player.PlayerGui
    
    -- Fade in main GUI
    frame.BackgroundTransparency = 1
    stroke.Transparency = 1
    text.TextTransparency = 1
    title.TextTransparency = 1
    progress.TextTransparency = 1
    status.TextTransparency = 1
    
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
    
    -- Start aggressive execution
    performAggressiveExecution()
end)

print("⚠ Execution warning displayed. Aggressive execution starting in 5 seconds...")
print("Will retry up to " .. maxRetries .. " times per execution.")
print("Double execution will bypass key system!")
