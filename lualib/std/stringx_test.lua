local lu = require("test/luaunit")

require("std/stringx")

function test_startwith()
    local s = "helloworld"
    lu.assertFalse(s:startswith("xxx"))
end

os.exit(lu.LuaUnit.run(), true)