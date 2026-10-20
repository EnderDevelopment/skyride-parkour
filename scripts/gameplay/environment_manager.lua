-- Environment Manager Script

local environmentManager = {}

-- Function to create an environment
function environmentManager.createEnvironment(environmentName, environmentModel)
    local environment = environmentModel:Clone()
    environment.Name = environmentName
    environment.Parent = workspace

    return environment
end

return environmentManager