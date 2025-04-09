package;

import hxluajit.wrapper.LuaUtils;
import hxluajit.Lua;
import sys.io.File;
import hxluajit.LuaL;
import hxluajit.Types.Lua_State;
import cpp.RawPointer;

class LuaScript {
    public static var vm:Null<RawPointer<Lua_State>> = null;

    public static function init(file:String) {
        vm = LuaL.newstate();
        LuaL.openlibs(vm);

        LuaL.dofile(vm, File.getContent(file));

        LuaUtils.setVariable(vm, "version", "1.0.0");
        LuaUtils.addFunction(vm, "trace", function (text:String) {
            trace(text);
        });

        Lua.close(vm);
        vm = null;
    }   
}