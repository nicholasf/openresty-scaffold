local function process()
    local url = ngx.var.uri
    local args = ngx.req.get_uri_args()
    local query_keys = {}
    for k,v in pairs(args) do table.insert(query_keys, k, v) end


    ngx.say('the spice must flow: ' .. url)
end

return process
-- see https://www.lua.org/pil/19.3.html
