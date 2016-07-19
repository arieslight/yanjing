package
{	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.KeyboardEvent;
	import flash.geom.Rectangle;
	import flash.system.IME;
	import flash.system.System;
	import flash.ui.Mouse;
	
	import starling.core.Starling;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;
	
	
	[SWF(width="1920", height="1080", frameRate="60", backgroundColor="#333333")]
	public class Main extends Sprite
	{	
		private var _starling:Starling;
		public static var pcWidth:int;
		public static var pcHeight:int;
		public static var stageW:Number = 1920;
		public static var stageH:Number = 1080;	
		public static var progress:StartProgress;
		public static var mouseShow:Boolean = false;
		public function Main()
		{
			pcWidth = stage.fullScreenWidth;
			pcHeight = stage.fullScreenHeight;
			Mouse.hide();
			IME.enabled=false;
			System.useCodePage=true;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			
			
			var rec:Rectangle ;
			var factor:Number = stageW/stageH ;
			if(pcWidth/pcHeight>factor)
			{
				var w:int = stageW;
				stageW = stageH*pcWidth/pcHeight ;
				trace(stageW);
				rec = 	new Rectangle(((stageW-w)*(pcHeight/stageH))/2,0,pcWidth ,pcHeight);
			}
			else
			{
				var h:int = stageH;
				stageH = stageW*pcHeight/pcWidth;
				rec = 	new Rectangle(0,((stageH-h)*(pcWidth/stageW))/2, pcWidth ,pcHeight);
			}
			
			var viewPort:Rectangle = RectangleUtil.fit(
				new Rectangle(0, 0, stageW, stageH), 
				rec, 
				ScaleMode.SHOW_ALL,false);
			
			_starling=  new Starling(Game,stage,viewPort,null,"auto","auto");
			_starling.stage.stageWidth = stageW;
			_starling.stage.stageHeight = stageH ;
			_starling.addEventListener("context3DCreate" , onContextCreated);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
			
			addProgress();
		}
		
		protected function onKeyDown(event:KeyboardEvent):void
		{
			if(event.ctrlKey&&event.keyCode == 72){
				if(mouseShow){
					Mouse.hide();
					mouseShow = false;
				}else{
					Mouse.show();
					mouseShow = true;
				}	
			}
			switch(event.keyCode)
			{
				case 27:
				{
					NativeApplication.nativeApplication.exit(0);
					break;
				}
				default:
				{
					break;
				}
			}          
		}
		
		private function addProgress():void
		{
			progress = new StartProgress();
			stage.addChild(progress);
			progress.x = pcWidth-progress.width>>1;
			progress.y = pcHeight-progress.height>>1;
			
		}
		public static function clear():void
		{
			progress.parent.removeChild(progress);
			progress = null;
		}
		private function onContextCreated():void
		{
			_starling.removeEventListener("context3DCreate" , onContextCreated);
			_starling.start();	
			
		}
	}
}