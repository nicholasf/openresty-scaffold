local adder = require('adder')

describe('a simple test', function()
    it('adds 1 + 1', function()
        local result = adder(1,1)
        assert.is_true(result == 2)
    end)
end)
