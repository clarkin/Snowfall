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
		
		_emitter = new FlxEmitter(FlxG.width, 0, 2000);
		_emitter.setSize(10, FlxG.height);
		_emitter.setXSpeed(-10, -20);
		_emitter.setYSpeed( -5, 5);
		_emitter.setRotation( -400, 400);
		_emitter.bounce = 0.1;
		_emitter.makeParticles("assets/images/snow_sprites.png", 2000, 32, true, 0.8); 
		
		add(_emitter);
		
		/*
		for (i in 0...(Std.int(_emitter.maxSize))) 
		{
			_snowflake = new FlxParticle();
			_snowflake.loadRotatedGraphic("assets/images/snow_sprites.png", 16, 0); 
			_snowflake.angularVelocity = FlxRandom.float() * 5 - 15; 
			_snowflake.visible = false; 
			_emitter.add(_snowflake);
		}
		*/

		_emitter.start(false, 50, .1);
	}
	
	override public function update():Void
	{
		
		super.update();
	}
	

}