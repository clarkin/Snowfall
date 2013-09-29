package ;
import org.flixel.*;
import org.flixel.util.*;

class Player extends FlxSprite
{
	private static var RUN_SPEED:Float = 100;
	private static var JUMP_SPEED:Float = 200;
	private static var GRAVITY:Float = 400;
	
	private var _jump:Float;
	
	public function new(X:Float = 0, Y:Float = 0, SimpleGraphic:Dynamic = null)
	{
		super(X, Y, SimpleGraphic);
		
		maxVelocity.x = RUN_SPEED;
        maxVelocity.y = JUMP_SPEED;
        drag.x = RUN_SPEED * 8;
		acceleration.y = GRAVITY;
	}
	
	override public function update():Void
	{
		super.update();
		
		checkMovement();
	}
	
	public function checkMovement():Void
	{
		acceleration.x = 0;
		if (FlxG.keys.LEFT)
			moveLeft();
		else if (FlxG.keys.RIGHT)
			moveRight();

		checkJump();
	}
	
	public function moveLeft():Void {
		facing = FlxObject.LEFT;
		acceleration.x = -drag.x;
	}
	 
	public function moveRight():Void {
		facing = FlxObject.RIGHT;
		acceleration.x = drag.x;
	}

	public function checkJump():Void {
		if((_jump >= 0) && (FlxG.keys.UP)) //You can also use space or any other key you want
		{
			_jump += FlxG.elapsed;
			if(_jump > 0.25) _jump = -1; //You can't jump for more than 0.25 seconds
		}
		else _jump = -1;

		if (_jump > 0)
		{
			if(_jump < 0.035)   // this number is how long before a short slow jump shifts to a faster, high jump
				velocity.y = -.6 * maxVelocity.y; //This is the minimum height of the jump
				
			else 
				velocity.y = -.8 * maxVelocity.y;
		}
	}
	
}