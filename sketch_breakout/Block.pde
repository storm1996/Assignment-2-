class Block extends GameObject
{
  color block_Colour;
  Block()
  {
    super(widthScreen/2, heightScreen-50, 50, 50, 0);
  }

  Block(float block_x, float block_y, float block_width, float block_height, color colour)
  {
    super(widthScreen/2, heightScreen-50, 50, 50, 0); 
    this.block_Colour = colour; 
    this.x = block_x;
    this.y = block_y;
    this.w = block_width;
    this.h = block_height;
  }

  void update(int X, int Y, float ballx, float bally,  float speedY)
  {
  }

  void render()
  {
    if (x+w>width)
    {
      x=width-w-30;
    } 

    noStroke();
    fill(block_Colour);
    rect(x, y, w, h);
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
//      for (int i = gameObjects.size ()-1; i>=0; i--)
//    {
//      GameObject ball = gameObjects.get(i);
//
//      if (ball instanceof Ball)
//      {
//        for (int j = gameObjects.size ()-1; j>=0; j--)
//        {
//          GameObject block = gameObjects.get(j);
//
//          if (block instanceof Block)
//          {
//            if (ball.x > block.x && ball.x<block.x + block.w && ball.y + 40> block.y && ball  .y + 40 < block.y + block.h)
//            {
//              gameObjects.remove(i);
//            }
//          }//end if
//        }//end for
//      }//end if
//    }//end for
}
}
