class Player { //<>//
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
    this.pawns = new Pawn[4];

    for (int i = 0; i< 4; i++) {
      this.pawns[i] = new Pawn(c, board.starts[num][i]);
    }
  }


  void move(Pawn pawn, int value) {
    if (!pawn.start) {
      pawn.move(value);

      if (value == 6) {
        currentPlayer--;
      }
    } else if (pawn.start) {
      if (value == 6) {
        if (pawnOnFirstField()) {
          println("You can't move that pawn! Choose a different one!"); // Message
          currentPlayer--; // Set the Player back
          die.number = 1; // Roll a 6
          modus = "pawn"; // Set the mode to "Choose Pawn"
        } else {

          pawn.move(1);
          pawn.start = false;
          currentPlayer--;
        }
      }
    }
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

  void checkPawns() {
    for (Pawn pawn1 : this.pawns) { //for all pawns
      int newField = pawn1.feld + die.number;

      for (Pawn pawn2 : this.pawns) { // check all of the other pawns
        if (!(pawn1 == pawn2)) { // if it's not the same pawn
          if (pawn2.feld == newField) {
            pawn1.beweglich = false;
          }
        }
      }
    }
  }

  boolean allPawnsOut() {
    for (Pawn pawn : this.pawns) {
      if (pawn.start == true) return false;
      if (pawn.home == true) return false;
    }
    return true;
  }

  boolean pawnOnFirstField() {
    for (Pawn pawn : this.pawns) {
      if (pawn.firstField == true) return true;
    }
    return false;
  }
}
