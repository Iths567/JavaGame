class Goal
{
  int gX;
  int gY;
  PImage goal;

  Goal() {
    goal = loadImage("steak (Custom).png");
  }

  void render() {
    gX = 50;
    gY = 200;
    imageMode(CENTER);

    image(goal, gX, gY);
  }

  boolean hit (Enemy enemy)
  {
    if (enemy != null) {
      return abs(this.gX-enemy.x) < goal.width/1.62 && abs(this.gY - enemy.y) < goal.height/1.62;
    } else
    return false;
  }
}
