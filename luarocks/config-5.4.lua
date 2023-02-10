-- ~/.luarocks/config-5.4.lua

-- default config see https://github.com/luarocks/luarocks/blob/d4e82aae9f411d5d2cac10f7e043a0c3c6180eb1/src/luarocks/core/cfg.lua#L167

--  http://lua-users.org/wiki/LuaRocksConfig
--  https://github.com/luarocks/luarocks/wiki/Dependencies
--  https://github.com/luarocks/luarocks/wiki/Documentation

lua_version = "5.4"

local_by_default = true


lua_interpreter = "lua" .. lua_version
-- dump_env()
-- we can not use normal os.open here, so can not check /etc/fedora-release exists or not
-- see https://github.com/luarocks/luarocks/wiki/Config-file-format#external-input
-- it is actually `https://debuginfod.fedoraproject.org/ `
lua_interpreter = ((os_getenv('DEBUGINFOD_URLS') == 'https://debuginfod.fedoraproject.org/ ') or (os_getenv('DEBUGINFOD_URLS') == 'https://debuginfod.fedoraproject.org/')) and
		"lua" or lua_interpreter

-- do not prepend `/usr` to lua_modules_path or lib_modules_path
-- no need to change the default generally.
-- otherwise both `deploy_lib_dir` and `deploy_lua_dir` value will be wrong
----------------------------------------------------------------
-- remember:
-- `home_tree = "/home/ttys3/.luarocks"`
-- `deploy_lua_dir = home_tree .. lua_modules_path`
-- `deploy_lib_dir = home_tree .. lib_modules_path`
----------------------------------------------------------------
-- lua_modules_path = "/share/lua/"..lua_version
-- lib_modules_path = "/lib/lua/"..lua_version

-- we need correct `lib_modules_path` here
lib_modules_path = "/lib64/lua/" .. lua_version

-- for 5.4 ROCKS_TREE is `/home/ttys3/.luarocks/lib/luarocks/rocks-5.4`
-- so rocks_subdir is `lib/luarocks/rocks-5.4`, no need to change the default
-- set it to full absolute path is incorrect, it does not need the `~/.luarocks` part
-- otherwise both `variables.ROCKS_TREE` and `rocks_dir` value will be wrong
-- remember:  `rocks_dir = home_tree .. rocks_subdir`
-- system: /usr/lib/luarocks/rocks-5.4
-- user: /home/ttys3/.luarocks/lib/luarocks/rocks-5.4
-- rocks_subdir = "/lib/luarocks/rocks-"..lua_version

connection_timeout = 30 -- 0 = no timeout

variables = {
		LUA = "/usr/bin/" .. lua_interpreter,
		LUA_DIR = "/usr",
		LUA_BINDIR = "/usr/bin",
}
