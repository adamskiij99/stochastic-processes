class BM {
  float x;
  float y;
  float hue = random(0, 360);

  BM(float tempx, float tempy) {
    x = tempx;
    y = tempy;
  }

  void display() {
    fill(hue, 100, 100, 100);
    stroke(hue, 100, 100, 100);
    ellipse(x, y, 3, 3);
  }

  void propagate_display() {
    float xp = x;
    float yp = y;
    x += 3 * randomGaussian();
    y += 3 * randomGaussian();
    fill(hue, 100, 100, 50);
    stroke(hue, 100, 100, 50);
    strokeWeight(3);
    line(xp, yp, x, y);
  }
}
