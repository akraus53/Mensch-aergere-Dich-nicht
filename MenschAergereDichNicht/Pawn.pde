class Pawn { //"Spielfigur"

  Position pos;
  float radius = 40;
  color c = color(100, 200, 0);
  boolean home = false; // State of pawn
  boolean start = true;
  boolean defaultPos = false; //default Position (for later)
  boolean firstField = false;
  boolean bewegbar = true; //bewegbar (for later)
  int feld = 0; //shows on which field the pawn is

  Pawn(color c, Position pos) {
    this.c = c;
    this.pos = pos;
  }

  void move(int value) { // move pawn by x fields
    advance(value);
    this.feld += die.number; // increase "feld
    println("Player "+ currentPlayer + ".Pawn.Feld = " + feld +  "(Minus 5 bcs of the 6 with which you moved out" ); //prints field of pawn
  }


  void show() {
    fill(this.c);
    strokeWeight(4);
    stroke(0);
    ellipse(this.pos.x, this.pos.y, this.radius, this.radius);

    if (bewegbar == true) {
      //the stuff with colors is missing
    } else {
      //the stuff with colors is missing
    }
  }

  void advance(int value) { // recursive function: calls itself
    if (value > 0) {
      this.pos = this.pos.next;

      this.show();
      advance(value -1);
    } 
    // Else: done moving
  }
}
