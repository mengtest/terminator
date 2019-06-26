-- 对服务的内存进行采样
-- 具体实现细节见 https://www.cnblogs.com/yaukey/p/unity_lua_memory_leak_trace.html

local skynet = require "skynet"
local mri = require "perf/MemoryReferenceInfo"

local _M = {}

-- 打印当前 Lua 虚拟机的所有内存引用快照到文件
--
function _M.dump_memory_snapshot()
    local save_path = skynet.getenv("dump_memory_snapshot_path") or './'
    local addr = skynet.self()
    local s = skynet.address(addr)  --- 字符串表示的地址
    local filename = s
    if _G.NAME then       -- 每个服务建议有个对应的服务名
        filename = _G.NAME .. '_' .. s
    end
    collectgarbage("collect")
    mri.m_cMethods.DumpMemorySnapshot(save_path, filename)
end

return _M

