local ok,bit = pcall(require, "bit")
if not ok then
	ok, bit = pcall(require, "bit32")
end
assert(ok, "no bitwise module available")

local BIT = {
['&'] = bit.band,
['band'] = bit.band,

['|'] = bit.bor,
['bor'] = bit.bor,

['~'] = function(a,b)
	if b==nil then
		return bit.bnot(a)
	else
		return bit.bxor(a,b)
	end
end,
['bnot'] = bit.bnot,
['bxor'] = bit.bxor,

['>>'] = bit.rshift,
['rshift'] = bit.rshift,

['<<'] = bit.lshift,
['lshift'] = bit.lshift,
}
setmetatable(BIT, {__call=function(_, a)
	if a=="~" or a=="bnot" then
		local fop = assert(BIT[a], "no such operator "..a)
		return function(b)
			return fop(b)
		end
	end
	assert(type(a)=="number")
	return function(op)
		assert(type(op)=="string")
		local fop = assert(BIT[op], "no such operator "..op)
		return function(b)
			assert(type(b)=="number")
			return fop(a,b)
		end
	end
end})
return BIT
