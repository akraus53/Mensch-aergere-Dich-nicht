PImage bild;
String clr = "";
float x;
float y;

void setup() {
  size(600, 600);
  bild = loadImage("GameBoard.jpg");
  ellipseMode(CENTER);
  bild.loadPixels();
  x= 300;
  y = 300;
}

void draw() {
  bild.resize(width, height);
  image(bild, 0, 0);

  ellipse(x, y, 40, 40);
}

void keyPressed() {
  if(keyCode == 32){
  color c = bild.get(floor(x), floor(y));

  String clr2 = "whait";

  if (c == color(225, 68, 1)) {
    clr2 = "red";
  } else if (c == color(110, 165, 1)) {
    clr2 = "green";
  } else if (c == color(254, 230, 0)) {
    clr2 = "yellow";
  } else if (c == color(0, 120, 225)) {
    clr2 = "blue";
  } else clr2 = "white";

  if (clr2 != clr) {
    clr = clr2;
    //println(clr);
  }
  // println(red(c) + " " + green(c) + " " + blue(c));
  println("{\"x\": " + x + ", \"y\": " + y + "},");
  }
  
  if(keyCode == RIGHT){
    x++;
  }
  if(keyCode == LEFT){
    x--;
  }
  if(keyCode == UP){
    y--;
  }
  if(keyCode == DOWN){
    y++;
  }
  
}

void mouseClicked(){
  x = mouseX;
  y = mouseY;
}
