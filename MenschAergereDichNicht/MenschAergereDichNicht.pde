GameBoard board;

void setup(){
  size(600,600);
  // Generate new playing board with 4 players
  board = new GameBoard(4);
  
}

void draw(){
  board.show();
  //board.turn();
  
  
  for(Player p : board.players){ // For every player
    p.move(); // move him
    
    
  }
}