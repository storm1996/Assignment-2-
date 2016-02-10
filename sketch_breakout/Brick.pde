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

  }
}
