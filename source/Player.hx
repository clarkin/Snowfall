package ;
import org.flixel.*;
import org.flixel.util.*;

class Player extends FlxSprite
{
	private static var RUN_SPEED:Float = 800;
	private static var JUMP_SPEED:Float = 200;
	private static var GRAVITY:Float = 200;
	
	private var _jump:Float = -1;
	private var controllable:Bool = false;
	
	public function new(X:Float = 0, Y:Float = 0, SimpleGraphic:Dynamic = null)
	{
		super(X, Y, SimpleGraphic);
		
		maxVelocity.x = RUN_SPEED;
        maxVelocity.y = JUMP_SPEED;
        drag.x = RUN_SPEED / 2;
		drag.y = 0;
		acceleration.y = GRAVITY;
		
		loadGraphic("assets/images/astrosheet.png", true, true, 24, 24);
		addAnimation("idle", [5], 1);
		addAnimation("walking", [0,1,2,3], 4, true);
		addAnimation("jumping", [6, 7, 8, 9], 4, false);
		
		width -= 10;
		height -= 8;
		offset.x = 5;
		offset.y = 8;
		
		play("idle");
	}
	
	override public function update():Void
	{
		super.update();
		
		checkMovement();
		//trace(velocity.y);
	}
	
	public function checkMovement():Void
	{
		acceleration.x = 0;
		if (controllable) {
			if (FlxG.keys.LEFT)
				moveLeft();
			else if (FlxG.keys.RIGHT)
				moveRight();
			else if (velocity.x == 0)
				play("idle");

			checkJump();
		}
	}
	
	public function moveLeft():Void {
		facing = FlxObject.LEFT;
		play("walking", true);
		acceleration.x = -RUN_SPEED / 5;
	}
	 
	public function moveRight():Void {
		facing = FlxObject.RIGHT;
		play("walking", true);
		acceleration.x = RUN_SPEED / 5;
	}

	public function checkJump():Void {
		if (FlxG.keys.justPressed("UP"))  {
			//trace("jump");
			controllable = false;
			velocity.y = -JUMP_SPEED;
			play("jumping", true);
		}
		
		/*
		if((_jump >= 0) && (FlxG.keys.UP)) //You can also use space or any other key you want
		{
			_jump += FlxG.elapsed;
			if(_jump > 0.25) _jump = -1; //You can't jump for more than 0.25 seconds
		}
		else _jump = -1;

		if (_jump > 0)
		{
			trace(velocity.y);
			velocity.y = -0.8 * JUMP_SPEED;
			trace(velocity.y);
		}
		*/
	}
	
	public function tileCollision():Void {
		if (!controllable) {
			//trace("collide");
			controllable = true;
			velocity.x = velocity.y = 0;
			play("idle");
		}
	}
	
}