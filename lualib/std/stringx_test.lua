local lu = require("test/luaunit")

local stringx = require("std/stringx")

function _G.test_startwith()
    local s = "helloworld"
    lu.assertFalse(stringx.startswith(s, "xxx"))
end

os.exit(lu.LuaUnit.run(), true)