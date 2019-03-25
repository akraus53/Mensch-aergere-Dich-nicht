class Position extends PVector { // "Vererbung/Inheritance"
  Position next;

  Position(float a, float b) {
    super(a, b);
  }
  //TYP: home, start, default

  void loadJSON() {
    JSONObject values = loadJSONObject("data.json");
  }
}
