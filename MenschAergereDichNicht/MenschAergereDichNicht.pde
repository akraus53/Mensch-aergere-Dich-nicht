GameBoard board;
Die die;

void setup() {
  size(600, 600);
  // Generate new playing board with 4 players
  board = new GameBoard(4);
  die = new Die();
  
  
  

}

void draw() {
  board.show();
  //board.turn();
  die.show();

  for (Player p : board.players) { // For every player
    p.showPawns(); // show his pawns
  }
  
}

void mousePressed() { 
  if(objectAt(die.pos, new PVector(mouseX, mouseY), 100)) dieClicked = true;
  //if objectAt(Figur5, new PVector(blalbala), 40) move pawn there
}

boolean objectAt(PVector a, PVector b, int rad){
  return (PVector.dist(a,b) <= rad ? true : false);
}
