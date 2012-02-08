package  {
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
		public var whatPuzzle:String = "";
		public var totalPieces:Number = 0;
		public var startChild:Number = 0;
		public var endChild:Number = 0;
		public var currentObj:MovieClip = null;
		public var basex:Array = new Array(349.30, 413.30, 496.30, 576.30, 641.95, 338.80, 415.30, 494.95, 573.95, 653.30, 348.95, 413.95, 493.30, 575.30, 641.95, 338.35, 415.30, 492.95, 575.30, 655.30);
		public var basey:Array = new Array(158.35, 173.35, 162.35, 175.35, 163.35, 234.35, 233.35, 234.00, 237.35, 237.35, 308.35, 308.35, 309.00, 311.35, 311.35, 370.00, 381.35, 373.00, 385.35, 372.35);
//		public var inPlace:Array = new Array;
		public var welcome_mc:MovieClip = new beginTitle();
		public var beauFinal_mc:MovieClip = new beauFinal();
		public var samFinal_mc:MovieClip = new samFinal();
		public var gameOver_mc:MovieClip = new gameComplete();
		
		//create the global var for tracking the dragging object
		
		public function puzzle() {
trace("in Constructor: ");
			// constructor code
//			setup();
			addBasePieces();
			this.addChild(welcome_mc); // instantiate the welcome screen
			welcome_mc.visible = true;	// turn it on
			welcome_mc.x = 499;
			welcome_mc.y = 270;
			welcome_mc.addEventListener(MouseEvent.CLICK, begin, true); // listen for a click on the welcome screen
			stage.addEventListener(Event.MOUSE_LEAVE, endDrag); // set up the cursor leaving the stage event listener
			startChild = numChildren; // with all the base elements in place, how many children exist on the stage?
		
		}  // end  function puzzle
		
		public function playAgain(ev):void{
trace("in playAgain: ");
			if (whatPuzzle == "puzza") {
				beauFinal_mc.parent.removeChild(beauFinal_mc); // get rid of the solve screen
			} else {
				samFinal_mc.parent.removeChild(samFinal_mc); // get rid of the solve screen
			}
//			samFinal_mc.visible = false;	// turn it off
//			beauFinal_mc.visible = false;	// turn it off
//			gameOver_mc.visible = false;
			gameOver_mc.parent.removeChild(gameOver_mc); // get rid of the game over screen
			whatPuzzle = "";
			endChild = numChildren;
			var nextThing:MovieClip;
			while (startChild <= endChild) {
			nextThing = MovieClip(this.getChildAt(this.numChildren - 1));
				this.removeChildAt(endChild-1);
				endChild = numChildren;
			} // end while loop
//			this.removeChildAt(endChild-1);
//			var topThing:MovieClip = MovieClip(this.getChildAt(this.numChildren - 1));
//			welcome_mc.visible = true;

			this.addChild(welcome_mc); // instantiate the welcome screen
			welcome_mc.visible = true;	// turn it on
			welcome_mc.x = 499;
			welcome_mc.y = 270;
			welcome_mc.addEventListener(MouseEvent.CLICK, begin, true); // listen for a click on the welcome screen


//			swapChildren(welcome_mc,topThing);
trace("in playAgain: 7");
			gameOver_mc.removeEventListener(MouseEvent.CLICK, playAgain);
trace("in playAgain: 8");
//			welcome_mc.addEventListener(MouseEvent.CLICK, begin, true);
trace("in playAgain: 9");
		}
		
//		public function setup():void{
//			addBasePieces();
//		}
		
		public function begin(ev):void{
trace("in begin: ");
			var mc:MovieClip = MovieClip(ev.target);
			totalPieces = 0;
			welcome_mc.removeEventListener(MouseEvent.CLICK, begin);
			this.removeChild(welcome_mc); // get rid of the welcome screen
			if (mc.name == "puzzbeau") {
				whatPuzzle = "puzza";
				beginA();
			} else {
				whatPuzzle = "puzzb";
				beginB();
			} // endelse
		} // end  function begin
		
		public function beginA():void{
trace("in beginA: ");
			//add the pieces to the stage
			var tmp:String;
			var symbolClass:Class;
			var mc:MovieClip;
			for (var i:int=1; i<=20;) { // add the puzzle A pieces
				tmp="puzza"+i;
				symbolClass=getDefinitionByName(tmp) as Class;
				mc=new symbolClass();
				mc.x = Math.round(Math.random() * 820 + 70);		//50.00000000000000000 - 850.0000000000000000
				mc.y = Math.round(Math.random() * 620 + 70);		//50.00000000000000000 - 650.0000000000000000
				if (mc.hitTestObject(welcome_mc)) { // don't let the piece stay on top of the puzzle
				}  else {  // add the piece to the stage
					//add the event listeners to the objects so they can be dragged
					mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
					mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
					// setup the start point so we can return the piece to this point
					mc.startPoint = new Point(mc.x, mc.y);
					// set up the drop zone coordinates
					mc.dropZone = new Point(basex[i-1], basey[i-1]);
					mc.rotation = Math.round(Math.random() * 30 - 20);
					mc.buttonMode = true;
					addChild(mc);
					i++;
				}// endelse
			}  // endfor
		} // end  function beginA

		public function addBasePieces():void{
			//add the base pieces to the stage
trace("in function addBasePieces");
			
			var tmp:String;
			var symbolClass:Class;
			var mc:MovieClip;
			for (var i:int=1; i<=20; i++) { // add the puzzle base pieces so they will be lowest on the stage
				tmp = "base"+i;
				symbolClass=getDefinitionByName(tmp) as Class;
				mc = new symbolClass();
				mc.x = basex[i - 1]; // this is the x position on stage to hold the piece
				mc.y = basey[i - 1]; // this is the y position on stage to hold the piece
				mc.holding = null;	// set the holding property to null so it isn't holding anything
				addChild(mc);	//add the base piece to the stage
			}  // endfor
		} // end  function addBasePieces
			
		public function beginB():void{
trace("in function beginB");
			welcome_mc.visible = false;
			welcome_mc.removeEventListener(MouseEvent.CLICK, begin);
			//add the pieces to the stage
			var tmp:String;
			var symbolClass:Class;
			var mc:MovieClip;
			for (var i:int=1; i<=20;) { // add the puzzle A pieces
				tmp="puzzb"+i;
				symbolClass=getDefinitionByName(tmp) as Class;
				mc=new symbolClass();
				mc.x = Math.round(Math.random() * 820 + 70);		//50.00000000000000000 - 850.0000000000000000
				mc.y = Math.round(Math.random() * 620 + 70);		//50.00000000000000000 - 650.0000000000000000
				if (mc.hitTestObject(welcome_mc)) { // don't let the piece stay on top of the puzzle
				}  else {  // add the piece to the stage
					//add the event listeners to the objects so they can be dragged
					mc.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);
					mc.addEventListener(MouseEvent.MOUSE_UP, endDrag);
					// setup the start point so we can return the piece to this point
					mc.startPoint = new Point(mc.x, mc.y);
					// set up the drop zone coordinates
					mc.dropZone = new Point(basex[i-1], basey[i-1]);
					mc.rotation = Math.round(Math.random() * 30 - 20);
					mc.buttonMode = true;
					addChild(mc);
					i++;
				}// endelse
			}  // endfor
		} // end  function addPuzzleBPieces
		
		public function beginDrag(ev:MouseEvent):void{
trace("in function beginDrag");
			//start dragging
			var mc:MovieClip = MovieClip(ev.currentTarget);
			mc.rotated = mc.rotation;
			mc.rotation = 0;
			currentObj = mc;
			currentObj.startDrag(true);
			//do some swapping of the z-indices to keep the current object on top of everything
			var topThing:MovieClip = MovieClip(this.getChildAt(this.numChildren - 1));
			swapChildren(currentObj,topThing);
		} // end  function beginDrag
		
		public function endDrag(ev:Event):void{
trace("in function endDrag");
			//stop dragging
			if (ev.currentTarget != stage) {  // are we dragging something?
				var mc:MovieClip = MovieClip(ev.currentTarget);	// make the current object from the event into a movie clip
				//stop event propagation
				mc.stopDrag();  // if so drop it
				if(mc.hitTestPoint(mc.dropZone.x, mc.dropZone.y, true)) { // am I over my drop zone?
					mc.x = mc.dropZone.x; //yes, well snap to the center of my drop zone
					mc.y = mc.dropZone.y;
					totalPieces = totalPieces +1
					trace(totalPieces);
//					inPlace[String(mc)] = true;
					isDone();
			} else { // not over my drop zone, then go back to my origin
				if (mc.hitTestObject(welcome_mc)) { // if I am over the puzzle go back to origin
					mc.x = mc.startPoint.x;
					mc.y = mc.startPoint.y;
					mc.rotation = mc.rotated;
				} else { // if not, let it stay here
					mc.startPoint.x = mc.x;
					mc.startPoint.y = mc.y;
					mc.rotation = mc.rotated;
				} // endelse
			} // endelse
			} // endif
		} // end function endDrag
		
		public function isDone():void{
trace("in function isDone");
			if (totalPieces < 20) {
				trace("Game Not Complete");
			} else { // all pieces are in place
				trace("Game Complete");
				this.addChild(gameOver_mc); // instantiate the game over screen
				gameOver_mc.x = 499;
				gameOver_mc.y = 451.45;
				gameOver_mc.visible = true;
				gameOver_mc.addEventListener(MouseEvent.CLICK, playAgain, true);
				if(whatPuzzle == "puzza") {
					addChild(beauFinal_mc); // instantiate the solve screen
					beauFinal_mc.x = 499;
					beauFinal_mc.y = 270;
					beauFinal_mc.visible = true;	// turn it on
					beauFinal_mc.play();
				   } else {
					addChild(samFinal_mc); // instantiate the solve screen
					samFinal_mc.x = 499;
					samFinal_mc.y = 270;
					samFinal_mc.visible = true;	// turn it on
					samFinal_mc.play();
				   }	// endelse
			}// endelse
		} // end  function isDone
	}   // end  class puzzle
} // end  package
