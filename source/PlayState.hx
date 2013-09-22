package;

import flash.ui.Mouse;
import org.flixel.*;
import org.flixel.util.*;

class PlayState extends FlxState
{
	private var _emitter:FlxEmitter;
	private var _snowflake:FlxParticle;
	
	private var _snowflakeGroup:FlxGroup;
	
	override public function create():Void
	{
		FlxG.mouse.show();
		
		_emitter = new FlxEmitter(-50, -20, 2000);
		_emitter.setSize(FlxG.width + 200, 10);
		_emitter.setXSpeed(-10, -20);
		_emitter.setYSpeed( -15, 5);
		_emitter.setScale(0.5, 1.5, 0.5, 1.5);
		_emitter.setAlpha(0.5, 1, 0.5, 1);
		_emitter.bounce = 0.1;
		_emitter.gravity = 1;
		_emitter.makeParticles("assets/images/snow_sprites.png", 2000, 32, true, 0); 
		
		add(_emitter);

		_emitter.start(false, 90, .01, 0, 90);
	}
	
	override public function update():Void
	{
		
		super.update();
	}
	

}