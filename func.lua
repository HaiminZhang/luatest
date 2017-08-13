

function test()
    local function loop()
        return 888,999
    end
    return loop
end

cnt = 0
for a,b in test() do
    print('a ',a, ' b, ', b)
    cnt = cnt + 1
    if cnt == 10 then
        break
    end
end
