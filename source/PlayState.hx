package;

import flash.ui.Mouse;
import org.flixel.*;
import org.flixel.util.*;
import openfl.Assets;

class PlayState extends FlxState
{
	private var _background_emitter:SnowflakeEmitter;
	private var _midground_emitter:SnowflakeEmitter;
	private var _foreground_emitter:SnowflakeEmitter;
	
	private var _player:Player;
	
	private var _layer_background:FlxGroup;
	private var _layer_midground:FlxGroup;
	private var _layer_foreground:FlxGroup;
	
	private var _tileMap:FlxTilemap;
	
	public static var SCROLLFACTOR_BACKGROUND:FlxPoint = new FlxPoint(0.5, 0.5);
	public static var SCROLLFACTOR_MIDGROUND:FlxPoint = new FlxPoint(1.0, 1.0);
	public static var SCROLLFACTOR_FOREGROUND:FlxPoint = new FlxPoint(1.5, 1.5);
	
	override public function create():Void
	{
		FlxG.mouse.show();
		
		
		_layer_background = new FlxGroup();
				
		_background_emitter = new SnowflakeEmitter(-50, -100, 2000, SCROLLFACTOR_BACKGROUND);
		_layer_background.add(_background_emitter);
		
		
		_layer_midground = new FlxGroup();
		
		_tileMap = new FlxTilemap();
		_tileMap.loadMap(Assets.getText("assets/images/tilemap.txt"), "assets/images/bugtilesblue.png", 16, 16);
		_layer_midground.add(_tileMap);
		
		_player = new Player(380, 350);
		_player.scrollFactor = SCROLLFACTOR_MIDGROUND;
		FlxG.camera.follow(_player, FlxCamera.STYLE_PLATFORMER); 
		_layer_midground.add(_player);
		
		_midground_emitter = new SnowflakeEmitter( -50, -100, 2000, SCROLLFACTOR_MIDGROUND);
		_layer_midground.add(_midground_emitter);
		
		
		_layer_foreground = new FlxGroup();
		
		_foreground_emitter = new SnowflakeEmitter(-50, -100, 2000, SCROLLFACTOR_FOREGROUND);
		
		_layer_foreground.add(_foreground_emitter);
		
		
		add(_layer_background);
		add(_layer_midground);
		add(_layer_foreground);
		
		_foreground_emitter.start(false, 60, .30, 0, 90);
		_foreground_emitter.setTimer(10);
		_midground_emitter.start(false, 180, .15, 0, 90);
		_midground_emitter.setTimer(20);
		_background_emitter.start(false, 60, .05, 0, 90);
		_background_emitter.setTimer(30);
	}
	
	override public function update():Void
	{
		super.update();
		
		//FlxG.collide(_layer_midground, _layer_midground);
		FlxG.collide(_player, _tileMap);
		
		if (FlxG.keys.justPressed("D"))
		{
			FlxG.visualDebug = !FlxG.visualDebug;
		}
		
		if (FlxG.keys.justPressed("R"))
		{
			FlxG.switchState(new MenuState());
		}
	}
	

}