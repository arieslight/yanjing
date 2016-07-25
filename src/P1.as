package
{		
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	import com.greensock.easing.Cubic;
	
	import flash.geom.Point;
	import flash.text.TextField;
	
	import starling.animation.Tween;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.filters.GlowFilter;

	
	public class P1 extends Sprite
	{	private var bg:Image;
		public var tittle:Image;
		public var tittle1:Image;
		public var cloud1:Image;
		public var cloud2:Image;
		public var cloud3:Image;
		public var synopsis:Image;
		public var intr:TextField;
		public var btnDown:SoundButton;
		public var p2:P2;
		
		private var delta:Number;
		private var began:Number;
		
		public function P1()
		{	
			super();
			//背景
			bg = new Image(Game.assetManager.getTexture("bg"));
			this.addChild(bg);
			//概要
			synopsis = new Image(Game.assetManager.getTexture("synopsis"));
			this.addChild(synopsis);
			//标题
			tittle = new Image(Game.assetManager.getTexture("tittle"));
			this.addChild(tittle);
			tittle1 = new Image(Game.assetManager.getTexture("tittle1"));
			this.addChild(tittle1);
			//云
			cloud1 = new Image(Game.assetManager.getTexture("cloud1"));
			this.addChild(cloud1);
			
			cloud2 = new Image(Game.assetManager.getTexture("cloud2"));
			this.addChild(cloud2);
			cloud3 = new Image(Game.assetManager.getTexture("cloud3"));
			this.addChild(cloud3);
			
			//下拉			
			btnDown = new SoundButton(Game.assetManager.getTexture("btnDown"));	
			this.addChild(btnDown);
			
			
			p2 = new P2(tittle);
			this.addChild(p2);
			TweenMax.set(p2,{autoAlpha:0});
			btnDown.addEventListener(TouchEvent.TOUCH,onClick);
			reset();
			
		}
		
		public function reset():void
		{	//发光
			tittle.filter = new GlowFilter(0xFFCC00,2.5,3,0.1);
			cloud1.filter = new GlowFilter(0xffffff,0.5,5,0.9);
			cloud2.filter = new GlowFilter(0xffffff,0.5,5,0.9);
			cloud3.filter = new GlowFilter(0xffffff,0.5,5,0.9);
			btnDown.filter = new GlowFilter(0xffffff,1.5,5,0.9);
			//标题和下拉按钮
			TweenMax.set(bg,{autoAlpha:0,x:0,y:0});
			TweenMax.to(bg,1,{autoAlpha:1});
			TweenMax.set(synopsis,{autoAlpha:0,x:415,y:250});
			TweenMax.to(synopsis,1,{autoAlpha:1,ease:Cubic.easeInOut});
			TweenMax.set(tittle1,{autoAlpha:1,x:790,y:0});
			TweenMax.to(tittle1,1,{autoAlpha:1,x:790,y:60});
			TweenMax.set(tittle,{autoAlpha:1,x:610,y:0});
			TweenMax.to(tittle,1,{autoAlpha:1,x:610,y:145});
			TweenMax.set(btnDown,{autoAlpha:0,x:940,y:810});
			TweenMax.to(btnDown,1,{autoAlpha:1,x:940,y:810});
			TweenMax.to(btnDown,2.5,{x:940,y:870,ease:Back.easeIn,repeat:-1,yoyo:true});
			//云
			TweenMax.set(cloud1,{autoAlpha:1,x:270,y:265});
			TweenMax.to(cloud1,14,{autoAlpha:0.6,x:315,y:283,ease:Cubic.easeInOut,repeat:-1,yoyo:true});
			TweenMax.set(cloud2,{autoAlpha:1,x:1500,y:410});
			TweenMax.to(cloud2,27,{autoAlpha:1,x:1600,y:435,ease:Cubic.easeInOut,repeat:-1,yoyo:true});
			TweenMax.set(cloud3,{autoAlpha:0.7,x:1280,y:670});
			TweenMax.to(cloud3,32,{autoAlpha:1,x:1400,y:645,ease:Cubic.easeInOut,repeat:-1,yoyo:true});
			
		}
		
		private function onClick(e:TouchEvent):void
		{	
			var touch:Touch = e.getTouch(stage); 
			var pos:Point = touch.getLocation(stage);
			var y:Number = pos.y;
			trace ( touch.phase +"y:"+y);
			
			switch(touch.phase)
			{
				case TouchPhase.BEGAN:
				{	began = btnDown.y
					delta = y-began
					TweenMax.pauseAll();
					btnDown.y=y-delta;
					break;
				}
				case TouchPhase.MOVED:
				{	
					btnDown.y=y-delta;
					break;
				}
				case TouchPhase.ENDED:
				{	if(btnDown.y-began>50){
						TweenMax.to(tittle,0.8,{y:840});
						TweenMax.to([tittle1,synopsis,btnDown],0.8,{autoAlpha:0});
						TweenMax.to(cloud1,0.8,{autoAlpha:0,x:100,y:80});
						TweenMax.to(cloud2,0.8,{autoAlpha:0,x:1800,y:500});
						TweenMax.to(cloud3,0.8,{autoAlpha:0,x:1500,y:600});
						
						TweenMax.set(p2,{autoAlpha:1});
						}
					TweenMax.resumeAll();
					break;
				}
				default:
				{
					break;
				}
			}
		
			
		}		
		
	}
}