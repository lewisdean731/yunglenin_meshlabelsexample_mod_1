package.path = package.path .. ";../?.lua"

local lu = require('luaunit')

local yl_numberutil = require("res.scripts.yl_numberutil")
local yl_meshlabelutil = require "res.scripts.yl_meshlabelutil"

Tests = {}

function Tests:setUp()
    self.fixedNumber = yl_numberutil.generate("123456")
    self.randomNumber = yl_numberutil.generate("123xxx")
    self.badRandomNumber = yl_numberutil.generate("12abc34")
    self.badRandomNumber2 = yl_numberutil.generate("xxabcxx")
end
-- numberutil

function Tests:test_Numberutil_FixedNumber()
    lu.assertStrMatches(self.fixedNumber, "123456")
end

function Tests:test_Numberutil_RandomNumber()
    lu.assertAlmostEquals(tonumber(self.randomNumber), 123500, 500)
end

function Tests:test_Numberutil_BadRandomNumber()
    lu.assertStrMatches(self.badRandomNumber, "12abc34")
end

function Tests:test_Numberutil_BadRandomNumber2()
    lu.assertNotStrContains(self.badRandomNumber2, "xxabcxx")
end

function Tests:testRandomNumber()
    lu.assertAlmostEquals(tonumber(self.randomNumber),  123500, 500)
end

local runner = lu.LuaUnit.new()
runner:setOutputType("text")
os.exit( runner:runSuite() )

