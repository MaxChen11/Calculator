class Button {
  //Class variables
  int x, y, h, w;
  String s, v;
  boolean num, spec;
  boolean hov = false;
  int textSize = 24;
  char o;
  //Constructor for number buttons
  Button(int x, int y) {
    this.x = x;
    this.y = y;
    //println(numButtonValue);
  }

  //Constructor for operator buttons
  Button asNumber(String v, int w, int h) {
    num = true;
    this.w = w;
    this.h = h;
    this.v = v;
    return this;
  }

  //Constructor for special buttons
  Button asOperator(char o, int w, int h) {
    num = false;
    this.w = w;
    this.h = h;
    this.o = o;
    return this;
  }

  Button asSpecial(String s, int w, int h) {
    spec = true;
    this.w = w;
    this.h = h;
    this.s = s;
    return this;
  }

  //Draw the button on the canvas
  void display() {
    if (num) {
      fill(0);
      rect(x+3, y+3, w, h, 10);
      fill(#FF8000);
      rect(x, y, w, h, 10);
      fill(0);
      textSize(textSize);
      text(int(v), x+w/2-6, y+h/2+textSize/2);
    } else if (spec) {
      fill(0);
      rect(x+3, y+3, w, h, 10);
      fill(#9999FF);
      rect(x, y, h, w, 10);
      fill(0);
      textSize(24);
      text(s, x+w/2-12, y+h/2+textSize/2);
    } else {
      fill(0);
      rect(x+3, y+3, w, h, 10);
      fill(#3399FF);
      rect(x, y, h, w, 10);
      fill(0);
      textSize(24);
      text(o, x+w/2-8, y+h/2+8);
    }
  }

  //Handle mouse actions
  void click() {
    hov = mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h;
  }
}