 class Pawn { //"Spielfigur"
 
  Position pos;
  float radius = 40;
  color c = color(100, 200, 0);
  boolean home = false; // State of pawn
  boolean start = true;
  //new!{
  boolean firstField = false;
  //new! }

  Pawn(color c, Position pos) {
    this.c = c;
    this.pos = pos;
  }

  void move(int value) { // move pawn by x fields
    advance(value);
  }

  void show() {
    fill(this.c);
    strokeWeight(4);
    stroke(0);
    ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
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
