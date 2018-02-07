//Global Variables
String ls = "";
String rs = "";
float result = 0;  // answer
char o;
boolean firstNum, eq;  // Number before operator, after Equal is hit

//Declare button
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[7];
Button[] specButtons = new Button[2];

void setup() {
  size(290, 520);
  background(#003366);
  numButtons();    // Buttons
  opButtons();
  specButtons();
  firstNum = true;    // Operator hasn't been pressed
}

void draw() {
  background(#003366);
  updateDisplay();
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].click();
  }
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].click();
  }
  for (int i = 0; i < specButtons.length; i++) {
    specButtons[i].display();
    specButtons[i].click();
  }
}

void numButtons() {
  numButtons[0] = new Button(10, 443).asNumber("0", 130, 60);
  numButtons[1] = new Button(150, 373).asNumber("1", 60, 60);
  numButtons[2] = new Button(80, 373).asNumber("2", 60, 60);
  numButtons[3] = new Button(10, 373).asNumber("3", 60, 60);
  numButtons[4] = new Button(150, 303).asNumber("4", 60, 60);
  numButtons[5] = new Button(80, 303).asNumber("5", 60, 60);
  numButtons[6] = new Button(10, 303).asNumber("6", 60, 60);
  numButtons[7] = new Button(150, 233).asNumber("7", 60, 60);
  numButtons[8] = new Button(80, 233).asNumber("8", 60, 60);
  numButtons[9] = new Button(10, 233).asNumber("9", 60, 60);
}

void opButtons() {
  opButtons[0] = new Button(150, 163).asOperator('C', 60, 60);
  opButtons[1] = new Button(220, 443).asOperator('=', 60, 60);
  opButtons[2] = new Button(220, 373).asOperator('+', 60, 60);
  opButtons[3] = new Button(220, 303).asOperator('-', 60, 60);
  opButtons[4] = new Button(220, 229).asOperator('*', 60, 60);
  opButtons[5] = new Button(220, 163).asOperator('/', 60, 60);
  opButtons[6] = new Button(150, 443).asOperator('.', 60, 60);
}

void specButtons() {
  specButtons[0] = new Button(10, 93).asSpecial("π", 60, 60);
  specButtons[1] = new Button(80, 93).asSpecial("x²", 60, 60);
}

void mouseReleased() {
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hov && firstNum) {
      ls += numButtons[i].v;
    } else if (numButtons[i].hov && !firstNum) {
      rs += numButtons[i].v;
    }
  }

  for (int i = 0; i < specButtons.length; i++) {
    if (specButtons[i].hov && specButtons[i].s == "π") {
      if (firstNum) {
        ls ="3.14";
      } else {
        rs = "3.14";
      }
    } else if (specButtons[i].hov && specButtons[i].s == "x²") {
      if (firstNum) {
//        ls = ls*ls;
      }
    }
  }

  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hov && opButtons[i].o == '=') {
      eq = true;
      performCalc();
    } else if (opButtons[i].hov && opButtons[i].o == 'C') {
      performClear();
    } else if (opButtons[i].hov && opButtons[i].o == '+') {
      firstNum = false;
      o = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '-') {
      firstNum = false;
      o = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '*') {
      firstNum = false;
      o = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '/') {
      firstNum = false;
      o = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '.') {
      if (firstNum) {
        ls += opButtons[i].o;
      } else {
        rs += opButtons[i].o;
      }
    }
  }
}



void updateDisplay() {
  fill(200);
  rect(10, 10, 270, 73, 10);
  fill(0);
  rect(12, 165, 130, 60, 10);
  fill(#9999FF);
  rect(10, 163, 130, 60, 10);
  fill(0);
  textSize(12);
  text("Num 1: " + ls, 15, 178);
  text("Operator: " + o, 15, 190);
  text("Num 2: " + rs, 15, 202);
  text("Ans: " + result, 15, 214);
  textSize(24);
  if (firstNum) {
    text(ls, 20, 37);
  } else if (!firstNum) {
    text(rs, 20, 37);
  } else if (eq) {
    text((float)result, 70, 45);
  }
}

void performClear() {
  result = 0.0;
  firstNum = true;
  eq = false;
  ls = "";  //left
  rs = ""; //right
}

void performCalc() {
  switch(o) {
  case '+':
    result = float(ls)+float(rs);
    ls = str((float)result);
    firstNum = true;
    break;
  case '-':
    result = float(ls)-float(rs);
    ls = str((float)result);
    firstNum = true;
    break;
  case '*':
    result = float(ls)*float(rs);
    ls = str((float)result);
    firstNum = true;
    break;
  case '/':
    result = float(ls)/float(rs);
    ls = str((float)result);
    firstNum = true;
    break;
  }

//  ls = "";
//  rs = "";
//  o = ' ';
}