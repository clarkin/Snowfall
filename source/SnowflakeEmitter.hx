package ;
import org.flixel.*;
import org.flixel.util.FlxPoint;

class SnowflakeEmitter extends FlxEmitter
{
	public var _scrollFactor:FlxPoint;

	public function new(X:Float = 0, Y:Float = 0, Size:Int = 0, ScrollFactor:FlxPoint = null)
	{
		super(X, Y, Size);
		_scrollFactor = ScrollFactor;
		
		if (_scrollFactor == null) {
			_scrollFactor = new FlxPoint(1.0, 1.0);
		}
		
		setSize(FlxG.width + 200, FlxG.height + 200);
		setRotation( -180, 180);
		bounce = 0.1;
		gravity = 1;
		
		if (_scrollFactor == PlayState.SCROLLFACTOR_BACKGROUND) {
			setXSpeed(-10, 0);
			setYSpeed(0, 10);
			setScale(0.2, 0.3, 0.1, 0.2);
			setAlpha(0.3, 0.4, 0.1, 0.2);
			particleClass = SnowflakeBackground;
		} else if (_scrollFactor == PlayState.SCROLLFACTOR_MIDGROUND) {
			setXSpeed(-10, 0);
			setYSpeed(0, 10);
			setScale(0.6, 0.8, 0.3, 0.4);
			setAlpha(0.9, 1.0, 0.4, 0.5);
			particleClass = Snowflake;
		} else if (_scrollFactor == PlayState.SCROLLFACTOR_FOREGROUND) {
			setXSpeed(-10, 0);
			setYSpeed(0, 10);
			setScale(1.5, 3.0, 0.8, 1.0);
			setAlpha(0.2, 0.3, 0.1, 0.2);
			setRotation( -60, 60);
			particleClass = SnowflakeForeground;
		}
		makeParticles("assets/images/snow_sprites.png", 2000, 32, true, 0.1); 
	}
	
	override public function update():Void
	{
		super.update();
		
		setSize(FlxG.width + 200, 0);
	}
	
	public function setTimer(Time:Float):Void
    {
        _timer = Time;
    }
	
}