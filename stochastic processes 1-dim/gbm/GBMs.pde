GBM[] processes = new GBM[3000];
int count = 0;

// GBM solves the SDE
// dX_t = mu X_t dt + sigma X_t dW_t.

void setup() {
  size(1800, 1000);
  background(0);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  stroke(0);
  fill(0, 1.5);
  rect(0, 0, width, height);  // for the fading effect of background.
  // in this version of processing alpha is ignored in background(), so rect() must be used.

  for (int i = 0; i < count; i++) {
    processes[i].display();
    processes[i].propagate();
  }
}

void mousePressed() {
  processes[count] = new GBM(mouseX, mouseY);
  count++;
  if (count >= 3000) {
    count -= 3000;
  }
}

void mouseDragged() {
  processes[count] = new GBM(mouseX, mouseY);
  count++;
  if (count >= 3000) {
    count -= 3000;
  }
}

void keyPressed() {
  if (key == '1') {
    nops(10);
  }
  if (key == '2') {
    nops(20);
  }
  if (key == '3') {
    nops(30);
  }
  if (key == '4') {
    nops(40);
  }
  if (key == '5') {
    nops(50);
  }
  if (key == '6') {
    nops(60);
  }
  if (key == '7') {
    nops(70);
  }
  if (key == '8') {
    nops(80);
  }
  if (key == '9') {
    nops(90);
  }
  if (key == '0') {
    nops(100);
  }
  if (key == 'a') {
    for (int j = 0; j < height; j = j + 100) {
      processes[count] = new GBM(0, j);
      count++;
      if (count >= 3000) {
        count -= 3000;
      }
    }
  }
  if (key == 's') {
    for (int j = -width ; j < width; j = j + 100) {
      processes[count] = new GBM(j, height/2);
      count++;
      if (count >= 3000) {
        count -= 3000;
      }
    }
  } else {
    processes[count] = new GBM(0, height/2);
    count++;
    if (count >= 3000) {
      count -= 3000;
    }
  }
}

// Number Of Processes
void nops(int n) {
  for (int j = 0; j < n; j++) {
    processes[count] = new GBM(0, height/2);
    count++;
    if (count >= 3000) {
      count -= 3000;
    }
  }
}
