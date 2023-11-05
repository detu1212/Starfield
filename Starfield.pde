ArrayList<Firework> fireworks;

void setup() {
  size(800, 600);
  fireworks = new ArrayList<Firework>();
  frameRate(60);
}

void draw() {
  background(0);

  for (int i = fireworks.size() - 1; i >= 0; i--) {
    Firework firework = fireworks.get(i);
    firework.update();
    firework.show();
    if (firework.done()) {
      fireworks.remove(i);
    }
  }
}

void mousePressed() {
  fireworks.add(new Firework(mouseX, mouseY));
}

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    position = l.copy();
    acceleration = new PVector(0, 0.2);
    velocity = new PVector(random(-2, 2), random(-5, 0));
    lifespan = 255.0;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }

  void display() {
    stroke(255, lifespan);
    fill(255, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }

  boolean isDead() {
    return lifespan < 0.0;
  }
}

class Firework {
  ArrayList<Particle> particles;
  PVector position;
  PVector velocity;

  Firework(float x, float y) {
    particles = new ArrayList<Particle>();
    position = new PVector(x, y);
    velocity = new PVector(0, random(-12, -8));

    int particleCount = int(random(100, 200));
    for (int i = 0; i < particleCount; i++) {
      particles.add(new Particle(position));
    }
  }

  void applyForce(PVector force) {
    for (Particle p : particles) {
      p.applyForce(force);
    }
  }

  void update() {
    velocity.add(new PVector(0, 0.2));
    position.add(velocity);
    for (Particle p : particles) {
      p.applyForce(new PVector(0, 0.2));
      p.update();
    }
  }

  void show() {
    for (Particle p : particles) {
      p.display();
    }
  }

  boolean done() {
    return (velocity.y >= 0 && particles.isEmpty());
  }
}
