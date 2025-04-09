package;

import hxluajit.wrapper.LuaUtils;
import flixel.text.FlxText;
import flixel.FlxState;

class PlayState extends FlxState {
	override public function create() {
		super.create();

		LuaScript.init(Paths.data("scripts/main.lua"));
		LuaUtils.callFunctionByName(LuaScript.vm, "create", []);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
		LuaUtils.callFunctionByName(LuaScript.vm, "update", [elapsed]);
	}
}