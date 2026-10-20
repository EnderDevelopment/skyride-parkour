-- Car Controller Script

local carController = {}

-- Function to create a car controller
function carController.createCarController(carModel, player)
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

    -- Add a script to handle car movement
    local movementScript = Instance.new("Script")
    movementScript.Name = "CarMovement"
    movementScript.Source = [[
        -- Car Movement Script
        
        local car = script.Parent
        local seat = car:WaitForChild("DriverSeat")
        local humanoid = car:WaitForChild("CarHumanoid")
        
        -- Function to handle seat entry
        function onSeatEntry(entryPart, enteredPlayer)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            humanoid.Sit = true
        end
        
        -- Function to handle seat exit
        function onSeatExit(exitPart, exitedPlayer)
            humanoid.Sit = false
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        end
        
        -- Connect the seat entry and exit events
        seat:GetPropertyChangedSignal("Occupant"):Connect(function()
            if seat.Occupant then
                onSeatEntry(seat, seat.Occupant)
            else
                onSeatExit(seat, nil)
            end
        end)
    ]]
    movementScript.Parent = car

    return car
end

return carController