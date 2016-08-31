.PHONY: deps lint

setup: deps
	mkdir .nginx-run

deps:
	@luarocks install luacheck
	@luarocks install busted
	cpan Test::Nginx
	cpan Test::Nginx::Socket
	cpan Test::Nginx::Socket::Lua


lint:
	@luacheck -q src --std 'luajit+ngx_lua' \
	  --no-redefined

test:
	@busted -m $(PWD)/src/?.lua tests/*.lua
	@t/reindex t/*.t
	@prove

run:
	@openresty -p $(PWD)/.nginx-run -c $(PWD)/conf/example.nginx.conf
