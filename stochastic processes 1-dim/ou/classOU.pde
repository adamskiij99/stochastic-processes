class OU {
  int x;
  int x0;
  float y;
  float y0;
  float hue = random(0, 360);
  float theta;
  float sigma;

  float dx = 0.05;
  float dy = 0.05;

  OU(int tempx, float tempy) {
    x = tempx;
    x0 = tempx;
    y = tempy;
    y0 = tempy;
    theta = 0.1;
    sigma = 0.4;
  }

  OU(int tempx, float tempy, boolean inv) {
    x = tempx;
    x0 = tempx;
    theta = 0.1;
    sigma = 0.4;
    if (inv == true) {
      y0 = height/2 + sigma * sqrt(1 / (2 * theta)) * randomGaussian()/dy;
    } else {
      y0 = tempy;
    }
    y = y0;
  }

  OU(int tempx, float tempy, float temptheta, float tempsigma) {
    x = tempx;
    x0 = tempx;
    y = tempy;
    y0 = tempy;
    theta = temptheta;
    sigma = tempsigma;
  }

  OU(int tempx, float tempy, float temptheta, float tempsigma, boolean inv) {
    x = tempx;
    x0 = tempx;
    y = tempy;
    y0 = tempy;
    theta = temptheta;
    sigma = tempsigma;
  }

  void display() {
    fill(hue);
    stroke(hue, 100, 100);
    ellipse(x, y, 1, 1);
  }
  
  void propagate() {
    x++;
    float ytrue = (y - height/2) * dy;
    ytrue = ytrue - theta * ytrue * dx + sigma * sqrt(dx) * randomGaussian();
    y = height/2 + ytrue/dy;
  }
}


//rough:

//x_n = n * deltax;

//when n > 0:

//y_n = y_0 * exp(- theta * x_n) + sigma * exp(- theta * x_n) * SUM(i=0..n-1)[ exp(theta * x_i) * Normal(0, deltax) ]

//    = y_(n-1) + y_0 * [ exp(- theta * x_n) - exp(- theta * x_(n-1)) ]
//                 + exp(- theta * x_n) ( SUM[i=0..n-2](...) + exp(theta * x_(n-1) * Normal(0, deltax)) );
