class Brick extends GameObject
{
  color paddle_Colour;
  Brick()
  {
    super(widthScreen/2, heightScreen-50, 50, 50);  
  }
  
  Brick(int paddle_x, int paddle_y, int paddle_width, int paddle_height, color colour)
  {
    super(widthScreen/2, heightScreen-50, 50, 50); 
    this.paddle_Colour = colour; 
    this.x = paddle_x;
    this.y = paddle_y;
    this.w = paddle_width;
    this.h = paddle_height;
  }
  
  void update(int X, int Y, Ball game)
  { 
    x = X-w/2;
    if( (game.ballX > mouseX -w/2) && (game.ballX < mouseX + w/2) && (game.ballY > heightScreen - 52) && (game.ballY < heightScreen - 39 ) )
   {
     game.speedY=game.speedY * -1;
   }
  }
void render()
{
  noStroke();
  fill(paddle_Colour);
  rect(x, y, w, h);
}

}
  
