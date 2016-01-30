class Ball 
{
  float ballX;
  float ballY;
  float diameter;
  color ballColour;
  float speedY= random(1,10);
  float speedX= random(-10, 10);
  
  //constructor
  Ball(float x, float y, int Width, color Colour)
  {
     ballX= x;
     ballY= y;
     diameter= Width;
     ballColour= Colour; 
  }
   //this draws the ball on the screen
void render()
{
  noStroke();
  fill(ballColour);
  ellipse(ballX, ballY, diameter, diameter);
}
  
  //this changes the ball to the speed;
void update() 
{
  ballX+=speedX;
  ballY+=speedY;
}

void move(int X, int Y) 
{
  ballX=X;
  ballY= Y;
  speedY= random(1,10);
  speedX= random(-10, 10);
}
  
  //this does the bounce
  boolean wallCollision() 
  {
    if (ballX>width-diameter/2) 
    {
        speedX= speedX * -1; 
    } 
    else if (ballX<diameter/2) 
    {
       speedX= speedX * -1;
    } 
    if (ballY>height-diameter/2) 
    { 
        speedY= speedY * -1;
        return true; 
    } 
    else if (ballY<diameter/2)
    {
        speedY=speedY * -1;
    }
    return false;
  }
}
