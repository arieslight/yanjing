package
{
	import com.greensock.TweenMax;
	
	import flash.geom.Point;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	
	
	
	public class P2 extends Sprite
	{	public var tittle:Image;
		private var backBtn:SoundButton;
		private var eight:Array;
		private var eightX:Array;
		private var eightY:Array;
		private var eight1:SoundButton;
		private var eight2:SoundButton;
		private var eight3:SoundButton;
		private var eight4:SoundButton;
		private var eight5:SoundButton;
		private var eight6:SoundButton;
		private var eight7:SoundButton;
		private var eight8:SoundButton;
		public var p3:P3;
		
		private var flag:Boolean = false;
		private var now:Number;
		private var began:Number;
		public function P2(tittle:Image )
		{	this.tittle = tittle;
			super();
			
			
			//八绝
			eight = [eight1,eight2,eight3,eight4,eight5,eight6,eight7,eight8]
			eightX = [25,230,395,640,870,1105,1330,1580];	
			eightY = [95,440,195,150,490,250,125,485];
			for(var i:int in eight) 
			{
				eight[i] = new SoundButton(Game.assetManager.getTexture("eight"+i));
				//eight[i].downState=Game.assetManager.getTexture("s"+i); 
				eight[i].scaleWhenDown=1.0
				eight[i].name = ""+i;
				this.addChild(eight[i]);
				TweenMax.set(eight[i],{autoAlpha:1,x:eightX[i],y:0});
				eight[i].addEventListener(TouchEvent.TOUCH,onclick);
			}
			
			//返回按钮
			backBtn = new SoundButton(Game.assetManager.getTexture("back"));
			this.addChild(backBtn);
			TweenMax.set(backBtn,{autoAlpha:1,x:1840,y:80});
			backBtn.addEventListener(Event.TRIGGERED,back);
			
			p3 = new P3();
			this.addChild(p3);
			TweenMax.set(p3,{autoAlpha:0});
		}
		
		private function onclick(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage); 
			var pos:Point = touch.getLocation(stage);
			
			switch(touch.phase)
			{
				case TouchPhase.BEGAN:
				{	began = touch.target.y;
					now = pos.y-began;
					TweenMax.pauseAll();
					if(now>eightY[touch.target.name])
					{
						touch.target.scaleX=1.1;
						flag = true;
					}
					break;
				}
				
				case TouchPhase.ENDED:
				{	
					touch.target.scaleX=1.0;
					TweenMax.resumeAll();
					if(flag){
						
						TweenMax.to([backBtn,tittle],0.5,{autoAlpha:0});
						for  (var i:int in eight) 
						{
							TweenMax.to(eight[i],0.5,{autoAlpha:0});
						}
						
						TweenMax.to(p3,0.5,{autoAlpha:1});
						p3.init(touch.target.name);
					}
					break;
				}
				default:
				{
					break;
				}
			}
		}
		
		
		private function back():void
		{
			TweenMax.set(this,{autoAlpha:0});
			Game.p1.reset();
		}
	}
}



















