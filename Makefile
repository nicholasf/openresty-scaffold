.PHONY: deps lint

setup:
	mkdir .nginx-run

deps:
	@luarocks install luacheck
	@luarocks install busted

lint:
	@luacheck -q src --std 'luajit+ngx_lua' \
	  --no-redefined

run-example:
	@echo $(PWD)
	@openresty -p $(PWD)/.nginx-run -c $(PWD)/conf/example.nginx.conf
