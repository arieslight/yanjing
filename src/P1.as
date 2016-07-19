package
{		
	import com.greensock.TweenMax;
	
	import flash.text.TextField;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;

	
	public class P1 extends Sprite
	{	private var bg:Image;
		public var title:Image;
		public var title1:Image
		public var intr:TextField;
		public var btnDown:SoundButton;
		public var p2:P2;
		public function P1()
		{	
			super();
			bg = new Image(Game.assetManager.getTexture("bg"));
			this.addChild(bg);;
			
			title = new Image(Game.assetManager.getTexture("title"));
			this.addChild(title);
			
			title1 = new Image(Game.assetManager.getTexture("title1"));
			this.addChild(title1);
			
			btnDown = new SoundButton(Game.assetManager.getTexture("btn1"));
			this.addChild(btnDown);
			
			p2 = new P2();
			this.addChild(p2);
			TweenMax.set(p2,{autoAlpha:0});
			
			reset();
			btnDown.addEventListener("click",onClick);
		}
		
		private function reset():void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onClick():void
		{
			// TODO Auto Generated method stub
			
		}		
		
	}
}