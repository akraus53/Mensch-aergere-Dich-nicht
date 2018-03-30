class Player {
  String name;
  color c;
  int number;
  int score; 
  boolean computer; // true: PC/AI, false: real Player
  Pawn[] pawns = new Pawn[4];

  Player(boolean comp, int num, String name, color c) {
    this.name = name;
    this.computer = comp;
    this.number = num;
    this.score = 0;
    this.c = c;

    // Just for testing
    int xoff = floor(random(width));
    int yoff = floor(random(height));

    this.pawns[0] = new Pawn(c, new Position(xoff + 0, yoff + 0)); // #TODO Fill with values 
    this.pawns[1] = new Pawn(c, new Position(xoff + 0, yoff + 50)); 
    this.pawns[2] = new Pawn(c, new Position(xoff + 50, yoff + 0)); 
    this.pawns[3] = new Pawn(c, new Position(xoff + 50, yoff + 50));
  }

  void move(Pawn pawn, int value) {
    // Pick pawn
    pawn.move(value);
    // if 6 --> repeat
  }

  int calcScore() { // Distance moved by all pawns on field
    // # TODO implement
    return 0;
  }

  void showPawns() {
    for (Pawn pawn : this.pawns) {
      pawn.show();
    }
  }
}
