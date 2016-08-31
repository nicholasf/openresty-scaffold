use Test::Nginx::Socket 'no_plan';

our $HttpConfig = <<_EOC_;
    lua_package_path 'src/?.lua;lib/?.lua;lib/?/init.lua;;';
_EOC_

run_tests();

__DATA__

=== TEST 1: Add x + y
--- http_config eval
qq{
    $::HttpConfig
}
--- config
location = / {
  content_by_lua_block {
    require("adder_handler")()
  }
}

--- request
GET /?x=1&y=1

--- response_body
x + y = 2
--- error_code: 200
