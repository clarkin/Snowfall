package ;

import org.flixel.FlxParticle;
import org.flixel.util.FlxPoint;

class SnowflakeBackground extends FlxParticle
{

	public function new() 
	{
		super();
		
		scrollFactor = PlayState.SCROLLFACTOR_BACKGROUND;
	}

}