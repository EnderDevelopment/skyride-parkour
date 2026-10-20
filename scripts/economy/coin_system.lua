-- Coin System Script

local coinSystem = {}

-- Function to create a coin system
function coinSystem.createCoinSystem(player)
    local coins = 0

    -- Create a UI for the coin system
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CoinSystemUI"
    screenGui.Parent = player:WaitForChild("PlayerGui")

    -- Create a frame for the coin system
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.2, 0, 0.05, 0)
    frame.Position = UDim2.new(0.7, 0, 0.9, 0)
    frame.BackgroundTransparency = 0.5
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.Parent = screenGui

    -- Create a label to display the number of coins
    local coinLabel = Instance.new("TextLabel")
    coinLabel.Name = "CoinLabel"
    coinLabel.Size = UDim2.new(1, 0, 1, 0)
    coinLabel.Position = UDim2.new(0, 0, 0, 0)
    coinLabel.Text = "Coins: " .. coins
    coinLabel.TextColor3 = Color3.new(1, 1, 1)
    coinLabel.TextScaled = true
    coinLabel.BackgroundTransparency = 1
    coinLabel.Parent = frame

    -- Function to add coins to the player's balance
    local function addCoins(amount)
        coins = coins + amount
        coinLabel.Text = "Coins: " .. coins
    end

    -- Function to subtract coins from the player's balance
    local function subtractCoins(amount)
        if coins >= amount then
            coins = coins - amount
            coinLabel.Text = "Coins: " .. coins
        end
    end

    return {
        addCoins = addCoins,
        subtractCoins = subtractCoins
    }
end

return coinSystem