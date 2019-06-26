local skynet = require "skynet"


local function test_zset()
    local zset = require "zset"
    local function random_choose(t)
        if #t == 0 then
            return
        end
        local i = math.random(#t)
        return table.remove(t, i)
    end
    local zs = zset.new()
    local total = 100
    local all = {}
    for i=1, total do
        all[#all + 1] = i
    end
    while true do
        local score = random_choose(all)
        if not score then
            break
        end
        local name = "a" .. score
        zs:add(score, name)
    end

    skynet.error("rank 28:", zs:rank("a28"))
    skynet.error("rev rank 28:", zs:rev_rank("a28"))
end

skynet.start(function()
    skynet.newservice("debug_console",8000)
    skynet.error("Be water my friend.")

    test_zset()

end)
