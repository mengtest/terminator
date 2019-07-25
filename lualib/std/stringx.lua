-----------------------------------------------------------------------
-- string lib, 对标准库的补充
-----------------------------------------------------------------------
function string:split(sSeparator, nMax, bRegexp)
	assert(sSeparator ~= '')
	assert(nMax == nil or nMax >= 1)
	local aRecord = {}
	if self:len() > 0 then
		local bPlain = not bRegexp
		nMax = nMax or -1
		local nField, nStart = 1, 1
		local nFirst, nLast = self:find(sSeparator, nStart, bPlain)
		while nFirst and nMax ~= 0 do
			aRecord[nField] = self:sub(nStart, nFirst - 1)
			nField = nField + 1
			nStart = nLast + 1
			nFirst, nLast = self:find(sSeparator, nStart, bPlain)
			nMax = nMax - 1
		end
		aRecord[nField] = self:sub(nStart)
	else
		aRecord[1] = ''
	end
	return aRecord
end

function string:startswith(text)
	local size = text:len()
	if self:sub(1, size) == text then
		return true
	end
	return false
end

function string:endswith(text)
	return text == "" or self:sub(-#text) == text
end

function string:lstrip()
	if self == nil then return nil end
	local s = self:gsub('^%s+', '')
	return s
end

function string:rstrip()
	if self == nil then return nil end
	local s = self:gsub('%s+$', '')
	return s
end

function string:strip()
	return self:lstrip():rstrip()
end

function string:rfind(key)
	if key == '' then
		return self:len(), 0
	end
	local length = self:len()
	local start, ends = self:reverse():find(key:reverse(), 1, true)
	if start == nil then
		return nil
	end
	return (length - ends + 1), (length - start + 1)
end

function string:join(parts)
	if parts == nil or #parts == 0 then
		return ''
	end
	local size = #parts
	local text = ''
	local index = 1
	while index <= size do
		if index == 1 then
			text = text .. parts[index]
		else
			text = text .. self .. parts[index]
		end
		index = index + 1
	end
	return text
end


--  返回二进制数据 data 的十六进制表示形式
-- 
function string.hexlify(data)
     return string.gsub(data, ".", 
                function(x) return string.format("%02x", string.byte(x)) end)
end


local function ascii_to_num(c)
     if (c >= string.byte("0") and c <= string.byte("9")) then
         return c - string.byte("0")
     elseif (c >= string.byte("A") and c <= string.byte("F")) then
         return (c - string.byte("A"))+10
     elseif (c >= string.byte("a") and c <= string.byte("f")) then
         return (c - string.byte("a"))+10
     else
         error "Wrong input for ascii to num convertion."
     end
 end


-- 返回由十六进制字符串表示的二进制数据
-- 此函数功能与 hexlify 相反
function string.unhexlify(h)
    local s = ""
    for i = 1, #h, 2 do
        local high = ascii_to_num(string.byte(h,i))
        local low = ascii_to_num(string.byte(h,i+1))
        s = s .. string.char((high*16)+low)
    end
    return s
end
