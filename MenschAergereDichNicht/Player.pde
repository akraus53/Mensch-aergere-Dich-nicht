class Player {
  String name;
  color c;
  int number;
  int score; 
  boolean computer; // true: PC/AI, false: real Player
  Pawn[] pawns;

  Player(boolean comp, int num, String name, color c) {
    this.name = name;
    this.computer = comp;
    this.number = num;
    this.score = 0;
    this.c = c;

    this.pawns = new Pawn[4]; //<>//

    for (int i = 0; i< 4; i++) {
      this.pawns[i] = new Pawn(c, board.starts[num][i]);
    }
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
