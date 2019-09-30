local _M = {}

local skynet = require "skynet"
local table = require("table")
local hotfix_helper = require("bw.hotfix.hotfix_helper")
local hotfix_module_names = require("bw.hotfix.hotfix_module_names")

-- 热更新模块初始化
hotfix_helper.init()

-- 触发热更新的时间间隔，单位是0.01s
local delay = 1
local function hot_update_cb()
    hotfix_helper.check()
    skynet.timeout(delay, hot_update_cb)
end


-- 热更新模块列表
-- @param mod_list, 需要进行热更新的模块列表
function _M.update_hotfix_modules(modules)
    hotfix_helper.check()
    for i, mod in ipairs(modules) do
        table.insert(hotfix_module_names, mod)
    end
    -- 启动一个定时
    skynet.timeout(delay, hot_update_cb)
end


return _M