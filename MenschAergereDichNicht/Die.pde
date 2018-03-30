class Die { // Einzahl von Dice ist Die
  int number = 0;
  PVector pos = new PVector(20, 150);

  void roll() {
    this.number = floor(random(1, 6));
  }

  void show() {
    fill(0);
    textSize(30);
    text("Deine Zahl: " + this.number, this.pos.x, this.pos.y );//The position of the your die is not the final Position!
  }
}
