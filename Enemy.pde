class Enemy
{
  int x;
  int y;
  int deltaX = 1;
  int deltaY = 1;

  PImage enemy;

  Enemy(int x, int y) {
    this.x = x;
    this.y = y;

    enemy = loadImage("BakingPotato.png");
  }

  void update()
  {
    move();
    render();
  }

  void move()
  {
    x = x - deltaX;


    //if( x = gX)
    //{
    //  PLAYING = false;
    //  print("goal has been hit");

    //}
  }

  void render()
  {
    imageMode(CENTER);

    image(enemy, x, y);
  }

    boolean isHit() {
        if (mouseX >= x - enemy.width / 2 && mouseX <= x + enemy.width / 2 && mouseY >= y - enemy.height / 2 && mouseY <= y + enemy.height / 2) {
            return true;
        }
        return false;
    }
}
