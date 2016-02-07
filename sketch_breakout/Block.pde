class Block extends GameObject
{
  color block_Colour;
  Block()
  {
    super(widthScreen/2, heightScreen-50, 50, 50);
  }

  Block(int block_x, int block_y, int block_width, int block_height, color colour)
  {
    super(widthScreen/2, heightScreen-50, 50, 50); 
    this.block_Colour = colour; 
    this.x = block_x;
    this.y = block_y;
    this.w = block_width;
    this.h = block_height;
  }

  void update(int X, int Y, Ball game)
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


}