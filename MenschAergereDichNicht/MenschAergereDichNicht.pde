GameBoard board;
Die die;

String modus = "die";
boolean dieClicked;
int currentPlayer = 0;

boolean pawnChosen;
int chosenPawn;

void setup() {
  size(600, 600);
  frameRate(20);
  // Generate new playing board with 4 players
  board = new GameBoard();
  die = new Die(width/2, height/2, 50);
  board.generateNewPlayers(1);
}

void draw() {
  board.show();
  
  for (Player p : board.players) { // For every player
    p.showPawns(); // show his pawns
  }

  
  if (modus == "die") {
    pawnChosen = false;
    println("click die");
    // Wait for dice roll 
    die.show();
    if(board.players[currentPlayer].computer){
      delay(1000);
      dieClicked = true;
    }
    
    if (dieClicked) {
      die.roll();
      modus = "die rolling";
    }
  }
  
  if(modus == "die rolling"){
    die.update();
    die.show(); 
    if(die.rolling == false){
      modus = "pawn";
      
    }
  }  
  
  if (modus == "pawn") {
    println("click pawn");
    dieClicked = false;
    die.show();
    
    if(board.players[currentPlayer].computer){
      pawnChosen = true;
      chosenPawn = int(random(0,4));
    }

    if (pawnChosen) {
      println(currentPlayer);
      board.players[currentPlayer].move(board.players[currentPlayer].pawns[chosenPawn], die.number);
      pawnChosen = false;
      currentPlayer++;
      currentPlayer = currentPlayer % 4;
      modus = "die";
      die.number = 0;
    }
  }
}

void mousePressed() { 
  if (objectAt(die.pos, new PVector(mouseX, mouseY), int(die.w*0.7))) dieClicked = true;

  for (int i = 0; i< board.players[currentPlayer].pawns.length; i++) {
    if (objectAt(board.players[currentPlayer].pawns[i].pos, new PVector(mouseX, mouseY), 20)) {
      chosenPawn = i;
      pawnChosen = true;
    }
  }
}

boolean objectAt(PVector a, PVector b, int rad) {
  return (PVector.dist(a, b) <= rad ? true : false);
}
