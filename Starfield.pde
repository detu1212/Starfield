Particle[] parts = new Particle[1000];

void setup() {
  size(600, 600);
  for (int i = 0; i < parts.length; i++) {
    parts[i] = new Particle();
  }
  parts[0] = new OddBallParticle();
}

void draw() {
  background(0);
  for (int i = 0; i < parts.length; i++) {
    parts[i].show();
    parts[i].move();
  }
}

void mousePressed() {
  for (int i = 0; i < parts.length; i++) {
    parts[i] = new Particle();
  }
  parts[0] = new OddBallParticle();
}

class Particle {
  double myX, myY, Speed, Angle;
  int myColor;

  Particle() {
    myX = myY = Math.random() * 600;
    Angle = Math.random() * 2 * Math.PI;
    Speed = Math.random() * 3;
    myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
  }

  void move() {
    myX += Math.cos(Angle) * Speed;
    myY += Math.sin(Angle) * Speed;
  }

  void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, 3.5, 3.5);
  }
}

class OddBallParticle extends Particle {
  OddBallParticle() {
    myX = myY = 150;
    Angle = Math.random() * 2 * Math.PI;
    Speed = Math.random() * 1;
    myColor = color(250, 250, 250);
  }

  void move() {
    myX += Math.cos(Angle) * Speed;
    myY += Math.sin(Angle) * Speed;
  }

  void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, 10, 10);
  }
}
