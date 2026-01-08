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

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 170, 0)
stroke.Parent = frame

local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, -20, 1, -20)
text.Position = UDim2.new(0, 10, 0, 10)
text.BackgroundTransparency = 1
text.TextWrapped = true
text.Font = Enum.Font.GothamBold
text.TextSize = 20
text.TextColor3 = Color3.fromRGB(255, 200, 0)
text.Text = "Loading key system…btw make sure u put the key while ur in lobby and read what the script says."
text.Parent = frame

-- ===============================
-- JUNKIE AUTO-EXEC UNTIL LOADED
-- ===============================

local JUNKIE_URL = "https://api.junkie-development.de/api/v1/luascripts/public/e2a14e5075e286bb29a93063129d767a9a7337f5a94cc1ada42c335bef36dba7/download"

local HttpService = game:GetService("HttpService")
local MAX_TRIES = 10
local tries = 0

local function junkieLoaded()
    for _, v in ipairs(player.PlayerGui:GetChildren()) do
        if v:IsA("ScreenGui") and v ~= gui then
            return true
        end
    end
    for _, v in ipairs(game:GetService("CoreGui"):GetChildren()) do
        if v:IsA("ScreenGui") then
            return true
        end
    end
    return false
end

while tries < MAX_TRIES do
    tries += 1

    pcall(function()
        loadstring(game:HttpGet(JUNKIE_URL))()
    end)

    task.wait(0.25)

    if junkieLoaded() then
        text.Text = "Key system loaded ✔"
        task.wait(0.5)
        gui:Destroy()
        break
    end
end
