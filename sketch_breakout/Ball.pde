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

  void move(int X, int Y) //move back to start position 
  {
    x = X;
    y = Y;
  }

  //this does the bounce
  boolean wallCollision() 
  {
    if (x>width-w/2) 
    {
      speedX= speedX * -1; //bounce if you hit the side walls
    } else if (x<w/2) 
    {
      speedX= speedX * -1;
    } else if (y>height-w/2)  //bounce if you hit the bottom  wall
    { 
      //speedY *= -1;
      return true;
    } else if (x<w/2)
    {
      speedY *= -1;
    } else if ((x > mouseX) && (x < mouseX + 100) && (y > height - (50 + (w/2)))) //hit paddle 
    {
      speedY *= -1;
      println("I hit the paddle!");
    }
    for (int i = gameObjects.size ()-1; i>=0; i--)
    {
      GameObject ball = gameObjects.get(i);

      if (ball instanceof Ball)
      {
        for (int j = gameObjects.size ()-1; j>=0; j--)
        {
          GameObject block = gameObjects.get(j);

          if (block instanceof Block)
          {
            if ((ball.x > block.x) && (ball.x < block.x+blockWidth) && ( ball.y < block.y +blockHeight + 30)) //if ball hits block 
            {
              gameObjects.remove(block);
              score = score +5; // block dissappears, change direction and increse score 
              speedY *= -1;
            }
          }//end if
        }//end for
      }//end if
    }//end for
    return false;
  }

  void draw(int X, int Y, float ballx, float bally, float speed)
  {
    x+=speedX; //ball moving 
    y+=speedY;
  }
}

