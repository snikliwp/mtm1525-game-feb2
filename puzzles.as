package  {
	// https://developer.mozilla.org/samples/domref/dispatchEvent.html
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.geom.Point;				//for the starting point
	import flash.utils.*
	
	
	
	public class puzzles extends MovieClip {
		var puzza:MovieClip = new MovieClip;
		var puzzb:MovieClip = new MovieClip;
		var base:MovieClip = new MovieClip;
		
		//create the global var for tracking the dragging object
		public var currentObj:MovieClip = null;
		
		public function puzzles() {
			// constructor code
//			puzzaall.visible = false;
			addDropPoints();
			setStartPoints();
			addDragging();
			setupDropZones();
		}  // end  function puzzles
		
		public function addDropPoints():void{
			//add the possible drop zones for each draggable object

			var tmp:String;
			var tmp1:String;
			var symbolClass:Class;
			var symbolClass1:Class;
			var mc:MovieClip;
			var mc1:MovieClip;
			for (var i:int=1; i<=20; i++) {
				tmp="puzza"+i;
				tmp1="base"+i;
				symbolClass=getDefinitionByName(tmp) as Class;
				symbolClass1=getDefinitionByName(tmp1) as Class;
				mc=new symbolClass();
				mc1=new symbolClass1();
				mc.dropzone = mc1;
				trace(mc);
				trace(mc.dropzone);
			} // endif
		}  // end  function addDropPoints
		
		public function setStartPoints():void{
			//starting points
			//use the Point object
			
			var tmp:String;
			var tmp1:String;
			var symbolClass:Class;
			var symbolClass1:Class;
			var mc:MovieClip;
			var mc1:MovieClip;
			for (var i:int=1; i<=20;) {
				tmp="puzza"+i;
				symbolClass=getDefinitionByName(tmp) as Class;
				mc=new symbolClass();
				mc.y = Math.round(Math.random() * 720 + 70);		//50.00000000000000000 - 750.0000000000000000
				if (mc.y > 420) {
					mc.x = Math.round(Math.random() * 920 + 70);		//50.00000000000000000 - 950.0000000000000000
					addChild(mc);
					i++;
				}  // endif
				trace(mc.x, mc.y);
//				trace(mc.dropzone);
			}  // endfor
			
//			for (var i:int=1; i<=20;) {
//				tmp="puzzb"+i;
//				symbolClass=getDefinitionByName(tmp) as Class;
//				mc=new symbolClass();
//				mc.x = Math.round(Math.random() * 920 + 70);		//50.00000000000000000 - 950.0000000000000000
//				mc.y = Math.round(Math.random() * 720 + 70);		//50.00000000000000000 - 750.0000000000000000
//				if ((mc.x < 300 || mc.x > 700) && (mc.y < 120 || mc.y > 420)) {
//					addChild(mc);
//					i++;
//				} // endif
//				trace(mc.x, mc.y);
//				trace(mc.dropzone);
//			} // endfor			
			
//			puzz1_a1.startPoint = new Point(puzz1_a1.x, puzz1_a1.y);
//			puzz1_a2.startPoint = new Point(puzz1_a2.x, puzz1_a2.y);
//			puzz1_a3.startPoint = new Point(puzz1_a3.x, puzz1_a3.y);
//			puzz1_a4.startPoint = new Point(puzz1_a4.x, puzz1_a4.y);
//			puzz1_a5.startPoint = new Point(puzz1_a5.x, puzz1_a5.y);
//			puzz1_b1.startPoint = new Point(puzz1_b1.x, puzz1_b1.y);
//			puzz1_b2.startPoint = new Point(puzz1_b2.x, puzz1_b2.y);
//			puzz1_b3.startPoint = new Point(puzz1_b3.x, puzz1_b3.y);
//			puzz1_b4.startPoint = new Point(puzz1_b4.x, puzz1_b4.y);
//			puzz1_b5.startPoint = new Point(puzz1_b5.x, puzz1_b5.y);
//			puzz1_c1.startPoint = new Point(puzz1_c1.x, puzz1_c1.y);
//			puzz1_c2.startPoint = new Point(puzz1_c2.x, puzz1_c2.y);
//			puzz1_c3.startPoint = new Point(puzz1_c3.x, puzz1_c3.y);
//			puzz1_c4.startPoint = new Point(puzz1_c4.x, puzz1_c4.y);
//			puzz1_c5.startPoint = new Point(puzz1_c5.x, puzz1_c5.y);
//			puzz1_d1.startPoint = new Point(puzz1_d1.x, puzz1_a1.y);
//			puzz1_d2.startPoint = new Point(puzz1_d2.x, puzz1_d2.y);
//			puzz1_d3.startPoint = new Point(puzz1_d3.x, puzz1_d3.y);
//			puzz1_d4.startPoint = new Point(puzz1_d4.x, puzz1_d4.y);
//			puzz1_d5.startPoint = new Point(puzz1_d5.x, puzz1_d5.y);

		} // end  function setStartPoints
		
		public function addDragging():void{
			//add the event listeners to the objects so they can be dragged
//			puzz1_a1.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_a1.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_a2.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_a2.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_a3.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_a3.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_a4.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_a4.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_a5.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_a5.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_b1.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_b1.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_b2.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_b2.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_b3.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_b3.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_b4.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_b4.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_b5.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_b5.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_c1.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_c1.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_c2.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_c2.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_c3.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_c3.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_c4.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_c4.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_c5.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_c5.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_d1.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_d1.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_d2.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_d2.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_d3.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_d3.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_d4.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_d4.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//			
//			puzz1_d5.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//			puzz1_d5.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			
			
			
			//handle leaving the stage too
			stage.addEventListener(Event.MOUSE_LEAVE, endDrag);
		} // end  function addDragging
		
		public function setupDropZones():void{
			//give each of the drop zones a property to remember if/what it is holding
//			base_a1.holding=null;
//			base_a2.holding=null;
//			base_a3.holding=null;
//			base_a4.holding=null;
//			base_a5.holding=null;
//			base_b1.holding=null;
//			base_b2.holding=null;
//			base_b3.holding=null;
//			base_b4.holding=null;
//			base_b5.holding=null;
//			base_c1.holding=null;
//			base_c2.holding=null;
//			base_c3.holding=null;
//			base_c4.holding=null;
//			base_c5.holding=null;
//			base_d1.holding=null;
//			base_d2.holding=null;
//			base_d3.holding=null;
//			base_d4.holding=null;
//			base_d5.holding=null;
		} // end  function setupDropZones
		
		public function beginDrag(ev:MouseEvent):void{
			//start dragging
//			var c:MovieClip = MovieClip(ev.currentTarget);
//			currentObj = c;
//			currentObj.startDrag(true);
//
//			//stop event propagation
//			//do some swapping of the z-indices to keep the current object on top of everything
//			//put the dropZones at the bottom layers first
//			
//			//lastly put the new thing on top
//			var topThing:MovieClip = MovieClip(this.getChildAt(this.numChildren - 1));
//			swapChildren(currentObj,topThing);
//			if (currentObj == currentObj.dropzone.holding) {
//				currentObj.dropzone.holding = null;
//			} //endif
			
			//currentObj.dropTarget will tell you which object the dragged object is currently over top of
		} // end  function beginDrag
		
		public function endDrag(ev:Event):void{
			//stop dragging
//			if (currentObj != null) {  // are we dragging something?
//				currentObj.stopDrag();  // if so drop it
////			info_txt.appendText(currentObj.name + "\n");
//			//stop event propagation
//			//decide whether or not to snap the object back to start or on top of dropzone
//			if(currentObj.hitTestPoint(currentObj.dropzone.x, currentObj.dropzone.y, true)) { // am I over my drop zone?
//				if (currentObj.dropzone.holding != null) {
//					currentObj.dropzone.holding.x = currentObj.dropzone.holding.startPoint.x;
//					currentObj.dropzone.holding.y = currentObj.dropzone.holding.startPoint.y;
//					currentObj.dropzone.holding = null;
//					} // endif
//				currentObj.x = currentObj.dropzone.x; //yes, well snap to the center of my drop zone
//				currentObj.y = currentObj.dropzone.y;
//				currentObj.dropzone.holding = currentObj;
//				isDone();
//			} // endif
//			else { // not over my drop zone, then go back to my origin
//				currentObj.x = currentObj.startPoint.x;
//				currentObj.y = currentObj.startPoint.y;
//			} // endelse
//
//				currentObj = null
//			} // endif
			
		} // end function endDrag
		
		public function isDone():void{
			//decide if the game is complete and trigger the final animation
//			if(topLayer_mc.holding != null && middleLayer_mc.holding != null) {
				// all dropzones are occupied
//				trace("Game Complete");
//			} // endif
			
		} // end  function isDone
		
	}   // end  class puzzles
	
} // end  package
