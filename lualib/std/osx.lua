-------------------------------------------------------------------------
------ 对标准库 os 的补充
--------------------------------------------------------------------------
local lfs = require "lfs"

local _M = {}

-----------------------------------------------------------------------
-- invoke command and retrive output
-----------------------------------------------------------------------
function _M.call(command)
    local fp = io.popen(command)
    if fp == nil then
        return nil
    end
    local line = fp:read('*l')
    fp:close()
    return line
end


function _M.pwd()
    return lfs.currentdir()
end

return _M