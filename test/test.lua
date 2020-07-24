package.path = package.path .. ";../?.lua"

local lu = require('luaunit')

local yl_numberutil = require("res.scripts.yl_numberutil")
local yl_meshlabelutil = require "res.scripts.yl_meshlabelutil"

Tests = {}

function Tests:setUp()
    self.fixedNumber = yl_numberutil.generate("123456")
    self.randomNumber = yl_numberutil.generate("123xxx")
    self.rangedNumber = yl_numberutil.generateRange(12200, 12250)
    self.badRandomNumber = yl_numberutil.generate("12abc34")
    self.badRandomNumber2 = yl_numberutil.generate("xxabcxx")

    self.exampleTransf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, }
    self.meshlabelExample = {
        children = {
            {
                materials = { "yunglenin/meshlabels/yl_meshlabels.mtl", },
                mesh = "yunglenin/meshlabels/yl_meshlabel_b_1.msh",
                transf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1.6, 0, 1, },
            },
            {
                materials = { "yunglenin/meshlabels/yl_meshlabels.mtl", },
                mesh = "yunglenin/meshlabels/yl_meshlabel_b_2.msh",
                transf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 3.2, 0, 1, },
            },
        },
        transf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, },
        name = "meshlabel"
    }
    self.meshlabelExampleDifferentMaterials = {
        children = {
            {
                materials = { "yunglenin/different/material.mtl", },
                mesh = "yunglenin/meshlabels/yl_meshlabel_w_1.msh",
                transf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1.6, 0, 1, },
            },
            {
                materials = { "yunglenin/different/material.mtl", },
                mesh = "yunglenin/meshlabels/yl_meshlabel_w_2.msh",
                transf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 3.2, 0, 1, },
            },
        },
        transf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, },
        name = "meshlabel"
    }
end

-- numberutil

function Tests:test_Numberutil_FixedNumber()
    lu.assertStrMatches(self.fixedNumber, "123456")
end

function Tests:test_Numberutil_RandomNumber()
    lu.assertAlmostEquals(tonumber(self.randomNumber), 123500, 500)
end

function Tests:test_Numberutil_Range()
    lu.assertAlmostEquals(tonumber(self.rangedNumber), 12225, 25)
end

function Tests:test_Numberutil_BadRandomNumber()
    lu.assertStrMatches(self.badRandomNumber, "12abc34")
end

function Tests:test_Numberutil_BadRandomNumber2()
    lu.assertNotStrContains(self.badRandomNumber2, "xxabcxx")
end

--meshlabelutil

function Tests:test_Meshlabelutil_ValidateStructure()
    meshlabel = yl_meshlabelutil.createMeshlabel("BLACK", "12", self.exampleTransf)
    lu.assertEquals(meshlabel, self.meshlabelExample)
end

function Tests:test_Meshlabelutil_DifferentMaterials()
    yl_meshlabelutil.material = "yunglenin/different/material.mtl"
    meshlabel = yl_meshlabelutil.createMeshlabel("WHITE", "12", self.exampleTransf)
    lu.assertEquals(meshlabel, self.meshlabelExampleDifferentMaterials)

    yl_meshlabelutil.material = "yunglenin/meshlabels/yl_meshlabels.mtl"
end


local runner = lu.LuaUnit.new()
runner:setOutputType("text")
os.exit( runner:runSuite() )

