-- a simple example function that is testable (via Busted *and* Test::Nginx) and can be wrapped into nginx

function adder (x, y)
    return x + y
end

return adder