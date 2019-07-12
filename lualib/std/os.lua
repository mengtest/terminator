-------------------------------------------------------------------------
------ 对标准库 os 的补充
--------------------------------------------------------------------------
local lfs = require "lfs"

-----------------------------------------------------------------------
-- invoke command and retrive output
-----------------------------------------------------------------------
function os.call(command)
    local fp = os.popen(command)
    if fp == nil then
        return nil
    end
    local line = fp:read('*l')
    fp:close()
    return line
end


function os.pwd()
    return lfs.currentdir()
end
