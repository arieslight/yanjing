package
{
	import com.greensock.TweenMax;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class P3 extends Sprite
	{	private var intrBack:Image;
		private var tittle:Image;
		public function P3()
		{	
			super();
			intrBack = new Image(Game.assetManager.getTexture("intrBack"));
			this.addChild(intrBack);
			TweenMax.set(intrBack,{autoAlpha:1,x:40,y:80})
			tittle = new Image(Game.assetManager.getTexture("tittle3"));
			this.addChild(tittle);
			TweenMax.set(tittle,{autoAlpha:1,x:1030,y:75});
			
		}
		
		public function init(name:String):void{
			
		}
	}
}