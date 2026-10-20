-- Boost Meter Script

local boostMeter = {}

-- Function to create a boost meter
function boostMeter.createBoostMeter(player)
    local boostValue = 100
    local boostDepletionRate = 1
    local boostRechargeRate = 0.5

    -- Create a UI for the boost meter
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BoostMeterUI"
    screenGui.Parent = player:WaitForChild("PlayerGui")

    -- Create a frame for the boost meter
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.2, 0, 0.05, 0)
    frame.Position = UDim2.new(0.4, 0, 0.9, 0)
    frame.BackgroundTransparency = 0.5
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.Parent = screenGui

    -- Create a bar to represent the boost meter
    local boostBar = Instance.new("Frame")
    boostBar.Name = "BoostBar"
    boostBar.Size = UDim2.new(boostValue / 100, 0, 1, 0)
    boostBar.Position = UDim2.new(0, 0, 0, 0)
    boostBar.BackgroundColor3 = Color3.new(0, 1, 0)
    boostBar.Parent = frame

    -- Function to update the boost meter
    local function updateBoostMeter()
        if boostValue > 0 then
            boostValue = boostValue - boostDepletionRate
        else
            boostValue = 0
        end

        boostBar.Size = UDim2.new(boostValue / 100, 0, 1, 0)
    end

    -- Function to recharge the boost meter
    local function rechargeBoostMeter()
        if boostValue < 100 then
            boostValue = boostValue + boostRechargeRate
        else
            boostValue = 100
        end

        boostBar.Size = UDim2.new(boostValue / 100, 0, 1, 0)
    end

    -- Connect the player's character's humanoid to the boost meter
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")

        -- Update the boost meter when the player jumps
        humanoid.Jumping:Connect(updateBoostMeter)

        -- Recharge the boost meter when the player is not jumping
        game:GetService("RunService").Heartbeat:Connect(function()
            if not humanoid:GetState() == Enum.HumanoidStateType.Jumping then
                rechargeBoostMeter()
            end
        end)
    end)

    return screenGui
end

return boostMeter