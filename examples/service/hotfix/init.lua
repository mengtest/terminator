-- 测试：热更新机制
local skynet = require "skynet"
local table = require("table")

-- 这个模块，会动态更新
local mod = require("mod")

local function print_info()
    -- 如果发送热更新， 打印的结果不一样. 这里模拟了使用场景
    mod.func()
    skynet.timeout(10*100,  print_info)
end



skynet.start(function()
    skynet.newservice("debug_console",8000)
    skynet.error("start to test hotfix...")


    local hotfix_runner = require("bw.hotfix.hotfix_runner")
    local modules = {"mod"}
    hotfix_runner.update_hotfix_modules(modules)

    -- 10秒 触发定时器
    skynet.timeout(10*100,  print_info)   --
end)
