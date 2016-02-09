class Ball extends GameObject
{
  color ballColour;
  float speedX;
  
   Ball()
  {
    super(widthScreen/2, heightScreen-50, 50, 50, 0);
  }

  //constructor
  Ball(float x, float y, int Width, int Height, color Colour, float speedY, float speedX)
  {
    super(widthScreen/2, heightScreen-50, 50, 50, 0); 
    this.ballColour = Colour; 
    this.x = x;
    this.y = y;
    this.w = Width;
    this.h = Height;
    this.speedY = speedY;
    this.speedX = speedX;
    
  }
  //this draws the ball on the screen
  void render()
  {
    noStroke();
    fill(ballColour);
    ellipse(x, y, w, h);
  }

  //this changes the ball to the speed;
  void update(int X, int Y, float ballx, float bally, float speedY) 
  {
    x+=speedX;
    y+=speedY;
  }

  void move(int X, int Y) 
  {
    x=X;
    y= Y;
    speedX= random(-10, 10);
    speedY= speedY*-1;
  }

  //this does the bounce
  int wallCollision() 
  {
    int var = 1;
    if (x>width-w/2) 
    {
      speedX= speedX * -1;
    } else if (x<w/2) 
    {
      speedX= speedX * -1;
    } 
    if (y>height-w/2) 
    { 
      speedY= speedY * -1;
      return var = 1;
    } else if (y<w/2)
    {
      speedY=speedY * -1;
    }
    return var = 0;
  }
}
