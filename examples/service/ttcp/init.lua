--  实现 TTCP 服务
require "std/init"
local skynet = require "skynet"
local socket = require "skynet.socket"
local inspect = require "inspect"



local function accept(id)
    local fmt = ">i4i4"
    local size = string.packsize(fmt)
    local data, succ = socket.read(id, size)
    if not succ then
        skynet.error("read failed, id: ", id, ", addr: ", addr)
        return
    end
    local session_message = {number = 0, length = 0}
    session_message.number, session_message.length = string.unpack(fmt, data)
    skynet.error("session_message:", inspect.inspect(session_message))

    -- 读取 PlayLoadMessage
    for i = 1, session_message.number do
        local fmt = ">i4s" .. session_message.length
        local size = string.packsize(fmt)
        local data2, succ = socket.read(id, size)
        if not succ then
            skynet.error("read payload failed, id: ", id, ", addr: ", addr)
            return
        end
        local payload_message = {length = 0, data = ""}
        payload_message.length, payload_message.data = string.unapck(fmt, size)
        skynet.error("payload_message.length:", payload_message.length)
        skynet.error("throw away payload_message, ", #payload_message.data)
    end
end


local function ttcp_server()
    local id = socket.listen("127.0.0.1",  10001)

    socket.start(id, function(id, addr)
        skynet.error("client: ", addr)
        accept(id, addr)
    end)
end



skynet.start(function()
    skynet.newservice("debug_console",8000)
    skynet.error("Be water my friend.")

    ttcp_server()

end)
