GameBoard board;
Die die;
int modus = 0;
boolean dieClicked;
int currentPlayer;

void setup() {
  size(600, 600);
  // Generate new playing board with 4 players
  board = new GameBoard(4);
  die = new Die();
}

void draw() {
  board.show();
  //board.turn();

  for (Player p : board.players) { // For every player
    p.showPawns(); // show his pawns
  }

  if (modus == 0) {
    // Wait for dice roll 
    die.show();
    if (dieClicked) {
      die.roll();
      modus = 1;
    }
  }
  if (modus == 1) {
    die.show();
    // Wait for choosing pawn 

    modus = 2;
  }
  if (modus == 2) {
    //Pawn move

    board.players[currentPlayer].move();
  }
}

void mousePressed() { 
  if (objectAt(die.pos, new PVector(mouseX, mouseY), 100)) dieClicked = true;
  for (Pawn p : board.players[currentPlayer].pawns) {
    if (objectAt(p.pos, new PVector(), 40)) {
      chosenPawn = p;
    }
  }
}

boolean objectAt(PVector a, PVector b, int rad) {
  return (PVector.dist(a, b) <= rad ? true : false);
}
