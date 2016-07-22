package
{
	import com.greensock.TweenMax;
	import com.greensock.loading.XMLLoader;
	
	import flash.display3D.Context3DTextureFormat;
	import flash.filesystem.File;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	public class Game extends Sprite
	{	public static var URL_PATH:String = File.applicationDirectory.nativePath+"/";
		public static var assetManager:AssetManager;
		public static var xmlLoader:XMLLoader;
		private var appDir:File;
		public static var p1:P1;
		
		public function Game()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded():void
		{	
			assetManager = new AssetManager();
			assetManager.verbose=true;
			appDir = File.applicationDirectory;
			assetManager.textureFormat = Context3DTextureFormat.BGRA;
			assetManager.enqueue(appDir.resolvePath(URL_PATH+"assets/pngs"));
			assetManager.enqueue(appDir.resolvePath(URL_PATH+"assets/sounds"));
			xmlLoader = new XMLLoader(URL_PATH+"assets/data/deatil.xml");	
			assetManager.loadQueue(function(ratio:Number):void
			{
				Main.progress.gotoAndStop(int(ratio*10));
				if(ratio == 1 ){
					Main.clear();
					init();
				}
			});
		}
		private function init():void
		{
			p1 = new P1();
			this.addChild(p1);
			TweenMax.from(p1,0.5,{autoAlpha:0});
		}
	}
}