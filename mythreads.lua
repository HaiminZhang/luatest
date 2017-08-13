require('os')
local threads = require('threads')

local nthread = 4
local njob = 10
local msg = "hello from a satellite thread"

pool, size = threads(
    nthread--[[,
    function(threadid)
        print('starting a new thread/ state number '..threadid)
        gmsg = msg
    end,
    function ()
        return 123
    end
    ]]
)
print('-----size')
print(size)
--os.exit(0)

local jobdone = 0
for i = 1, njob do
    pool:addjob(
        function()
            print(string.format('%s -- thread ID is %x', gmsg, __threadid))
            return __threadid
        end,
        function(id)
            print(string.format("task %d finished (ran on thread ID %x)", i, id))
            jobdone = jobdone + 1
        end
    )
end

pool:dojob()
--print('i = '..i)
--pool:synchronize()
--sleep(1000)
print(string.format('%d jobs done', jobdone))
print(string.format('%d jobs done', jobdone))
print(string.format('%d jobs done', jobdone))
print(string.format('%d jobs done', jobdone))
print(string.format('%d jobs done', jobdone))
print(string.format('%d jobs done', jobdone))
print(string.format('%d jobs done', jobdone))
print(string.format('%d jobs done', jobdone))
print(string.format('%d jobs done', jobdone))
print(string.format('%d jobs done', jobdone))
print(string.format('%d jobs done', jobdone))
print(string.format('%d jobs done', jobdone))
print(string.format('%d jobs done', jobdone))
print(string.format('%d jobs done', jobdone))

--pool:terminate()

