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
			puzz1_all.visible = false;
			addDropPoints();
			setStartPoints();
			addDragging();
			setupDropZones();
		}
		
		public function addDropPoints():void{
			//add the possible drop zones for each draggable object
			puzz1_a1.dropzone = base_a1;
			puzz1_a2.dropzone = base_a2;
			puzz1_a3.dropzone = base_a3;
			puzz1_a4.dropzone = base_a4;
			puzz1_a5.dropzone = base_a5;
			puzz1_b1.dropzone = base_b1;
			puzz1_b2.dropzone = base_b2;
			puzz1_b3.dropzone = base_b3;
			puzz1_b4.dropzone = base_b4;
			puzz1_b5.dropzone = base_b5;
			puzz1_c1.dropzone = base_c1;
			puzz1_c2.dropzone = base_c2;
			puzz1_c3.dropzone = base_c3;
			puzz1_c4.dropzone = base_c4;
			puzz1_c5.dropzone = base_c5;
			puzz1_d1.dropzone = base_d1;
			puzz1_d2.dropzone = base_d2;
			puzz1_d3.dropzone = base_d3;
			puzz1_d4.dropzone = base_d4;
			puzz1_d5.dropzone = base_d5;
		}
		
		public function setStartPoints():void{
			//starting points
			//use the Point object
			puzz1_a1.startPoint = new Point(puzz1_a1.x, puzz1_a1.y);
			puzz1_a2.startPoint = new Point(puzz1_a2.x, puzz1_a2.y);
			puzz1_a3.startPoint = new Point(puzz1_a3.x, puzz1_a3.y);
			puzz1_a4.startPoint = new Point(puzz1_a4.x, puzz1_a4.y);
			puzz1_a5.startPoint = new Point(puzz1_a5.x, puzz1_a5.y);
			puzz1_b1.startPoint = new Point(puzz1_b1.x, puzz1_b1.y);
			puzz1_b2.startPoint = new Point(puzz1_b2.x, puzz1_b2.y);
			puzz1_b3.startPoint = new Point(puzz1_b3.x, puzz1_b3.y);
			puzz1_b4.startPoint = new Point(puzz1_b4.x, puzz1_b4.y);
			puzz1_b5.startPoint = new Point(puzz1_b5.x, puzz1_b5.y);
			puzz1_c1.startPoint = new Point(puzz1_c1.x, puzz1_c1.y);
			puzz1_c2.startPoint = new Point(puzz1_c2.x, puzz1_c2.y);
			puzz1_c3.startPoint = new Point(puzz1_c3.x, puzz1_c3.y);
			puzz1_c4.startPoint = new Point(puzz1_c4.x, puzz1_c4.y);
			puzz1_c5.startPoint = new Point(puzz1_c5.x, puzz1_c5.y);
			puzz1_d1.startPoint = new Point(puzz1_d1.x, puzz1_a1.y);
			puzz1_d2.startPoint = new Point(puzz1_d2.x, puzz1_d2.y);
			puzz1_d3.startPoint = new Point(puzz1_d3.x, puzz1_d3.y);
			puzz1_d4.startPoint = new Point(puzz1_d4.x, puzz1_d4.y);
			puzz1_d5.startPoint = new Point(puzz1_d5.x, puzz1_d5.y);

		}
		
		public function addDragging():void{
			//add the event listeners to the objects so they can be dragged
			puzz1_a1.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_a1.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_a2.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_a2.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_a3.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_a3.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_a4.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_a4.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_a5.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_a5.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_b1.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_b1.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_b2.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_b2.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_b3.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_b3.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_b4.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_b4.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_b5.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_b5.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_c1.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_c1.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_c2.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_c2.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_c3.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_c3.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_c4.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_c4.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_c5.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_c5.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_d1.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_d1.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_d2.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_d2.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_d3.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_d3.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_d4.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_d4.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			puzz1_d5.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
			puzz1_d5.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			
			
			//handle leaving the stage too
			stage.addEventListener(Event.MOUSE_LEAVE, endDrag);
		}
		
		public function setupDropZones():void{
			//give each of the drop zones a property to remember if/what it is holding
			base_a1.holding=null;
			base_a2.holding=null;
			base_a3.holding=null;
			base_a4.holding=null;
			base_a5.holding=null;
			base_b1.holding=null;
			base_b2.holding=null;
			base_b3.holding=null;
			base_b4.holding=null;
			base_b5.holding=null;
			base_c1.holding=null;
			base_c2.holding=null;
			base_c3.holding=null;
			base_c4.holding=null;
			base_c5.holding=null;
			base_d1.holding=null;
			base_d2.holding=null;
			base_d3.holding=null;
			base_d4.holding=null;
			base_d5.holding=null;
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
//			info_txt.appendText(currentObj.name + "\n");
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
//			if(topLayer_mc.holding != null 
//			   && middleLayer_mc.holding != null) 
			   {
				// all dropzones are occupied
				trace("Game Complete");
			}
			
		}
		
	}
	
}
