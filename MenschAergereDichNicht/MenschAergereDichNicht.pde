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
  if(mouseAt(die.pos, new PVector(mouseX, mouseY), 100)) die.roll();
}

boolean mouseAt(PVector a, PVector b, int rad){
  return PVector.dist(a,b) <= rad ? true : false;
   
}