class Die { // Einzahl von Dice ist Die
  int number = 0;
  PVector pos = new PVector(width/5-100, height/4);
   
  
  void roll() {
    this.number = floor(random(1, 6));
  }

  void show() {
  fill(0);
  textSize(30);
  text("Deine Zahl: " + this.number, this.pos.x, this.pos.y );//The position of the your dice is not the final Position!
  }
}