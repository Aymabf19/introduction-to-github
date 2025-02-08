local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

local GUI = Instance.new("ScreenGui", game.CoreGui)
GUI.Name = "SecretUnitsHub"

local MainFrame = Instance.new("Frame", GUI)
MainFrame.Size = UDim2.new(0.3, 0, 0.6, 0)
MainFrame.Position = UDim2.new(0.35, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "Secret Units - All Versions"
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.TextColor3 = Color3.new(1, 1, 1)

local ScrollingFrame = Instance.new("ScrollingFrame", MainFrame)
ScrollingFrame.Size = UDim2.new(0.9, 0, 0.7, 0)
ScrollingFrame.Position = UDim2.new(0.05, 0, 0.15, 0)
ScrollingFrame.BackgroundTransparency = 1

local ClaimButton = Instance.new("TextButton", MainFrame)
ClaimButton.Text = "Claim Unit"
ClaimButton.Size = UDim2.new(0.5, 0, 0.1, 0)
ClaimButton.Position = UDim2.new(0.25, 0, 0.88, 0)

local secretUnits = {
    "Poseidon (Sea Sovereign)",
    "Radiant Monarch",
    "Sage (Deity)",
    "Crimson Tyrant",
    "Draconic Warrior",
    "Golden Adult",
    "Shadow Master",
    "Agent Garcia",
    "Infernal King",
    "Frost Queen",
    "Thunder God",
    "Abyssal Warlord",
    "Celestial Guardian",
    "Voidwalker",
    "Eternal Phoenix",
    "Dark Samurai",
    "Lightbringer",
    "Stormcaller",
    "Timekeeper",
    "Arcane Mage"
}

for i, unit in pairs(secretUnits) do
    local btn = Instance.new("TextButton", ScrollingFrame)
    btn.Text = unit
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0, (i-1)*45)
    btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    btn.TextColor3 = Color3.new(1, 1, 1)
    
    btn.MouseButton1Click:Connect(function()
        _G.SelectedUnit = unit
    end)
end

ClaimButton.MouseButton1Click:Connect(function()
    if _G.SelectedUnit then
        local args = {
            [1] = _G.SelectedUnit,
            [2] = "Secret",
            [3] = "AllVersions"
        }
        
        pcall(function()
            game:GetService("ReplicatedStorage").RemoteEvents.UnitPurchase:FireServer(unpack(args))
        end)
        
        local backpack = player:FindFirstChild("Backpack")
        if backpack then
            local newUnit = Instance.new("StringValue")
            newUnit.Name = _G.SelectedUnit
            newUnit.Parent = backpack
        end
    end
end)
