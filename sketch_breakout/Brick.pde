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

  void update(int X, int Y, float ballx, float bally, float speedY)
  { 
    x = X-w/2;
    if ( (ballx > mouseX -w/2) && (ballx < mouseX + w/2) && (bally > heightScreen - 52) && (bally < heightScreen - 39 ) )
    {
      speedY= speedY * -1;
    }
  }
  void render()
  {
    noStroke();
    fill(paddle_Colour);
    rect(x, y, w, h);
  }
  
  void move(int W, int H)
{
}

int wallCollision()
{
  int y;
  return  y = 3;
}
}
