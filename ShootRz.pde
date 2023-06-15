ArrayList<Enemy> enemies;
Goal goal;
Player explo;
boolean pressed;
boolean PLAYING = true;
PImage gameOver;
String points;
int numPoints;
boolean WINNER;
boolean endlessMode = false;

void setup()
{
  size(800, 500);

  //enemy1 = new Enemy();
  //player = new Player();
  goal = new Goal();
  explo = new Player(10, 100);
  explo.loadImg();
  enemies = new ArrayList<>();
  //for (Enemy enemy : enemies) {
  //  enemies.add(enemy);
  //}
  //enemies = null;
  spawnEnemy();

  cursor(CROSS);

  explo.loadImg();
  gameOver = loadImage("gameover.jpg");

  points = "points: " + str(numPoints);
}

void mouseClicked() {
  for (int i =0; i < enemies.size(); i++) {
    if (enemies.get(i).isHit()) {
      enemies.remove(i);
      numPoints = numPoints + 10;
      points = "points: " + str(numPoints);
    }
  }
}



void draw()
{



  if (PLAYING) {

    background(236, 236, 236);
    goal.render();

    for (Enemy anEnemy : enemies) {
      if (anEnemy != null) {
        anEnemy.update();
        //if (anEnemy.isHit == true) {
        //enemies = (Enemy[]) splice(enemies, anEnemy, 1);
        //}
      }
      if (goal.hit(anEnemy)) {
        PLAYING = false;
      }
    }

    fill(0);
    textSize(40);
    text(points, 460, 20, 280, 320);

    if (pressed)
    {
      explo.setPosition(mouseX, mouseY);
      explo.render();
      pressed = false;
    }
    spawnEnemy();

    if (numPoints >= 500 && endlessMode == false)
    {
      WINNER = true;
      PLAYING = false;
    }
  }
  if (WINNER == true && PLAYING == false)
  {
    String winner = "congratulations, you win! \n enldess mode? Press E";
    text(winner, width/2, height/2, 280, 320);
    if (keyPressed && key == 'e')
    {
      endlessMode = true;
      PLAYING = true;
      WINNER = false;
    }
  }

  if (WINNER == false && PLAYING == false)
  {
    background(0);
    image(gameOver, width/2, height/2);
  }
}


void spawnEnemy()
{
  if (enemies.size() < 10) {
    enemies.add(new Enemy(800, (int)random(500)));
  }
}
