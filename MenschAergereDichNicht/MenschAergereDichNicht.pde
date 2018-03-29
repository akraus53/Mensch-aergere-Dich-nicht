Dice d = new Dice();
GameBoard board;

void setup() {
  size(600, 600);
  // Generate new playing board with 4 players
  board = new GameBoard(4);
}

void draw() {
  board.show();
  //board.turn();


  for (Player p : board.players) { // For every player
    p.move(); // move him
  }
  fill(0);
  textSize(30);
  text("Deine Zahl:"+number, width/5-100, height/4);//The position of the your dice is not the final Position!
}
void mousePressed() {
  d.roll();
}
