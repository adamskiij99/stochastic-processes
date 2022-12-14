BM[] brownians = new BM[3000];
int count = 0;

void setup() {
  size(1800, 1000);
  background(0);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  stroke(0);
  fill(0, 1.5);
  rect(0, 0, width, height);

  for (int i = 0; i < count; i++) {
    brownians[i].display();
    brownians[i].propagate();
  }
}

void mousePressed() {
  brownians[count] = new BM(mouseX, mouseY);
  count++;
  if (count >= 3000) {
    count -= 3000;
  }
}

void mouseDragged() {
  brownians[count] = new BM(mouseX, mouseY);
  count++;
  if (count >= 3000) {
    count -= 3000;
  }
}

void keyPressed() {
  if (key == '1') {
    nobs(10);
  }
  if (key == '2') {
    nobs(20);
  }
  if (key == '3') {
    nobs(30);
  }
  if (key == '4') {
    nobs(40);
  }
  if (key == '5') {
    nobs(50);
  }
  if (key == '6') {
    nobs(60);
  }
  if (key == '7') {
    nobs(70);
  }
  if (key == '8') {
    nobs(80);
  }
  if (key == '9') {
    nobs(90);
  }
  if (key == '0') {
    nobs(100);
  } else {
    brownians[count] = new BM(0, height/2);
    count++;
    if (count >= 3000) {
      count -= 3000;
    }
  }
}

// Number Of Brownians
void nobs(int n) {
  for (int j = 0; j < n; j++) {
    brownians[count] = new BM(0, height/2);
    count++;
    if (count >= 3000) {
      count -= 3000;
    }
  }
}
