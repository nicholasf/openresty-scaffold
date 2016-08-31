## OpenResty Example Scaffold

This is a scaffold for an OpenResty project with one working example.

Note - I created this after being unable to find an example OpenResty scaffold that included testing using both Busted and 
Test::Nginx.

The steps below assume you have Perl and `cpan` installed.

I created this quite quickly as I was learning the basics of OpenResty. If there's something missing please feel 
free to open an issue and make a suggestion. I intend to return to this scaffold and polish it as I learn more 
about programming in Lua 5.1 with OpenResty.  

### Installing lua5.1 on OS X

`brew install lua5.1`

For the sake of convenience, I then symlinked `lua` to `lua5.1` and `luarocks` to `luarocks5.1` in `/usr/local/bin`.

```
♪  bin git:(master) l lua
lrwxr-xr-x  1 nicholasf  admin    21B 31 Aug 11:12 lua -> /usr/local/bin/lua5.1
♪  bin git:(master) l luarocks
lrwxr-xr-x  1 nicholasf  admin    27B 31 Aug 11:13 luarocks -> /usr/local/bin/luarocks-5.1
```

Please note - Lua5.1 is necessary to take advantage of the performance of [LuaJIT](http://luajit.org/luajit.html).

### Black Magic step

I think most development and testing of OpenResty is done by linux users. I wanted to get this working on OS X, 
for various reasons.

I found that to make `Test::Nginx` and Perl's `prove` command to cooperate with my homebrew OpenResty installation 
I had to create a symlinked for nginx, pointing to Openresty.

```
♪  bin git:(master) ln -s openresty nginx
♪  bin git:(master) pwd
/usr/local/bin
♪  bin git:(master) l nginx
lrwxr-xr-x  1 nicholasf  admin     9B 31 Aug 15:54 nginx -> openresty
```

### Install

`make setup`.

### Run

`make run` then visit http://localhost:3000/?x=1&y=1


### Examples

The starting point of this application includes an example.nginx.conf that relates to a 'handler' for OpenResty 
which calls a standard Lua module to perform some addition. The functionality is unit tested with [Busted](https://olivinelabs.com/busted/) 
and [Test::Nginx](https://github.com/openresty/test-nginx).

## Acknowlegements

This work was based from the following code:

* https://github.com/thibaultcha/lua-resty-jit-uuid
* https://github.com/openresty-io/openresty-scaffold

It was written while working for NewsCorp Australia in 2016.

## License

Copyright (c) 2016 News Corp Australia. Licensed under the MIT license.

