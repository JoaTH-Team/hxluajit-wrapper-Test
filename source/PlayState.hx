package;

import flixel.text.FlxText;
import flixel.FlxState;

class PlayState extends FlxState {
	override public function create() {
		super.create();

		LuaScript.runFile('main');
		luaFunctionCreate();
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		luaFunctionUpdate(elapsed);
	}

	function luaFunctionCreate() {
		final create:Array<Dynamic> = LuaScript.callFunction('create', []);
		return create;
	}

	function luaFunctionUpdate(elapsed:Float) {
		final update:Array<Dynamic> = LuaScript.callFunction('update', [elapsed]);
		return update;
	}
}