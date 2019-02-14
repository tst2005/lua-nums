local env = require "test_uint.common"()
local uint, a8,b8,c8, a32,b32,c32 = (table.unpack or unpack)(env)

local fail = false

print("Test: not...")

if ~a8 ~= uint.u8(236) then
    print("\tFail: ~a8 ~= 236")
    fail = true
end

if ~b8 ~= uint.u8(113) then
    print("\tFail: ~b8 ~= 113")
    fail = true
end

if (~c8):asnumber() ~= 1 then
    print("\tFail: ~c8 ~= 1")
    fail = true
end

if not fail then
    print("\tPass")
end
