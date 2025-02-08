-- Create a ScreenGui (Graphical User Interface)
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame for the list of units
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

-- Create a ScrollingFrame to hold the list of secret units
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, 0)
scrollFrame.Position = UDim2.new(0, 0, 0, 0)
scrollFrame.BackgroundTransparency = 1
scrollFrame.Parent = frame

-- List of secret units
local secretUnits = {
    "Seifer (Secret)",
    "Ice Queen (Secret)",
    "Apollo (Secret)",
    "Dark Knight (Secret)",
    "Phantom Mage (Secret)"
}

-- Function to create buttons for each unit
for _, unitName in ipairs(secretUnits) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 50)
    button.Text = unitName
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Parent = scrollFrame

    -- Add a function for when the button is clicked
    button.MouseButton1Click:Connect(function()
        -- Here we simulate "getting" the unit.
        -- In the actual game, you'd need the correct method to give the player the unit.
        
        -- Example: Assuming you have a function to give the player a unit:
        -- (This part depends on the game logic)
        -- game.ReplicatedStorage:WaitForChild("GiveUnitFunction"):FireServer(unitName)
        
        -- Display a notification confirming the selection
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Unit Selected";
            Text = "You have obtained: " .. unitName;
            Duration = 3;
        })
    end)
end
