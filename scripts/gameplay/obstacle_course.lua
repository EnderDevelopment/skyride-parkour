-- Obstacle Course Script

local obstacleCourse = {}

-- Function to create an obstacle course
function obstacleCourse.createObstacleCourse(courseName, obstacles, environment)
    local course = Instance.new("Model")
    course.Name = courseName
    course.Parent = workspace

    -- Add obstacles to the course
    for _, obstacle in ipairs(obstacles) do
        local obstacleModel = obstacle:Clone()
        obstacleModel.Parent = course
    end

    -- Set the environment for the course
    local environmentModel = environment:Clone()
    environmentModel.Parent = course

    return course
end

return obstacleCourse