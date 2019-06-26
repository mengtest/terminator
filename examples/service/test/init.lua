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

    skynet.error("=============== zset ================")
    skynet.error("rank 28:", zs:rank("a28"))
    skynet.error("rev rank 28:", zs:rev_rank("a28"))
    skynet.error("")
end


local function test_cjson()
    local cjson = require "cjson"
    local sampleJson = [[{"age":"23","testArray":{"array":[8,9,11,14,25]},"Himi":"himigame.com"}]];
    local data = cjson.decode(sampleJson)
     
    skynet.error("=============== cjson ================")
    skynet.error("age:", data["age"])
    skynet.error("array[1]:", data.testArray.array[1])
end


local function test_msgpack()
    local cmsgpack = require "cmsgpack"
    local a = {a1 = 1, a2 = 1, a3 = 1, a4 = 1, a5 = 1, a6 = 1, a7 = 1, a8 = 1, a9 = 1}
    local encode = cmsgpack.pack(a)

    skynet.error("=============== cmsgpack================")
    skynet.error("a: ", encode)
end

skynet.start(function()
    skynet.newservice("debug_console",8000)
    skynet.error("Be water my friend.")

    test_zset()
    test_cjson()
    test_msgpack()
end)
