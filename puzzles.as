package  {
	// https://developer.mozilla.org/samples/domref/dispatchEvent.html
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.geom.Point;				//for the starting point
	
	public class puzzles extends MovieClip {
		
		//create the global var for tracking the dragging object
		public var currentObj:MovieClip = null;
		
		public function puzzles() {
			// constructor code
			addDropPoints();
			setStartPoints();
			addDragging();
			setupDropZones();
		}
		
		public function addDropPoints():void{
			//add the possible drop zones for each draggable object
			puzz1_a1.dropzone = base_a1;
			puzz1_a2.dropzone = base_a1;
			puzz1_a3.dropzone = base_a1;
			puzz1_a4.dropzone = base_a1;
			puzz1_a5.dropzone = base_a1;
			puzz1_a6.dropzone = base_a1;
			puzz1_a7.dropzone = base_a1;
			puzz1_a8.dropzone = base_a1;
			puzz1_a9.dropzone = base_a1;
			puzz1_a10.dropzone = base_a1;
			puzz1_a11.dropzone = base_a1;
			puzz1_a12.dropzone = base_a1;
			puzz1_a13.dropzone = base_a1;
			puzz1_a14.dropzone = base_a1;
			puzz1_a15.dropzone = base_a1;
			puzz1_a16.dropzone = base_a1;
			puzz1_a17.dropzone = base_a1;
			topB_mc.dropzone = topLayer_mc;
			middleA_mc.dropzone = middleLayer_mc;
			middleB_mc.dropzone = middleLayer_mc;
		}
		
		public function setStartPoints():void{
			//starting points
			//use the Point object
			topA_mc.startPoint = new Point(topA_mc.x, topA_mc.y);
			topB_mc.startPoint = new Point(topB_mc.x, topB_mc.y);
			middleA_mc.startPoint = new Point(middleA_mc.x, middleA_mc.y);
			middleB_mc.startPoint = new Point(middleB_mc.x, middleB_mc.y);

		}
		
		public function addDragging():void{
			//add the event listeners to the objects so they can be dragged
			topA_mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			topA_mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			topB_mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			topB_mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
						
			middleA_mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			middleA_mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			middleB_mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			middleB_mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			//handle leaving the stage too
			stage.addEventListener(Event.MOUSE_LEAVE, endDrag);
		}
		
		public function setupDropZones():void{
			//give each of the drop zones a property to remember if/what it is holding
			topLayer_mc.holding=null;
			middleLayer_mc.holding=null;
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
