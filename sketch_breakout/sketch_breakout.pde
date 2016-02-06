void setup() 
{
  size(widthScreen, heightScreen);

  Brick paddle= new Brick(widthScreen/2, heightScreen - 50, 100, 10, color(215, 14, 195));
  gameObjects.add(paddle);
//  Brick brick= new Brick(widthScreen/2, 50, 150, 30, color(215, 14, 195));
//  gameObjects.add(brick);
}

//Made a variable for screen width for help with ball 
int widthScreen= 500;
int heightScreen= 500;
int score=0;
int lives=3;
Ball gameBall= new Ball(widthScreen/2, heightScreen/2, 20, color(255, 0, 0));
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

void draw() 
{
  background(255);
  
  if (lives>0) 
  {
    drawBall(); 
    for(int i = gameObjects.size() - 1 ; i >= 0   ;i --)
    {
      GameObject go = gameObjects.get(i);
      go.render();
      go.update(mouseX, heightScreen - 50, gameBall);
   
    }
  } 
  else 
  {
    drawLose();
  }
  
 
}

//draw the ball
void drawBall() 
{ 
  gameBall.update();
  gameBall.render();
  if (gameBall.wallCollision()) 
  {
    lives--;
    gameBall.move(width/2, height/2);
  }
}

void drawLose() 
{
  fill(0);
  textSize(40);
  text("You lose!", width/2-100, height/2);
}


