package ;
import org.flixel.*;
import org.flixel.util.FlxPoint;

class SnowflakeEmitter extends FlxEmitter
{
	public var _scrollfactor:FlxPoint;

	public function new(X:Float = 0, Y:Float = 0, Size:Int = 0, Scrollfactor:FlxPoint = null)
	{
		super(X, Y, Size);
		_scrollfactor = Scrollfactor;
		
		if (_scrollfactor == null) {
			_scrollfactor = new FlxPoint(1.0, 1.0);
		}
		
		setSize(FlxG.width + 200, FlxG.height);
		
		if (_scrollfactor == PlayState.SCROLLFACTOR_BACKGROUND) {
			setXSpeed(-10, -20);
			setYSpeed(0, 10);
			setScale(0.2, 0.3, 0.4, 0.5);
			setAlpha(0.3, 0.4, 0.6, 0.7);
		} else if (_scrollfactor == PlayState.SCROLLFACTOR_MIDGROUND) {
			setXSpeed(-10, -20);
			setYSpeed(0, 10);
			setScale(0.6, 0.8, 0.6, 0.8);
			setAlpha(0.9, 1.0, 0.9, 1);
		} else if (_scrollfactor == PlayState.SCROLLFACTOR_FOREGROUND) {
			setXSpeed(10, 20);
			setYSpeed(0, 10);
			setScale(1.5, 2.0, 2.5, 3.0);
			setAlpha(0.2, 0.3, 0.4, 0.5);
		}
		
		bounce = 0.1;
		gravity = 1;
		particleClass = Snowflake;
		makeParticles("assets/images/snow_sprites.png", 2000, 32, true, 0); 
	}
	
	override public function update():Void
	{
		super.update();
		
		setSize(FlxG.width + 200, 10);
	}
	
	override public function emitParticle():Void
	{
		super.emitParticle();
		
		
	}
	
	public function setTimer(Time:Float):Void
    {
        _timer = Time;
    }
	
}