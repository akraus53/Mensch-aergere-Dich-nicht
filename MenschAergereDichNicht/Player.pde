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
    this.pawns[0] = new Pawn(c, new Position(100, 100)); // #TODO Fill with values 
    this.pawns[1] = new Pawn(c, new Position(100, 200)); 
    this.pawns[2] = new Pawn(c, new Position(200, 100)); 
    this.pawns[3] = new Pawn(c, new Position(200, 200));
  }

  void move() {
    // Roll die --> value
    // Pick pawn
    // pawn.move(value);
    // if 6 --> repeat
  }

  int calcScore() { // Distance moved by all pawns on field
    // # TODO implement
    return 0;
  }

  void showPawns() {
    for (Pawn pwn : this.pawns) {
      pwn.show();
    }
  }
}