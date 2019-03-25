class GameBoard { //<>//
  Position[][] starts = new Position[4][4];
  Position[][] homes = new Position[4][4];
  Position[] defaults = new Position[40];
  Position[][] firstFields = new Position[4][1];
  Position[] positions;

  Player[] players;
  //                red                    green             yellow            blue  
  color[] colors = {color(205, 68, 1), color(110, 165, 1), color(254, 230, 0), color(0, 120, 225)};
  String[] colorsText = {"red", "green", "yellow", "blue"};

  // Game board turns after very turn, this is the rotation (0, 1, 2 or 3)
  int direction = 0;

  // Image
  PImage texture = loadImage("GameBoard.jpg");

  // Constructor, gets number of real players (rest = AI) 
  GameBoard() {
    loadDefaults();

    this.starts= load("start");
    this.homes = load("home");
    this.firstFields = load("firstFields");
    this.players = new Player[4];
  }

  void show() { // Draw Image with correct orientation 
    pushMatrix();
    translate(width/2, height/2);
    rotate(HALF_PI * this.direction);
    imageMode(CENTER);
    image(texture, 0, 0, width, height);
    popMatrix();

    fill(0);
    textSize(30);
    textAlign(LEFT, CENTER);
    text("Player: " + board.colorsText[currentPlayer], 390, 150);
  }

  void generateNewPlayers(int num) { // Player Setup

    for (int i = 0; i < 4; i++) { // Four times:
      if (num > 0) { // if there are still non-PC: make now non PC player
        this.players[i] = new Player(false, i, "Player " + (i+1), this.colors[i]);
        num--;  // Decrease number of non-PC-players
      } else {
        this.players[i] = new Player(true, i, "Computer", this.colors[i]); // Fill up with AI
      }
    }
  }
  void turn() { // Rotate board to next Player
    this.direction++;
    this.direction = this.direction % 4;
  }
  Position[][] load(String dir) {
    Position[][] result = new Position[4][4];

    for (int i = 0; i<4; i++) {
      //This is the new version of the game with the new "positions.json" file, the old version with the old "position_old.json" file is also saved
      JSONArray objA = loadJSONObject("positions.json").getJSONObject(colorsText[i]).getJSONArray(dir);

      for (int j = 0; j < objA.size(); j++) {

        JSONObject obj = objA.getJSONObject(j);
        result[i][j] = new Position(obj.getInt("x"), obj.getInt("y"));

        if (dir == "start") {
          result[i][j].next = this.defaults[i*10];
        }
      }
    }
    return result;
  }

  void loadDefaults() {
    //This is the new version of the game with the new "positions.json file", the old version with the old "position_old.json" file is also saved
    JSONArray defs = loadJSONObject("positions.json").getJSONArray("default");

    for (int i = 0; i < defs.size(); i++) {
      this.defaults[i] = new Position(defs.getJSONObject(i).getInt("x"), defs.getJSONObject(i).getInt("y"));
    }
    for (int i = 0; i < defaults.length; i++) {
      defaults[i].next = defaults[(i+1)%defaults.length];
    }
  }

  boolean objectAt(PVector a, PVector b, int rad) {
    return (PVector.dist(a, b) <= rad ? true : false);
  }
}
