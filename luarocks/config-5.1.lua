-- ~/.luarocks/config-5.1.lua

-- default config see https://github.com/luarocks/luarocks/blob/d4e82aae9f411d5d2cac10f7e043a0c3c6180eb1/src/luarocks/core/cfg.lua#L167

--  http://lua-users.org/wiki/LuaRocksConfig
--  https://github.com/luarocks/luarocks/wiki/Dependencies
--  https://github.com/luarocks/luarocks/wiki/Documentation
 

lua_version = "5.1"

lua_modules_path = "/usr/share/lua/"..lua_version
lib_modules_path = "/lib64/lua/"..lua_version

rocks_subdir = "/usr/lib/luarocks/rocks-"..lua_version,

connection_timeout = 30,  -- 0 = no timeout

local_by_default = true

lua_interpreter = "lua5.1";

variables = {
    LUA = "/usr/bin/lua5.1";
    LUA_DIR = "/usr";
    LUA_BINDIR = "/usr/bin";
}