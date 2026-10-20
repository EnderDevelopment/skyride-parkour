-- Lobby UI Script

local lobbyUI = {}

-- Function to create a UI for the lobby
function lobbyUI.createLobbyUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LobbyUI"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create a frame for the UI
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.5, 0)
    frame.Position = UDim2.new(0.25, 0, 0.25, 0)
    frame.BackgroundTransparency = 0.5
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.Parent = screenGui

    -- Add a title to the UI
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.2, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "Sky Racer Parkour"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextScaled = true
    title.BackgroundTransparency = 1
    title.Parent = frame

    -- Add a description to the UI
    local description = Instance.new("TextLabel")
    description.Size = UDim2.new(1, 0, 0.6, 0)
    description.Position = UDim2.new(0, 0, 0.2, 0)
    description.Text = "Welcome to Sky Racer Parkour!\n\nChoose a portal to start your adventure."
    description.TextColor3 = Color3.new(1, 1, 1)
    description.TextScaled = true
    description.BackgroundTransparency = 1
    description.Parent = frame

    return screenGui
end

return lobbyUI