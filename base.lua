
local Threads = require('threads')

local M = {}
local Base = torch.class('trainer.Base', M)

function Base:__init()
    print('Base _init')
    local threads = Threads(3,
        function ()
            print('new threads')
        end)
    self.threads = threads
end

function Base:run()
    local threads = self.threads
    local n = 0
    local per = torch.Tensor(20)
    for i=1,20,1 do
        per[i] = i
    end
    --[[end
    print('per')
    print(per)
    ]]
    local idx = 1
    local smp = nil
    local size = per:size(1)
    print('size '..size)
    local function  enqueue()
        while idx <= size and threads:acceptsjob() do
           threads:addjob(
            function()
                return per[idx]
            end,
            function (val)
                smp = val
            end
           )
           idx = idx + 1
        end
    end

    local function loop()
        n = n + 1
        enqueue()

        threads:dojob()
        enqueue()
        return smp
        --print('---n')
        --print(n)
    end
    --loop()
    return loop
end


return M.Base
