class Pawn { //"Spielfigur"

  Position pos;
  float radius = 40;
  color c = color(100, 200, 0);
  boolean home = false; // State of pawn
  boolean start = true;
  boolean defaultPos = false; //default Position (for later)
  boolean movable = true; 
  int field = 0; //shows on which field the pawn is
  
  Pawn(color c, Position pos) {
    this.c = c;
    this.pos = pos;
  }

  void move(int value) { // move pawn by x fields
    advance(value);
    this.field += value; // increase "field
    println("Player "+ currentPlayer + ".Pawn.field = " + field); //prints field of pawn
  }


  void show() {
    if (this.movable == true) {
      fill(this.c);
    } else {
      float red = (red(this.c) +240)/3;
      float green = (green(this.c) + 240)/3;
      float blue = (blue(this.c) + 240)/3;
      
      color grayishC = color(red,green,blue);
      fill(grayishC);
    }
    //fill(this.c);
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
