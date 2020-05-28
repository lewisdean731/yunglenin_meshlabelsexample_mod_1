local lu = require('luaunit')
print(lu)
Tests = {}

function Tests:setUp()
    self.aValue = 1
end

function Tests:test1()
    lu.assertEquals(self.aValue, 1)
end

local runner = lu.LuaUnit.new()
runner:setOutputType("text")
os.exit( runner:runSuite() )