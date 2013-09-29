package ;
import org.flixel.*;
import org.flixel.util.*;

class Player extends FlxSprite
{
	private static var RUNSPEED:Float = 100;
	
	public function new(X:Float = 0, Y:Float = 0, SimpleGraphic:Dynamic = null)
	{
		super(X, Y, SimpleGraphic);
		
		maxVelocity = new FlxPoint(RUNSPEED, RUNSPEED);
        drag = new FlxPoint(RUNSPEED * 4, RUNSPEED * 4); // decelerate to a stop within 1/4 of a second
	}
	
	override public function update():Void
	{
		super.update();
		
		checkMovement();
	}
	
	public function checkMovement():Void
	{
		acceleration.x = acceleration.y = 0; // no gravity or drag by default
		var movement:FlxPoint = new FlxPoint();
		if (FlxG.keys.pressed("LEFT"))
			movement.x -= 1;
		if (FlxG.keys.pressed("RIGHT"))
			movement.x += 1;
		if (FlxG.keys.pressed("UP"))
			movement.y -= 1;
		if (FlxG.keys.pressed("DOWN"))
			movement.y += 1;
			
		// check final movement direction
		if (movement.x < 0)
			moveLeft();
		else if (movement.x > 0)
			moveRight();
		if (movement.y < 0)
			moveUp();
		else if (movement.y > 0)
			moveDown();
	}
	
	public function moveLeft():Void {
		facing = FlxObject.LEFT;
		acceleration.x = -RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
	}
	 
	public function moveRight():Void {
		facing = FlxObject.RIGHT;
		acceleration.x = RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
	}

	public function moveUp():Void {
		facing = FlxObject.UP;
		acceleration.y = -RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
	}

	public function moveDown():Void {
		facing = FlxObject.DOWN;
		acceleration.y = RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
	}
	
}