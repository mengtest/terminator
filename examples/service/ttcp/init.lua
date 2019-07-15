--  实现 TTCP 服务
require "std/init"
local skynet = require "skynet"
local socket = require "skynet.socket"
local inspect = require "inspect"


local function handler(id, addr)
    local fmt = ">ii"
    local size = string.packsize(fmt)
    local data, succ = socket.read(id, size)
    if false == succ then
        skynet.error("read failed, id: ", id, ", addr: ", addr)
        return
    end
    local session_message = {number = 0, length = 0}
    session_message.number, session_message.length = string.unpack(fmt, data)
    skynet.error("session_message:", inspect.inspect(session_message))

    -- 读取 PlayLoadMessage
    for i = 1, session_message.number do
        skynet.error("loop: i ", i)
        local fmt2 = ">i"
        local size2 = string.packsize(fmt2)
        local data2 = socket.read(id, size2)
        local payload = {length = 0, data = ""}
        payload.length = string.unpack(fmt2, data2)
        skynet.error("payload.length:", payload.length)
        assert(payload.length == session_message.length)
        payload.data = socket.read(id, session_message.length)
        local ack = string.pack('>i4', payload.length)
        socket.write(id, ack)
    end
end


local function ttcp_server()
    local listen_id = socket.listen("127.0.0.1",  10001)
    assert(listen_id)
    skynet.error("listen id: ", id)
    socket.start(listen_id, function(id, addr)
        skynet.error("client id: ", id, ", addr: ", addr)
        socket.start(id)                 -- 这行很重要. 否则id 不可读.
        skynet.fork(handler, id, addr)
    end)
end



skynet.start(function()
    skynet.error("start ttcp server.")
    ttcp_server()
end)
