package ;

import org.flixel.FlxParticle;
import org.flixel.util.FlxPoint;

class Snowflake extends FlxParticle
{

	public function new() 
	{
		super();
		
		scrollFactor = PlayState.SCROLLFACTOR_MIDGROUND;
	}

}