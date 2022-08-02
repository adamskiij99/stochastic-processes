class BM {
  int x;
  float y;
  float hue = random(0, 360);

  BM(int tempx, float tempy) {
    x = tempx;
    y = tempy;
  }

  void display() {
    fill(hue);
    stroke(hue, 100, 100);
    ellipse(x, y, 1, 1);
  }

  void propagate() {
    x++;
    y += randomGaussian();
  }
}
