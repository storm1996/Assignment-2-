class Ball extends GameObject
{
  color ballColour;
  float speedX;
  float speedY;

  Ball()
  {
    super(widthScreen/2, heightScreen-50, 50, 50, 0);
  }

  //constructor
  Ball(float x, float y, int Width, int Height, color Colour, float speedX, float speedY)
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
    
//    for (int i = gameObjects.size ()-1; i>=0; i--)
//    {
//      GameObject ball = gameObjects.get(i);
//
//      if (ball instanceof Ball)
//      {
//        for (int j = gameObjects.size ()-1; j>=0; j--)
//        {
//          GameObject brick = gameObjects.get(j);
//
//          if (brick instanceof Brick)
//          {
//            //if ((ballx > mouseX -w) && (ballx < mouseX + w) && (bally > heightScreen - 52) && (bally < heightScreen - 39 ))
//            if ((ballx > mouseX) && (ballx < mouseX + w) && (bally > heightScreen - 52) && (bally < heightScreen - 39 ))
//            {
//              speedY= -(speedY);
//              //gameObjects.remove(brick);
//            }
//          }//end if
//        }//end for
//      }//end if
//    }//end for

  }

  void move(int X, int Y) 
  {
    x=X;
    y= Y;
    speedX= random(-10, 10);
    speedY= speedY;
  }

  //this does the bounce
  boolean wallCollision() 
  {
    if (x>width-w/2) 
    {
      speedX= speedX * -1;
    } else if (x<w/2) 
    {
      speedX= speedX * -1;
    } 
    if (y>height-w/2) 
    { 
      this.speedY= this.speedY * -1;
      return true;
    } else if (y<w/2)
    {
      speedY=speedY * -1;
    }
    return false;
  }

  void draw(int X, int Y, float ballx, float bally, float speed)
  {
    x+=speedX;
    y+=speedY;
  }
}

