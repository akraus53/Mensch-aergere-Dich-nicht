class Die {
  int number = 0;
  PVector pos = new PVector(width/2, height/2);
  boolean rolling;
  float dir = 0;
  int w = 50;
  PVector offset = new PVector(0, 0);
  int numThrown = 0;

  Die(float x, float y, int w) {
    this.pos = new PVector(x, y);
    this.w = w;
  }

  void roll() {
    this.number = round(random(4, 6));
    this.rolling = true;
  }

  void update() {
    if (this.rolling==true) {
      if (random(1) > 0.06) {
        this.roll();
        this.dir = random(0, TWO_PI);
        this.offset = new PVector(random(-30, 30), random(-30, 30));
      } else {
        this.rolling = false;
        this.dir = 0;
        this.offset = new PVector(0, 0);
        this.numThrown++;
        println(numThrown);
      }
      //if(numThrown == 3){
      //  numThrown = 0;
      //}
    }
  }

  void show() {
    pushMatrix();
    int zahl = this.number;
    int w = this.w;

    translate(this.pos.x, this.pos.y);
    translate(this.offset.x, this.offset.y);
    rotate(this.dir);

    rectMode(CENTER);
    stroke(0);
    strokeWeight(w/20);
    fill(255);
    rect(0, 0, w, w);

    strokeWeight(w/7);

    switch(zahl) {
    case 1:
      point(0, 0);
      break;
    case 2: 
      point(-w/4, -w/4);
      point(+w/4, +w/4);
      break;
    case 3:
      point(0, 0);
      point(-w/4, -w/4);
      point(+w/4, +w/4);
      break;
    case 4:
      point(-w/4, -w/4);
      point(-w/4, +w/4);
      point(+w/4, -w/4);
      point(+w/4, +w/4);
      break;
    case 5:
      point(0, 0);
      point(-w/4, -w/4);
      point(-w/4, +w/4);
      point(+w/4, -w/4);
      point(+w/4, +w/4);
      break;
    case 6:
      point(-w/4, 0);
      point(+w/4, 0);
      point(-w/4, -w/4);
      point(-w/4, +w/4);
      point(+w/4, -w/4);
      point(+w/4, +w/4);
      break;
    default: 
      textAlign(CENTER);
      fill(0);
      textSize(w*0.3);
      text("click", 0, -w/5);
      text("me!", 0, +w/3);
    }
    popMatrix();
  }
}
