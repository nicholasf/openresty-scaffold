local adder = require('adder')

local function process()
    local params = ngx.req.get_uri_args()
    local x = tonumber(params['x'])
    local y = tonumber(params['y'])
    local result = adder(x,y)

    ngx.say('x + y = ' .. result)
end

return process