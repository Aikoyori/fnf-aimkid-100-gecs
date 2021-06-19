package;

import flixel.system.FlxSound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class FunnyCredits extends MusicBeatState
{
	var replayButton:FlxSprite;
	var cancelButton:FlxSprite;
	var musicbg:FlxSound;
	var replaySelect:Bool = false;

	public function new():Void
	{
		super();
	}

	override function create()
	{
		if (FlxG.sound.music != null)
			FlxG.sound.music.stop();

		musicbg = new FlxSound().loadEmbedded(Paths.music('breakfast'), true, true);
		musicbg.volume = 0;
		musicbg.play(false, FlxG.random.int(0, Std.int(musicbg.length / 2)));

		FlxG.sound.list.add(musicbg);

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('credits'));
		add(bg);


		super.create();
	}

	override function update(elapsed:Float)
	{
		if (musicbg.volume+( 0.05 * elapsed) < 0.7)
			musicbg.volume += 0.05 * elapsed;
		else
			{
				musicbg.volume=0.7;
			}

		if (FlxG.keys.justPressed.ESCAPE || FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new MainMenuState());
		}

		super.update(elapsed);
	}

	function changeThing():Void
	{
		replaySelect = !replaySelect;

		if (replaySelect)
		{
			cancelButton.animation.curAnim.curFrame = 0;
			replayButton.animation.curAnim.curFrame = 1;
		}
		else
		{
			cancelButton.animation.curAnim.curFrame = 1;
			replayButton.animation.curAnim.curFrame = 0;
		}
	}
}
