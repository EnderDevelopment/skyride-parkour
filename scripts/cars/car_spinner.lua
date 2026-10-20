-- Car Spinner Script

local carSpinner = {}

-- Function to create a car spinner
function carSpinner.createCarSpinner(cars, player)
    local spinner = Instance.new("Part")
    spinner.Name = "CarSpinner"
    spinner.Size = Vector3.new(5, 1, 5)
    spinner.Anchored = true
    spinner.CanCollide = true
    spinner.Position = player.Character:GetPrimaryPartCFrame().p + Vector3.new(0, 5, 0)
    spinner.BrickColor = BrickColor.new("Bright blue")
    spinner.Parent = workspace

    -- Add a click detector to the spinner
    local clickDetector = Instance.new("ClickDetector", spinner)
    clickDetector.MouseClick:Connect(function(clickedPlayer)
        -- Choose a random car from the list
        local randomCar = cars[math.random(1, #cars)]
        
        -- Create the chosen car for the player
        local carController = require(script.Parent.car_controller)
        carController.createCarController(randomCar, clickedPlayer)
    end)

    return spinner
end

return carSpinner