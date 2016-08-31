local function process()
    local url = ngx.var.uri
    local args = ngx.req.get_uri_args()
    local headers = ngx.req.get_headers()
    ngx.say('the spice must flow: ' .. url)
end

return process