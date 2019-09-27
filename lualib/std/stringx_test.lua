local lu = require("test/luaunit")

require("std/stringx")

function TestStartWith()
    local s = "helloworld"
    lu.assertFalse(s:startswith("xxx"))
end

os.exit(lu.LuaUnit.run(), true)