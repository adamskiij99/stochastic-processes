class GBM {
  int x;
  int x0;
  float y;
  float y0;
  float hue = random(0, 360);
  float mu;
  float sigma;

  float dx = 0.001;
  float dy = 0.001;

  GBM(int tempx, float tempy) {
    x = tempx;
    x0 = tempx;
    y = tempy;
    y0 = tempy;
    mu = 0.1;
    sigma = 0.2;
  }
  void display() {
    fill(hue);
    stroke(hue, 100, 100);
    ellipse(x, y, 1, 1);
  }
  
  void propagate() {
    x++;
    float ytrue = (height + 1 - y) * dy;
    ytrue = ytrue + mu * ytrue * dx + sigma * ytrue * sqrt(dx) * randomGaussian();
    y = height + 1 - ytrue/dy;
  }
}
