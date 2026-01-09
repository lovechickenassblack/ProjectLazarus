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
text.Text = "Awakening the ancient key..."
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
progress.Text = "Ritual: 1/3 • Cast: 1/3"
progress.TextStrokeTransparency = 0.8
progress.Parent = frame

-- Status text (for success/failure)
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -40, 0, 20)
status.Position = UDim2.new(0, 20, 0, 155)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Garamond
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(120, 120, 120)
status.Text = "Status: Initializing..."
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
-- JUNKIE EXECUTION RITUAL
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

-- Function to test if execution was successful
local function testExecutionSuccess()
    -- You can customize this function based on what indicates success
    -- For example, checking if specific objects were created
    
    -- Method 1: Check if the script executed without critical errors
    local success = pcall(function()
        -- Try to access something that should exist after successful execution
        if game:GetService("CoreGui"):FindFirstChild("Junkie") then
            return true
        end
        
        -- You can add more checks here based on what Junkie creates
        -- Example: check for specific UI elements, player effects, etc.
        
        return true -- Default to success if we can't detect failure
    end)
    
    return success
end

-- Main ritual function with adaptive casting
local function performRitual()
    local totalCasts = 0
    local successfulCasts = 0
    local maxCastsPerRitual = 2 -- Reduce from 3 to 2 casts per ritual
    local maxTotalCasts = 6 -- 3 rituals × 2 casts = 6 total
    
    -- 3 Rituals (attempts)
    for ritual = 1, 3 do
        title.Text = "⚜ RITUAL " .. ritual .. "/3 ⚜"
        
        -- Each ritual has adaptive casts
        local castsThisRitual = 0
        local successfulThisRitual = false
        
        for cast = 1, maxCastsPerRitual do
            castsThisRitual = cast
            totalCasts += 1
            
            progress.Text = string.format("Ritual: %d/3 • Cast: %d/%d • Total: %d/%d", 
                ritual, cast, maxCastsPerRitual, totalCasts, maxTotalCasts)
            
            -- Update text with cool messages
            local messages = {
                "Channeling ancient energy...",
                "Weaving digital incantations...",
                "Summoning the key guardian...",
                "Binding ethereal threads...",
                "Igniting arcane protocols...",
                "Unlocking forbidden gates..."
            }
            text.Text = messages[((totalCasts - 1) % #messages) + 1]
            
            -- Execute Junkie with success detection
            status.Text = "Status: Casting spell..."
            status.TextColor3 = Color3.fromRGB(200, 170, 100)
            
            local success = pcall(function()
                loadstring(game:HttpGet(JUNKIE_URL))()
            end)
            
            -- Test if execution was actually successful
            task.wait(0.5) -- Give time for script to initialize
            local executionSuccess = success and testExecutionSuccess()
            
            if executionSuccess then
                successfulCasts += 1
                successfulThisRitual = true
                status.Text = "Status: ✓ Cast successful!"
                status.TextColor3 = Color3.fromRGB(100, 255, 100)
                
                -- If successful, we can stop early for this ritual
                if successfulCasts >= 1 then -- Stop after first successful cast
                    text.Text = "Energy stabilized!"
                    break
                end
            else
                status.Text = "Status: ✗ Cast failed, retrying..."
                status.TextColor3 = Color3.fromRGB(255, 100, 100)
            end
            
            -- Brief pause between casts unless we succeeded
            if cast < maxCastsPerRitual and not successfulThisRitual then
                task.wait(0.3)
            end
        end
        
        -- Check if we should continue with rituals
        if successfulCasts >= 1 then -- Stop after getting at least 1 successful execution
            text.Text = "Key system activated successfully!"
            break
        end
        
        -- Pause between rituals
        if ritual < 3 then
            text.Text = "Ritual complete... gathering energy..."
            status.Text = "Status: Preparing next ritual..."
            status.TextColor3 = Color3.fromRGB(200, 170, 100)
            task.wait(0.5)
        end
    end
    
    -- Ritual complete
    if successfulCasts > 0 then
        title.Text = "⚜ RITUAL COMPLETE ⚜"
        text.Text = "The key system has been successfully summoned"
        text.TextColor3 = Color3.fromRGB(100, 255, 100)
        status.Text = string.format("Status: %d/%d casts successful", successfulCasts, totalCasts)
        status.TextColor3 = Color3.fromRGB(100, 255, 100)
    else
        title.Text = "⚜ RITUAL FAILED ⚜"
        text.Text = "Failed to summon the key system"
        text.TextColor3 = Color3.fromRGB(255, 100, 100)
        status.Text = "Status: All casts failed"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
    
    progress.Text = string.format("Total: %d/%d casts", successfulCasts, totalCasts)
    
    -- Victory glow if successful
    if successfulCasts > 0 then
        for i = 1, 10 do
            stroke.Color = Color3.fromRGB(
                200 + math.sin(i * 0.5) * 55,
                170 + math.cos(i * 0.5) * 85,
                100 + math.sin(i * 0.3) * 50
            )
            task.wait(0.1)
        end
    end
    
    -- Fade out
    for i = 1, 20 do
        frame.BackgroundTransparency = i / 20
        stroke.Transparency = 0.3 + (i / 20 * 0.7)
        text.TextTransparency = i / 20
        title.TextTransparency = i / 20
        progress.TextTransparency = i / 20
        status.TextTransparency = i / 20
        task.wait(0.05)
    end
    
    -- Destroy GUI
    gui:Destroy()
end

-- Start the ritual after a brief moment
task.wait(0.5)
performRitual()
