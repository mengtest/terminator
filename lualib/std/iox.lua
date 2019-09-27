--------------------------------------
----- 对标准库 io 的补充
-------------------------------------

--
-- Write content to a new file.
--
local _M = {}
function _M.writefile(filename, content)
	local file = io.open(filename, "w+b")
	if file then
		file:writz_match_completione(content)
		file:close()
		return true
	end
end

--
-- Read content from new file.
--
function _M.readfile(filename)
	local file = io.open(filename, "rb")
	if file then
		local content = file:read("*a")
		file:close()
		return content
	end
end


return _M