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
int diameter= 20;
float startX=random(widthScreen);
float startY=heightScreen/2;
color ballColour= color(255, 0, 0);
Ball gameBall= new Ball(startX, startY, diameter, ballColour);

//Paddle 
int paddleWidth = 100;
int paddleHeight = 10;
int paddleX = widthScreen/2;
int paddleY = heightScreen - 50; 
color paddleColour = color(215, 14, 195);
Brick paddle= new Brick(paddleX, paddleY, paddleWidth, paddleHeight, paddleColour);

//Bricks
int brickWidth = 150;
int brickHeight = 30;
int brickX = widthScreen/2;
int brickY = 50; 
color brickColour = color(215, 14, 195);
Brick brick= new Brick(brickX, brickY, brickWidth, brickHeight, brickColour);

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
  paddle.move(mouseX, paddleY);  
  paddle.hitBall(gameBall);  
}

void drawBrick()
{
  brick.render();  
  brick.vanish(gameBall);
}

void drawLose() 
{
  fill(0);
  textSize(40);
  text("You lose!", width/2-100, height/2);
}


