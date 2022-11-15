int N = 80;
BM[] brownians = new BM[N];
int count = 0;
int frame_count = 0;
float lambda = 1;
float tau = 60 * exponential_quantile(random(1), lambda);

void setup() {
  //size(1800, 1000);
  fullScreen();
  background(0);
  colorMode(HSB, 360, 100, 100, 100);
  nobs(N);
}

void draw() {
  // Cross at centre for reference
  stroke(200);
  fill(200);
  line(width/2, height/2 - 10, width/2, height/2 + 10);
  line(width/2 - 10, height/2, width/2 + 10, height/2);
  
  stroke(0);
  fill(0, 27);
  rect(0, 0, width, height);

  for (int i = 0; i < count; i++) {
    brownians[i].display();
    brownians[i].propagate_display();
  }
  
  // After an exponential amount of time, delete the furthest straying BM and respawn it at another random one 
  frame_count++;
  if (frame_count > tau) {
    frame_count = 0;
    tau = 60 * exponential_quantile(random(1), lambda);
    respawn(brownians);
  }
}

// Number Of Brownians to be spawned
void nobs(int n) {
  for (int j = 0; j < n; j++) {
    brownians[count] = new BM(width/2, height/2);
    count++;
    if (count >= 3000) {
      count -= 3000;
    }
  }
}

// Squared distance to origin
// (Square rooting is not needed here and would just slow the program down)
float d_2(float x, float y) {
  return sq(x - width/2) + sq(y - height/2);
}

// Respawn the furthest BM at a (uniformly) random other BM
void respawn(BM[] b) {
  // Find furthest bee
  int ind = 0;
  float d_2_ind = d_2(b[0].x, b[0].y);
  for (int i = 1; i < N; i++) {
    if (d_2(b[i].x, b[i].y) > d_2_ind) {
      ind = i;
      d_2_ind = d_2(b[i].x, b[i].y);
    }
  int potential_index = int(random(N));
  while (potential_index == ind) {
    potential_index = int(random(N));
  }
  b[ind].x = b[potential_index].x;
  b[ind].y = b[potential_index].y;
  }
}

// Inverse CDF of Exp(lambda) for sampling
float exponential_quantile(float p, float lambda) {
  return -log(1 - p) / lambda;
}

// For testing
void mousePressed() {
  respawn(brownians);
}
