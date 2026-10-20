-- Lobby Portals Script

local portals = {}

-- Function to create a portal
function portals.createPortal(portalName, destination)
    local portal = Instance.new("Part")
    portal.Name = portalName
    portal.Size = Vector3.new(5, 1, 5)
    portal.Anchored = true
    portal.CanCollide = true
    portal.Position = Vector3.new(0, 5, 0)
    portal.BrickColor = BrickColor.new("Bright blue")

    -- Add a click detector to the portal
    local clickDetector = Instance.new("ClickDetector", portal)
    clickDetector.MouseClick:Connect(function(player)
        -- Teleport the player to the destination
        player.Character:MoveTo(destination)
    end)

    return portal
end

return portals