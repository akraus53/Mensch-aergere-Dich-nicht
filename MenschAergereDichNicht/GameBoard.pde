class GameBoard {
  Player[] players;
  //                red                    green             yellow            blue  
  color[] colors = {color(205,68,1), color(110,165,1), color(254,230,0), color(0,120,225)};
  
  // Game board turns after very turn, this is the rotation (0, 1, 2 or 3)
  int direction = 0;
  
  // Image
  PImage texture = loadImage("GameBoard.jpg");

  // Constructor, gets number of real players (rest = AI) 
  GameBoard(int numofPlayer) {
    this.players = generateNewPlayers(numofPlayer);
    // other 
  }

  void show() { // Draw Image with correct orientation 
    pushMatrix();
    translate(width/2, height/2);
    rotate(HALF_PI * this.direction);
    imageMode(CENTER);
    image(texture, 0, 0, width, height);
    popMatrix();
  }

  Player[] generateNewPlayers(int num) { // Player Setup
    Player[] result = new Player[4];
    
    for (int i = 0; i< 4; i++) { // Four times:
      if (num > 0) { // if there are still non-PC: make now non PC player
        result[i] = new Player(false, i, "Spieler " + (i+1), this.colors[i]);
        num--;  // Decrease number of non-PC-players
      } else {
        result[i] = new Player(true, i, "Computer", this.colors[i]); // Fill up with AI
      }
    }
    return result;
  }

  void turn() { // Rotate board to next Player
    this.direction++;
    this.direction = this.direction % 4;
  }
}
