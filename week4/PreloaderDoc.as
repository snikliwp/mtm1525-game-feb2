package  {
	
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.events.HTTPStatusEvent;
	
	public class PreloaderDoc extends MovieClip {
		
		public var loader:Loader = new Loader();
		
		public function PreloaderDoc() {
			// constructor code
			var req:URLRequest = new URLRequest("big_image.jpg");
			loader.contentLoaderInfo.addEventListener(Event.INIT, infoReady);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loading);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, fileRead);
			loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpReady);
			//go get the image
			loader.load(req);
			//start adding clouds
			this.addEventListener(Event.ENTER_FRAME, goLoopy);
		}
		
		public function infoReady(ev:Event):void{
			//event.init
			trace("Image info is ready. width:" + ev.target.width);
		}
		
		public function imageLoaded(ev:Event):void{
			//event.complete
			addChild( loader );
			loader.scaleX = loader.scaleY= .133
			launcher_mc.visible = false;
			trace("Image could be added to the stage now.");
		}
		
		public function loading(ev:ProgressEvent):void{
			//ProgressEvent.PROGRESS
			var pct:Number = ev.bytesLoaded/ev.bytesTotal;
			trace("percentage loaded: ", ev.bytesLoaded + " / " + ev.bytesTotal + " = " + pct);
			/**
			We want to have the rocket rotate from 0degrees to -90degrees. 
			A range of 90degrees in the negative direction
			**/
			var newAngle:Number = pct * 90 * -1;
			launcher_mc.crane_arm_mc.rotation = newAngle;
			


			//write out the percentage loaded
			//get rid of the decimal places
			//make the number between 0 and 100 instead of 0 and 1.
			var strPct:String = Math.round( pct * 100).toString();
			loaded_txt.text = strPct + "% Loaded";
			
			
			//When we get to 95% loaded... stop adding clouds
			if( pct >= .95){
				this.removeEventListener(Event.ENTER_FRAME, goLoopy);
			}
		}
		
		public function fileRead(ev:IOErrorEvent):void{
			//IOErrorEvent.IO_ERROR
			trace("Could not open file. " + ev.text );
		}
		
		public function httpReady(ev:HTTPStatusEvent):void{
			//HTTPStatusEvent.HTTP_STATUS
			trace("HTTP status code is " + ev.status);
			if( ev.status != 0){
				trace(" from " + ev.responseURL);
			}
		}
		
		public function goLoopy(ev:Event):void{
			//add clouds at the base of the rocket
			var _x:Number = launcher_mc.x + Math.random() * 20 - 10;
			var _y:Number = launcher_mc.y + Math.random() * 20 - 10;
			var _rot:Number = Math.random() * 360;
			var _scale:Number = Math.random() * 0.8 + 0.2;
			var c:Cloud = new Cloud();
			c.rotation = _rot;
			c.scaleX = c.scaleY = _scale;
			c.x = _x;
			c.y = _y;
			addChild(c);
			
		}
	}
	
}
