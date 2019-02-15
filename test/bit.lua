local BIT = require"nums.bit"

local r = BIT(1) '<<' (2)
assert(r==4)

-- bnot(1)
local r = BIT('~') (1)
if tostring(r)=="4294967294" then -- lua 5.3 ?!
	--assert(~1==-2)
else
	assert(r==-2)
end

local r = BIT(111) '~' (100)
assert(r==11)

local DIGIT_BITS = 30 -- Gives us 30 bits with Lua 5.3.
local DIGIT_MASK = (BIT(1) '<<' (DIGIT_BITS)) - 1
assert(DIGIT_MASK==1073741823)

