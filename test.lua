require('os')

local Base = require 'base'

local cnt = 0
--Base:run()
--os.exit(0)
tmp = Base()
for n in tmp:run() do
    print('---n  '..n)
    --[[if cnt == 20 then
        break
    end]]
    cnt = cnt + 1
end
