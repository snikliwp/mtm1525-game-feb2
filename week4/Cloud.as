package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Cloud extends MovieClip {
		
		public var xvel:Number = 0;
		public var yvel:Number = 0;
		
		public function Cloud() {
			// constructor code
			addEventListener(Event.ENTER_FRAME, goFrame);
		}
		
		public function goFrame(ev:Event):void{
			//move gradually towards the top of the screen
			//drift randomly left or right
			//slowly rotate
			//reduce the alpha slightly
			//when off the top of the screen OR when alpha below 1, remove the event listener and the object
			xvel += Math.random() * 1.2 - 0.5; // a value of 2 - 0.5 will create a wind effect as they have a probability of getting a higher x number.
			yvel += Math.random() * 1 - 0.8;
			x += xvel;
			y += yvel;
			alpha -= Math.random() * 0.02; //up to 2% reduction per frame
			rotation += Math.random() * 3 - 1.5;
			if(y < 0 || alpha < 0.01){
				removeEventListener(Event.ENTER_FRAME, goFrame);
				parent.removeChild(this);
			}
		}
	}
	
}
