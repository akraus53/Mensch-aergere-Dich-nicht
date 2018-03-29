class Player{
  String name;
  int number;
  int score; 
  boolean computer; // true: PC/AI, false: real Player
  Pawn[] pawns = new Pawn[4];
  
  Player(boolean comp, int num, String name){
    this.name = name;
    this.computer = comp;
    this.number = num;
    this.score = 0;
  }
  
  void move(){
    // Roll die --> value
    // Pick pawn
    // pawn.move(value);
    // if 6 --> repeat
    
  }
  
  int calcScore(){ // Distance moved by all pawns on field
    
    return 0;
  }
  
}