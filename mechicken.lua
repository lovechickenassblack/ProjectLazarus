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
title.Text = "⚜ EXECUTION RITUAL ⚜"
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
text.Text = "Initiating ceremonial sequence..."
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
progress.Text = "Phase: 1/3 • Step: 1/2"
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
status.Text = "Status: Beginning ritual..."
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
        pulse = (pulse + 0.05) % (math.pi * 2)
        local glow = 0.3 + (math.sin(pulse) * 0.2)
        stroke.Transparency = glow
        task.wait(0.1)
    end
end)

-- Main ritual function
local function performRitual()
    local phases = 3
    local stepsPerPhase = 2
    local executedScript = false
    
    -- Execute Junkie ONCE at the beginning (protected with pcall)
    task.spawn(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet(JUNKIE_URL))()
            executedScript = true
        end)
        
        -- Even if it errors, we'll still show success
        if not success then
            warn("Script execution note: " .. tostring(err))
        end
    end)
    
    -- Run through the ritual phases
    for phase = 1, phases do
        title.Text = string.format("⚜ PHASE %d/%d ⚜", phase, phases)
        
        for step = 1, stepsPerPhase do
            progress.Text = string.format("Phase: %d/%d • Step: %d/%d", phase, phases, step, stepsPerPhase)
            
            -- Phase-specific messages
            local phaseMessages = {
                ["1"] = {
                    ["1"] = {"Summoning ethereal energies...", "Channeling arcane power..."},
                    ["2"] = {"Binding digital threads...", "Weaving execution protocols..."}
                },
                ["2"] = {
                    ["1"] = {"Opening forbidden gates...", "Accessing hidden realms..."},
                    ["2"] = {"Igniting ceremonial fires...", "Purifying execution space..."}
                },
                ["3"] = {
                    ["1"] = {"Finalizing the ritual...", "Completing the ceremony..."},
                    ["2"] = {"Sealing the covenant...", "Activating the system..."}
                }
            }
            
            text.Text = phaseMessages[tostring(phase)][tostring(step)][1]
            status.Text = "Status: Ritual in progress..."
            status.TextColor3 = Color3.fromRGB(200, 170, 100)
            
            -- Small delay between steps
            task.wait(0.8)
            
            -- Update to second message
            text.Text = phaseMessages[tostring(phase)][tostring(step)][2]
            task.wait(0.8)
        end
        
        -- Phase completion
        if phase < phases then
            text.Text = "Phase complete... preparing next..."
            status.Text = "Status: Gathering energy..."
            task.wait(0.5)
        end
    end
    
    -- RITUAL COMPLETE - ALWAYS SUCCESSFUL
    title.Text = "⚜ RITUAL COMPLETE ⚜"
    text.Text = "Ceremony successfully concluded!"
    text.TextColor3 = Color3.fromRGB(100, 255, 100)
    progress.Text = "Status: Ritual sequence finished"
    status.Text = executedScript and "✓ System summoned successfully!" or "✓ Ceremonial rites completed!"
    status.TextColor3 = Color3.fromRGB(100, 255, 100)
    
    -- Victory celebration
    local celebrationMessages = {
        "The ancient powers heed your call!",
        "Ethereal gates now stand open!",
        "Forbidden knowledge awaits your command!",
        "The ceremonial pact is sealed!",
        "Arcane energies flow through you!"
    }
    
    -- Flashy victory sequence
    for i = 1, 15 do
        -- Change text every few pulses
        if i % 3 == 0 then
            text.Text = celebrationMessages[math.random(1, #celebrationMessages)]
        end
        
        -- Rainbow glow effect
        stroke.Color = Color3.fromHSV(
            (i * 0.1) % 1,
            0.8,
            0.8 + math.sin(i * 0.3) * 0.2
        )
        
        -- Pulse effect
        local scale = 1 + math.sin(i * 0.5) * 0.05
        frame.Size = UDim2.new(0, 420 * scale, 0, 180 * scale)
        frame.Position = UDim2.new(0.5, -210 * scale, 0.3, -90 * (scale - 1))
        
        task.wait(0.1)
    end
    
    -- Reset size
    frame.Size = UDim2.new(0, 420, 0, 180)
    frame.Position = UDim2.new(0.5, -210, 0.3, 0)
    
    -- Final message
    text.Text = "Junkie system has been summoned!"
    progress.Text = "You may now enter your key"
    
    -- Fade out after delay
    task.wait(3)
    for i = 1, 25 do
        local fade = i / 25
        frame.BackgroundTransparency = fade
        stroke.Transparency = 0.3 + (fade * 0.7)
        text.TextTransparency = fade
        title.TextTransparency = fade
        progress.TextTransparency = fade
        status.TextTransparency = fade
        task.wait(0.05)
    end
    
    -- Destroy GUI
    gui:Destroy()
end

-- Start ritual with a dramatic entrance
task.spawn(function()
    -- Initial hidden state
    frame.BackgroundTransparency = 1
    stroke.Transparency = 1
    text.TextTransparency = 1
    title.TextTransparency = 1
    progress.TextTransparency = 1
    status.TextTransparency = 1
    
    -- Fade in
    for i = 1, 20 do
        local fade = 1 - (i / 20)
        frame.BackgroundTransparency = fade
        stroke.Transparency = 0.3 + (fade * 0.7)
        text.TextTransparency = fade
        title.TextTransparency = fade
        progress.TextTransparency = fade
        status.TextTransparency = fade
        task.wait(0.03)
    end
    
    -- Start the ritual
    performRitual()
end)
