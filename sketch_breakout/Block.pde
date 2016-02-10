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
  
}
}
