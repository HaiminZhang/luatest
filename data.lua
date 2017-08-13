require('torch')

local function data(name)
    print('Hello world..'..name)

    return torch.randn(3, 2)
end

return data
