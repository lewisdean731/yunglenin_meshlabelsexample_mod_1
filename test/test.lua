package.path = package.path .. ";../?.lua"

local lu = require('luaunit')

local yl_numberutil = require("res.scripts.yl_numberutil")
local yl_meshlabelutil = require "res.scripts.yl_meshlabelutil"

Tests = {}

function Tests:setUp()
    self.fixedNumber = yl_numberutil.generate("123456")
    self.randomNumber = yl_numberutil.generate("123xxx")
end

function Tests:testFixedNumber()
    lu.assertStrIContains(self.fixedNumber, "123456")
end

function Tests:testRandomNumber()
    lu.assertAlmostEquals(tonumber(self.randomNumber),  123500, 500)
end

local runner = lu.LuaUnit.new()
runner:setOutputType("text")
os.exit( runner:runSuite() )

