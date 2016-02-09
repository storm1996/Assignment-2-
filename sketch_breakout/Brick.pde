class Brick extends GameObject
{
  color paddle_Colour;
  Brick()
  {
    super(widthScreen/2, heightScreen-50, 50, 50, 0);
  }

  Brick(int paddle_x, int paddle_y, int paddle_width, int paddle_height, color colour)
  {
    super(widthScreen/2, heightScreen-50, 50, 50, 0); 
    this.paddle_Colour = colour; 
    this.x = paddle_x;
    this.y = paddle_y;
    this.w = paddle_width;
    this.h = paddle_height;
  }

  void update(int X, int Y, float ballx, float bally, float speedX, float speedY)
  { 
    //x = X-w/2;
    if ( (ballx > mouseX -w) && (ballx < mouseX + w) && (bally > heightScreen - 52) && (bally < heightScreen - 39 ) )
    {
      speedY= speedY * -1;
    }
  }
  void render()
  {
    noStroke();
    fill(paddle_Colour);
    rect(mouseX, y, w, h);
  }

  void move(int W, int H)
  {
  }

  boolean wallCollision()
  {
    return true;
  }
  void draw(int X, int Y, float ballx, float bally, float speedY)
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
//            if ((ballx > mouseX -w) && (ballx < mouseX + w) && (bally > heightScreen - 52) && (bally < heightScreen - 39 ))
//            {
//             // speedY= speedY * -1;
//              gameObjects.remove(brick);
//            }
//          }//end if
//        }//end for
//      }//end if
//    }//end for
//  }
}
}
