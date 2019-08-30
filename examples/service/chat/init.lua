--  实现 TTCP 服务
--  类似 https://github.com/chenshuo/muduo/blob/master/examples/ace/ttcp/ttcp_blocking.cc
require "std/init"
local skynet = require "skynet"
local socket = require "skynet.socket"
local inspect = require "inspect"

local host = "127.0.0.1"
local port = 10001

-- 保存当前连接上的所有客户端
local client_list = {}

local function handler(id, addr)
    while true do
        local line = socket.readline(id, "\r\n")
        if not line then
            -- 断开连接
            local k = table.indexof(client_list, id)
            table.remove(client_list, k)
            skynet.error(string.format("client %d[%s] closed", id, addr))
            break
        end
        local logstr = string.format("client %d[%s] receive, %s", id, addr, line)
        skynet.error(logstr)
        -- 广播
        for k, client in ipairs(client_list) do
            if client ~= id then
                local message = string.format("[%s] say: %s\r\n", addr, line)
                socket.write(client, message)
            end
        end
    end
end



local function chat_server()
    local listen_id = socket.listen(host, port)
    assert(listen_id)
    skynet.error("listen id: ", listen_id)
    socket.start(listen_id, function(id, addr)
        skynet.error("client id: ", id, ", addr: ", addr)
        socket.start(id)                 -- 这行很重要. 否则id 不可读.
        table.insert(client_list, id)
        skynet.fork(handler, id, addr)
    end)
end



skynet.start(function()
    skynet.error("-----------start ttcp server.----------------")
    chat_server()
end)
