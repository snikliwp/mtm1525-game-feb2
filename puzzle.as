﻿package  {
	// https://developer.mozilla.org/samples/domref/dispatchEvent.html
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.geom.Point;				//for the starting point
	import flash.utils.*
	
	
	
	public class puzzle extends MovieClip {
		public var puzza:MovieClip = new MovieClip;
		public var puzzb:MovieClip = new MovieClip;
		public var base:MovieClip = new MovieClip;
		public var whatPuzzle:String = "puzza";
		public var totalPieces:Number = 0;
		public var currentObj:MovieClip = null;
		public var basex:Array = new Array(349.30, 413.30, 496.30, 576.30, 641.95, 338.80, 415.30, 494.95, 573.95, 653.30, 348.95, 413.95, 493.30, 575.30, 641.95, 338.35, 415.30, 492.95, 575.30, 655.30);
		public var basey:Array = new Array(158.35, 173.35, 162.35, 175.35, 163.35, 234.35, 233.35, 234.00, 237.35, 237.35, 308.35, 308.35, 309.00, 311.35, 311.35, 370.00, 381.35, 373.00, 385.35, 372.35);
//		public var basex:Array = new Array(351.40, 418.35, 502.30, 582.30, 647.97, 340.85, 420.30, 500.30, 580.30, 658.80, 350.85, 418.35, 498.80, 580.35, 647.80, 339.85, 420.80, 499.35, 580.30, 660.35);
//		public var basey:Array = new Array(157.40, 170.90, 160.90, 172.90, 161.90, 234.35, 231.90, 233.35, 234.90, 236.85, 306.90, 310.35, 311.35, 312.35, 312.35, 372.35, 383.35, 375.35, 386.35, 373.35);
		public var inPlace:Array = new Array;
		
		//create the global var for tracking the dragging object
		
		public function puzzle() {
			// constructor code
//			puzzselect.visible = true;
			addBasePieces();
			stage.addEventListener(Event.MOUSE_LEAVE, endDrag);
			addDropPoints();
			addDragging();
			setupDropZones();
		}  // end  function puzzles
		
		
		public function addBasePieces():void{
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
		} // end  function addBasePieces
			
		public function addPuzzleAPieces():void{
			//add the pieces to the stage
trace("Starting to add the puzzle A pieces");
			for (var i:int=1; i<=20;) { // add the puzzle A pieces
				tmp="puzza"+i;
				symbolClass=getDefinitionByName(tmp) as Class;
				mc=new symbolClass();
				mc.x = Math.round(Math.random() * 920 + 70);		//50.00000000000000000 - 950.0000000000000000
				mc.y = Math.round(Math.random() * 720 + 70);		//50.00000000000000000 - 750.0000000000000000
				if ((mc.y > 115 && mc.y < 425) || (mc.x > 295 && mc.x < 705)) { // don't let the piece stay on top of the puzzle
				}  else {  // add the piece to the stage
					//add the event listeners to the objects so they can be dragged
					mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
					mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
					// setup the start point so we can return the piece to this point
					mc.startPoint = new Point(mc.x, mc.y);
					// set up the drop zone coordinates
					mc.dropZone = new Point(basex[i-1], basey[i-1]);
					mc.txt = tmp;
					addChild(mc);
					i++;
					
				}// endelse
			}  // endfor
		} // end  function addPuzzleAPieces
			
		public function addPuzzleBPieces():void{
			//add the pieces to the stage
//trace("Starting to add the puzzle B pieces");
//			for (var n:int=1; n<=20;) { // add the puzzle B pieces
//				tmp="puzzb"+n;
//				symbolClass=getDefinitionByName(tmp) as Class;
//				mc=new symbolClass();
//				mc.x = Math.round(Math.random() * 920 + 70);		//50.00000000000000000 - 950.0000000000000000
//				mc.y = Math.round(Math.random() * 720 + 70);		//50.00000000000000000 - 750.0000000000000000
//				if ((mc.y > 115 && mc.y < 425) || (mc.x > 295 && mc.x < 705)) { // don't let the piece stay on top of the puzzle
//				}  else { // add the piece to the stage
//					//add the event listeners to the objects so they can be dragged
//					mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
//					mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
//					// setup the start point so we can return the piece to this point
//					mc.startPoint = new Point(mc.x, mc.y);
//					mc.dropZone = new Point(basex[n-1], basey[n-1]);
//					mc.inPlace = null;
//trace("puzzb.dropZone: ", mc, mc.dropZone);
////					mc.holding = null;
//					addChild(mc);
//					n++;
//				}	// endelse
////				trace("Coordinates over the puzzle base pieces  ", mc.x, mc.y);
////				trace(mc.dropzone);
//			}  // endfor
			
			


		} // end  function addPuzzleBPieces
		
		public function addDropPoints():void{
//			//add the possible drop zones for each draggable object
trace("in function addDropPoints");
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
			if (ev.currentTarget != stage) {  // are we dragging something?
trace("in not null if");
				var mc:MovieClip = MovieClip(ev.currentTarget);					// make the current object from the event into a movie clip
//trace("current object: ", currentObj);
trace("mc: ", mc);
			//stop event propagation
//			if (currentObj != null) {  // are we dragging something?
//				currentObj.stopDrag();  // if so drop it
				mc.stopDrag();  // if so drop it
//trace("currentObj.dropZone: ", currentObj, currentObj.dropzone);
trace("mc.dropZone: ", mc, mc.dropZone);
// trace("mc.inPlace: ", mc, mc.inPlace);
trace("mc.dropZone.x and y: ", mc, mc.dropZone.x, mc.dropZone.y);
			//decide whether or not to snap the object back to start or on top of dropzone
//			if(currentObj.hitTestPoint(currentObj.dropZone.x, currentObj.dropZone.y, true)) { // am I over my drop zone?
			if(mc.hitTestPoint(mc.dropZone.x, mc.dropZone.y, true)) { // am I over my drop zone?
trace("in hitTestPoint if");
//				if (currentObj.dropzone.holding != null) {
//					currentObj.dropzone.holding.x = currentObj.dropzone.holding.startPoint.x;
//					currentObj.dropzone.holding.y = currentObj.dropzone.holding.startPoint.y;
//					currentObj.dropzone.holding = null;
//					} // endif
				mc.x = mc.dropZone.x; //yes, well snap to the center of my drop zone
//trace("mc.x = mc.dropzone.x");
				mc.y = mc.dropZone.y;
//trace("mc.x and mc.y: ", mc, mc.x, mc.y);
				totalPieces = totalPieces +1
				inPlace[String(mc)] = true;
				trace("inPlace ", inPlace[String(mc)]);
				trace("string of mc: ", String(mc));
// trace("mc.inPlace: ", mc, mc.inPlace);
				
				isDone();
			} // endif
			else { // not over my drop zone, then go back to my origin
				mc.x = mc.startPoint.x;
				mc.y = mc.startPoint.y;
			} // endelse

//				currentObj = null
			} // endif
			
		} // end function endDrag
		
		public function isDone():void{
trace("in function isDone");
//trace("passed: ", passed);
//trace("passed.inPlace: ", passed, passed.inPlace);

			//decide if the game is complete and trigger the final animation
//			var tmp:String;
//			var symbolClass:Class;
//			var mc:MovieClip;
//			var finished:Boolean = false;
//			//trace("Starting to add the base pieces");
//			for (var i:int=1; i<=20; i++) { // check to see if all pieces are in place
//				tmp = whatPuzzle + i;
//				symbolClass=getDefinitionByName(tmp) as Class;
//				mc = new symbolClass();
////				trace("mc.inPlace: ", mc, mc.inPlace); 
//				if (totalPieces < 20) {
//				} else {
//					finished = false;
//				}
//			} // end for loop
//			trace("finished: ", finished)
//	trace("inPlace.length: ", inPlace.length)
				if (totalPieces < 20) {
				// all dropzones are occupied
				trace("Game Not Complete");
			} else {
				trace("Game Complete");
			}// endif
			
		} // end  function isDone
		
	}   // end  class puzzles
	
} // end  package