class Position extends PVector { // "Vererbung/Inheritance"
  Position next;

  Position(float a, float b) {
    super(a, b);
  }
  //TYP: home, start, default
  // #TODO json file for all positions


  void loadJSON() {
    JSONObject values = loadJSONObject("data.json");
  }
}
