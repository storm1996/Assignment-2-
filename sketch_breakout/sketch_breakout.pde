void setup() 
{
  size(widthScreen, heightScreen);
  background(0); 
}

//Made a variable for screen width for help with ball 
int widthScreen= 500;
int heightScreen= 500;
int score=0;
int lives=3;


//Ball
Ball gameBall= new Ball(random(widthScreen), heightScreen/2, 20, color(255, 0, 0));

//Paddle 
Brick paddle= new Brick(widthScreen/2, heightScreen - 50, 100, 10, color(215, 14, 195));

//Bricks
Brick brick= new Brick(widthScreen/2, 50, 150, 30, color(215, 14, 195));

void draw() 
{
  if (lives>0) 
  {
    background(255); 
    drawBall();
    drawPaddle();
    drawBrick();
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

void drawPaddle()
{
  paddle.render();
  paddle.move(mouseX, heightScreen - 50);  
  paddle.hitBall(gameBall);  
}

void drawBrick()
{
  brick.render();  
  //brick.vanish(gameBall);
}

void drawLose() 
{
  fill(0);
  textSize(40);
  text("You lose!", width/2-100, height/2);
}


