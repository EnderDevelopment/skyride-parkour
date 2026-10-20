-- Tesla Roadster Car Script

local teslaRoadster = {}

-- Function to create a Tesla Roadster car
function teslaRoadster.createTeslaRoadster(carModel, player)
    local car = carModel:Clone()
    car.Parent = workspace
    car:SetPrimaryPartCFrame(player.Character:GetPrimaryPartCFrame() * CFrame.new(0, 0, -10))

    -- Add a vehicle seat to the car
    local seat = Instance.new("VehicleSeat")
    seat.Name = "DriverSeat"
    seat.Anchored = false
    seat.CanCollide = false
    seat.Parent = car

    -- Add a humanoid to the car
    local humanoid = Instance.new("Humanoid")
    humanoid.Name = "CarHumanoid"
    humanoid.Parent = car

    -- Add unique animations to the Tesla Roadster
    local animationFolder = Instance.new("Folder")
    animationFolder.Name = "TeslaAnimations"
    animationFolder.Parent = car

    -- Add a script to handle Tesla Roadster animations
    local animationScript = Instance.new("Script")
    animationScript.Name = "TeslaAnimations"
    animationScript.Source = [[
        -- Tesla Roadster Animations Script
        
        local car = script.Parent
        local seat = car:WaitForChild("DriverSeat")
        local humanoid = car:WaitForChild("CarHumanoid")
        
        -- Function to play Tesla Roadster animations
        function playTeslaAnimations()
            -- Add your unique animations here
            -- For example, you can add a script to make the car's wheels spin faster
            -- or add a script to make the car's lights flash
        end
        
        -- Connect the seat entry event to play animations
        seat:GetPropertyChangedSignal("Occupant"):Connect(function()
            if seat.Occupant then
                playTeslaAnimations()
            end
        end)
    ]]
    animationScript.Parent = car

    return car
end

return teslaRoadster