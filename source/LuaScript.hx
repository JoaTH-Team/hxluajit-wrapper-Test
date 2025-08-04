package;

import openfl.Assets;
import hxluajit.LuaJIT;
import hxluajit.wrapper.LuaUtils;
import hxluajit.Lua;
import sys.io.File;
import hxluajit.LuaL;
import hxluajit.Types.Lua_State;
import cpp.RawPointer;

class LuaScript {
    public static var vm:Null<RawPointer<Lua_State>> = LuaL.newstate();

    public static function runFile(file:String):Void
    {
		Sys.println(Lua.VERSION);
		Sys.println(LuaJIT.VERSION);

        LuaL.openlibs(vm);

	LuaUtils.addFunction(vm, 'trace', function(string:String) {
            trace(string);
        });

	LuaUtils.doString(vm, File.getContent(Paths.file("data/scripts/" + file + ".lua")));

        Lua.close(vm);
        vm = null;
    }

    public static function callFunction(funcName:String, args:Array<Dynamic>) {
        return LuaUtils.callFunctionByName(vm, funcName, args);
    }
}
