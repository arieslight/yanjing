package
{
	import flash.media.SoundChannel;
	
	import starling.display.Button;
	import starling.textures.Texture;
	
	public class SoundButton extends Button
	{	private var channel:SoundChannel;
		private var str:String = "";
		public function SoundButton(upState:Texture, sound:String="btnSound1")
		{
			super(upState);
			this.str = sound;
			if (channel != null) {
				channel.stop();
			}
			this.addEventListener("triggered",onTriggered);
		}
		
		private function onTriggered():void
		{
			channel=Game.assetManager.playSound(str);
		}
	}
}