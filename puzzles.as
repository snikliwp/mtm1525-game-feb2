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
		
		public function puzzles() {
			// constructor code
			setStartPoints();
//			addDropPoints();
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
			addDropPoints();
		}
		
public function addDropPoints():void{
			//add the possible drop zones for each draggable object
			puzza1.dropzone = abase1;
			puzzb1.dropzone = abase1;
			puzza2.dropzone = abase2;
			puzzb2.dropzone = abase2;
			puzza3.dropzone = abase3;
			puzzb3.dropzone = abase3;
			puzza4.dropzone = abase4;
			puzzb4.dropzone = abase4;
			puzza5.dropzone = abase5;
			puzzb5.dropzone = abase5;
			puzza6.dropzone = abase6;
			puzzb6.dropzone = abase6;
			puzza7.dropzone = abase7;
			puzzb7.dropzone = abase7;
			puzza8.dropzone = abase8;
			puzzb8.dropzone = abase8;
			puzza9.dropzone = abase9;
			puzzb9.dropzone = abase9;
			puzzb10.dropzone = abase10;
			puzza10.dropzone = abase10;
			puzzb11.dropzone = abase11;
			puzza11.dropzone = abase11;
			puzzb12.dropzone = abase12;
			puzza12.dropzone = abase12;
			puzzb13.dropzone = abase13;
			puzza13.dropzone = abase13;
			puzzb14.dropzone = abase14;
			puzza14.dropzone = abase14;
			puzzb15.dropzone = abase15;
			puzza15.dropzone = abase15;
			puzzb16.dropzone = abase16;
			puzza16.dropzone = abase16;
			puzzb17.dropzone = abase17;
			puzza17.dropzone = abase17;
			puzzb18.dropzone = abase18;
			puzza18.dropzone = abase18;
			puzzb19.dropzone = abase19;
			puzza19.dropzone = abase19;
			puzza20.dropzone = abase20;
			puzzb20.dropzone = abase20;
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
			abase1.holding=null;
			abase2.holding=null;
			abase3.holding=null;
			abase4.holding=null;
			abase5.holding=null;
			abase6.holding=null;
			abase7.holding=null;
			abase8.holding=null;
			abase9.holding=null;
			abase10.holding=null;
			abase11.holding=null;
			abase12.holding=null;
			abase13.holding=null;
			abase14.holding=null;
			abase15.holding=null;
			abase16.holding=null;
			abase17.holding=null;
			abase18.holding=null;
			abase19.holding=null;
			abase20.holding=null;
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
