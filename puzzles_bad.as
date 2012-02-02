package  {
	// https://developer.mozilla.org/samples/domref/dispatchEvent.html
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.geom.Point;				//for the starting point
	import flash.utils.*
	
	
	
	public class puzzles_bad extends MovieClip {
		public var puzza:MovieClip = new MovieClip;
		public var puzzb:MovieClip = new MovieClip;
		public var base:MovieClip = new MovieClip;
//		public var tmp:String;
//		public var tmp1:String;
//		public var symbolClass:Class;
//		public var symbolClass1:Class;
//		public var mc:MovieClip;
//		public var mc1:MovieClip;
		public var currentObj:MovieClip = null;
		public var basex:Array = new Array(351.40, 418.35, 502.30, 582.30, 647.97, 340.85, 420.30, 500.30, 580.30, 658.80, 350.85, 418.35, 498.80, 580.35, 647.80, 339.85, 420.80, 499.35, 580.30, 660.35);
		public var basey:Array = new Array(157.40, 170.90, 160.90, 172.90, 161.90, 234.35, 231.90, 233.35, 234.90, 236.85, 306.90, 310.35, 311.35, 312.35, 312.35, 372.35, 383.35, 375.35, 386.35, 373.35);
		
		//create the global var for tracking the dragging object
		
		public function puzzles_bad() {
			// constructor code
//			puzzaall.visible = false;
			addPieces();
			addDropPoints();
			addDragging();
			setupDropZones();
		}  // end  function puzzles
		
		
		public function addPieces():void{
			//add the pieces to the stage
			//use the Point object
trace("in function addPieces");
			
			var tmp:String;
			var symbolClass:Class;
			var mc:MovieClip;
trace("Starting to add the base pieces");
			for (var i:int=1; i<=20; i++) { // add the puzzle base pieces so they will be lowest on the stage
				tmp = "base"+i;
				symbolClass=getDefinitionByName(tmp) as Class;
				mc = new symbolClass();
				mc.x = basex[i - 1]; // this is the x position on stage to hold the piece
				mc.y = basey[i - 1]; // this is the y position on stage to hold the piece
				mc.holding = null;	// set the holding property to null so it isn't holding anything
				addChild(mc);	//add the base piece to the stage
					
				trace("these are are the base pieces and it's x and y coords: ", mc, mc.x, mc.y);
//				trace(mc.dropzone);
			}  // endfor
			
trace("Starting to add the puzzle A pieces");
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
					mc.dropZone = new Point(basex[i-1], basey[i-1]);
trace("puzza.dropZone: ", mc, mc.dropZone);
//					mc.holding = null;
					addChild(mc);
					i++;
				}// endelse
//				trace("Coordinates over the puzzle base pieces  ", mc.x, mc.y);
//				trace(mc.dropzone);
			}  // endfor
			
trace("Starting to add the puzzle B pieces");
			for (var n:int=1; n<=20;) { // add the puzzle B pieces
				tmp="puzzb"+n;
				symbolClass=getDefinitionByName(tmp) as Class;
				mc=new symbolClass();
				mc.x = Math.round(Math.random() * 920 + 70);		//50.00000000000000000 - 950.0000000000000000
				mc.y = Math.round(Math.random() * 720 + 70);		//50.00000000000000000 - 750.0000000000000000
				if ((mc.y > 120 && mc.y < 420) || (mc.x > 300 && mc.x < 700)) { // don't let the piece stay on top of the puzzle
				}  else { // add the piece to the stage
					//add the event listeners to the objects so they can be dragged
					mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
					mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
					// setup the start point so we can return the piece to this point
					mc.startPoint = new Point(mc.x, mc.y);
					mc.dropZone = new Point(basex[i-1], basey[i-1]);
trace("puzzb.dropZone: ", mc, mc.dropZone);
//					mc.holding = null;
					addChild(mc);
					n++;
				}	// endelse
//				trace("Coordinates over the puzzle base pieces  ", mc.x, mc.y);
//				trace(mc.dropzone);
			}  // endfor
			
			


		} // end  function addPieces
		
		public function addDropPoints():void{
//			//add the possible drop zones for each draggable object
trace("in function addDropPoints");
//
//			var tmp:String;
//			var tmp1:String;
//			var symbolClass:Class;
//			var symbolClass1:Class;
//			var mc:MovieClip;
//			var mc1:MovieClip;
//			for (var i:int=1; i<=20; i++) {
//				tmp="puzza"+i;
//				tmp1="base"+i;
//				trace("tmp1.x and tmp1.y ", tmp1.x, tmp1.y);
//				
//				symbolClass=getDefinitionByName(tmp) as Class;
//				symbolClass1=getDefinitionByName(tmp1) as Class;
//				mc=new symbolClass();
//				mc1=new symbolClass1();
//				mc.dropzone = mc1;
//				mc1.holding = null;
//				
//				trace("mc and mc1 ", mc, mc1);
//				trace("mc.x and mc.y ", mc.x, mc.y);
//				trace("mc1.x and mc1.y ", mc1.x, mc1.y);
//				trace("mc.dropzone ",mc.dropzone.x, mc.dropzone.y);
//			} // endfor
		}  // end  function addDropPoints
		
		
		public function addDragging():void{
trace("in function addDragging");
			
			//handle leaving the stage too
			stage.addEventListener(Event.MOUSE_LEAVE, endDrag);
		} // end  function addDragging
		
		public function setupDropZones():void{
			//give each of the drop zones a property to remember if/what it is holding
trace("in function setupDropZones");
//			var tmp:String;
//			var symbolClass:Class;
//			var mc:MovieClip;
//			for (var i:int=1; i<=20;) { // Set up the drop zones
//				tmp="base"+i;
//				symbolClass=getDefinitionByName(tmp) as Class;
//				mc=new symbolClass();
//				mc.holding = null;
//				trace(mc.holding);
//			}  // endfor
		} // end  function setupDropZones
		
		public function beginDrag(ev:MouseEvent):void{
trace("in function beginDrag");
			//start dragging
			var mc:MovieClip = MovieClip(ev.currentTarget);
			currentObj = mc;
			currentObj.startDrag(true);

//			//lastly put the new thing on top
//			//do some swapping of the z-indices to keep the current object on top of everything
			var topThing:MovieClip = MovieClip(this.getChildAt(this.numChildren - 1));
			swapChildren(currentObj,topThing);
//			if (currentObj == currentObj.dropzone.holding) {
//				currentObj.dropzone.holding = null;
//			} //endif
			
			//currentObj.dropTarget will tell you which object the dragged object is currently over top of
		} // end  function beginDrag
		
		public function endDrag(ev:Event):void{
trace("in function endDrag");
			//stop dragging
			var mc:MovieClip = MovieClip(ev.currentTarget);					// make the current object from the event into a movie clip
//trace("current object: ", currentObj);
trace("mc: ", mc);
			//stop event propagation
//			if (currentObj != null) {  // are we dragging something?
			if (mc != null) {  // are we dragging something?
trace("in not null if");
//				currentObj.stopDrag();  // if so drop it
				mc.stopDrag();  // if so drop it
//trace("currentObj.dropZone: ", currentObj, currentObj.dropzone);
trace("mc.dropZone: ", mc, mc.dropzone);
			//decide whether or not to snap the object back to start or on top of dropzone
//			if(currentObj.hitTestPoint(currentObj.dropZone.x, currentObj.dropZone.y, true)) { // am I over my drop zone?
			if(mc.hitTestPoint(mc.dropZone.x, mc.dropZone.y, true)) { // am I over my drop zone?
				if (currentObj.dropzone.holding != null) {
					currentObj.dropzone.holding.x = currentObj.dropzone.holding.startPoint.x;
					currentObj.dropzone.holding.y = currentObj.dropzone.holding.startPoint.y;
					currentObj.dropzone.holding = null;
					} // endif
				currentObj.x = currentObj.dropzone.x; //yes, well snap to the center of my drop zone
				currentObj.y = currentObj.dropzone.y;
				currentObj.dropzone.holding = currentObj;
				isDone();
			} // endif
			else { // not over my drop zone, then go back to my origin
				currentObj.x = currentObj.startPoint.x;
				currentObj.y = currentObj.startPoint.y;
			} // endelse

				currentObj = null
			} // endif
			
		} // end function endDrag
		
		public function isDone():void{
trace("in function isDone");
			//decide if the game is complete and trigger the final animation
//			if(topLayer_mc.holding != null && middleLayer_mc.holding != null) {
				// all dropzones are occupied
//				trace("Game Complete");
//			} // endif
			
		} // end  function isDone
		
	}   // end  class puzzles
	
} // end  package
