package ;

import org.flixel.FlxParticle;
import org.flixel.util.FlxPoint;

class SnowflakeForeground extends FlxParticle
{

	public function new() 
	{
		super();
		
		scrollFactor = PlayState.SCROLLFACTOR_FOREGROUND;
	}

}