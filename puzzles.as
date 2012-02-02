package  {
	// https://developer.mozilla.org/samples/domref/dispatchEvent.html
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.geom.Point;				//for the starting point
	import flash.utils.*
	
	public class puzzles extends MovieClip {
		
		//create the global var for tracking the dragging object
		public var currentObj:MovieClip = null;
		
		public function SnowmanDoc() {
			// constructor code
			setStartPoints();
			addDropPoints();
			addDragging();
			setupDropZones();
		}
		
		
		
		public function setStartPoints():void{
			//starting points
			//use the Point object
			var tmp:String;
			var symbolClass:Class;
			var mc:MovieClip;
			for (var i:int=1; i<=20;) { // add the puzzle A pieces
				tmp="puzza"+i;
				symbolClass=getDefinitionByName(tmp) as Class;
				mc=new symbolClass();
				mc.x = Math.round(Math.random() * 920 + 70);		//50.00000000000000000 - 950.0000000000000000
				mc.y = Math.round(Math.random() * 720 + 70);		//50.00000000000000000 - 750.0000000000000000
				if ((mc.y > 120 && mc.y < 420) || (mc.x > 300 && mc.x < 700)) { // don't let the piece stay on top of the puzzle
				}  else {  // add the piece to the stage
					//add the event listeners to the objects so they can be dragged
					mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
					mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
					// setup the start point so we can return the piece to this point
					mc.startPoint = new Point(mc.x, mc.y);
					addChild(mc);
					i++;
				}// endelse
			}  // endfor
			for (var i:int=1; i<=20;) { // add the puzzle A pieces
				tmp="puzzb"+i;
				symbolClass=getDefinitionByName(tmp) as Class;
				mc=new symbolClass();
				mc.x = Math.round(Math.random() * 920 + 70);		//50.00000000000000000 - 950.0000000000000000
				mc.y = Math.round(Math.random() * 720 + 70);		//50.00000000000000000 - 750.0000000000000000
				if ((mc.y > 120 && mc.y < 420) || (mc.x > 300 && mc.x < 700)) { // don't let the piece stay on top of the puzzle
				}  else {  // add the piece to the stage
					//add the event listeners to the objects so they can be dragged
					mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
					mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
					// setup the start point so we can return the piece to this point
					mc.startPoint = new Point(mc.x, mc.y);
					addChild(mc);
					i++;
				}// endelse
			}  // endfor
//			topA_mc.startPoint = new Point(topA_mc.x, topA_mc.y);
//			topB_mc.startPoint = new Point(topB_mc.x, topB_mc.y);
//			middleA_mc.startPoint = new Point(middleA_mc.x, middleA_mc.y);
//			middleB_mc.startPoint = new Point(middleB_mc.x, middleB_mc.y);

		}
		
public function addDropPoints():void{
			//add the possible drop zones for each draggable object
			puzza1.dropzone = base1;
			puzzb1.dropzone = base1;
			puzza2.dropzone = base2;
			puzzb2.dropzone = base2;
			puzza3.dropzone = base3;
			puzzb3.dropzone = base3;
			puzza4.dropzone = base4;
			puzzb4.dropzone = base4;
			puzza5.dropzone = base5;
			puzzb5.dropzone = base5;
			puzza6.dropzone = base6;
			puzzb6.dropzone = base6;
			puzza7.dropzone = base7;
			puzzb7.dropzone = base7;
			puzza8.dropzone = base8;
			puzzb8.dropzone = base8;
			puzza9.dropzone = base9;
			puzzb9.dropzone = base9;
			puzzb10.dropzone = base10;
			puzza10.dropzone = base10;
			puzzb11.dropzone = base11;
			puzza11.dropzone = base11;
			puzzb12.dropzone = base12;
			puzza12.dropzone = base12;
			puzzb13.dropzone = base13;
			puzza13.dropzone = base13;
			puzzb14.dropzone = base14;
			puzza14.dropzone = base14;
			puzzb15.dropzone = base15;
			puzza15.dropzone = base15;
			puzzb16.dropzone = base16;
			puzza16.dropzone = base16;
			puzzb17.dropzone = base17;
			puzza17.dropzone = base17;
			puzzb18.dropzone = base18;
			puzza18.dropzone = base18;
			puzzb19.dropzone = base19;
			puzza19.dropzone = base19;
			puzza20.dropzone = base20;
			puzzb20.dropzone = base20;
		}		
		
		public function addDragging():void{
			//add the event listeners to the objects so they can be dragged
//			topA_mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			topA_mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			topB_mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			topB_mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//						
//			middleA_mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			middleA_mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			middleB_mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			middleB_mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			//handle leaving the stage too
			stage.addEventListener(Event.MOUSE_LEAVE, endDrag);
		}
		
		public function setupDropZones():void{
			//give each of the drop zones a property to remember if/what it is holding
			base1.holding=null;
			base2.holding=null;
			base3.holding=null;
			base4.holding=null;
			base5.holding=null;
			base6.holding=null;
			base7.holding=null;
			base8.holding=null;
			base9.holding=null;
			base10.holding=null;
			base11.holding=null;
			base12.holding=null;
			base13.holding=null;
			base14.holding=null;
			base15.holding=null;
			base16.holding=null;
			base17.holding=null;
			base18.holding=null;
			base19.holding=null;
			base20.holding=null;
		}
		
		public function beginDrag(ev:MouseEvent):void{
			//start dragging
			var c:MovieClip = MovieClip(ev.currentTarget);
			currentObj = c;
			currentObj.startDrag(true);

			//stop event propagation
			//do some swapping of the z-indices to keep the current object on top of everything
			//put the dropZones at the bottom layers first
			
			//lastly put the new thing on top
			var topThing:MovieClip = MovieClip(this.getChildAt(this.numChildren - 1));
			swapChildren(currentObj,topThing);
			if (currentObj == currentObj.dropzone.holding) {
				currentObj.dropzone.holding = null;
			}
			
			//currentObj.dropTarget will tell you which object the dragged object is currently over top of
		}
		
		public function endDrag(ev:Event):void{
			//stop dragging
			if (currentObj != null) {  // are we dragging something?
				currentObj.stopDrag();  // if so drop it
			info_txt.appendText(currentObj.name + "\n");
			//stop event propagation
			//decide whether or not to snap the object back to start or on top of dropzone
			if(currentObj.hitTestPoint(currentObj.dropzone.x, currentObj.dropzone.y, true)) { // am I over my drop zone?
				if (currentObj.dropzone.holding != null) {
					currentObj.dropzone.holding.x = currentObj.dropzone.holding.startPoint.x;
					currentObj.dropzone.holding.y = currentObj.dropzone.holding.startPoint.y;
					currentObj.dropzone.holding = null;
					}
				currentObj.x = currentObj.dropzone.x; //yes, well snap to the center of my drop zone
				currentObj.y = currentObj.dropzone.y;
				currentObj.dropzone.holding = currentObj;
				isDone();
			} 
			else { // not over my drop zone, then go back to my origin
				currentObj.x = currentObj.startPoint.x;
				currentObj.y = currentObj.startPoint.y;
			}

				currentObj = null
			}
			
		}
		
		public function isDone():void{
			//decide if the game is complete and trigger the final animation
			if(topLayer_mc.holding != null 
			   && middleLayer_mc.holding != null) 
			   {
				// all dropzones are occupied
				trace("Game Complete");
			}
			
		}
		
	}
	
}
