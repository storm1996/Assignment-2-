class Brick
{
  float brickX;
  float brickY;
  float brickWidth;
  float brickHeight;
  color brickColour;
  
  Brick(float x, float y, float Width, float Height, color Colour)
  {
    brickX = x;
    brickY = y;
    brickWidth = Width;
    brickHeight = Height;
    brickColour = Colour;
    
  }
  
void render()
{
  noStroke();
  fill(brickColour);
  rect(brickX, brickY, brickWidth, brickHeight);
}

void move(int X, int Y) 
{
  brickX=X-brickWidth/2;

}

void hitBall( Ball game)
{
   if( (game.ballX > mouseX -brickWidth/2) && (game.ballX < mouseX + brickWidth/2) && (game.ballY > heightScreen - 52) && (game.ballY < heightScreen - 39 ) )
   {
     game.speedY=game.speedY * -1;
   }
}

/*void vanish( Ball game)
{
   if( (game.ballX > brickX -paddleWidth/2) && (game.ballX < brickX + paddleWidth/2) && (game.ballY > heightScreen - 52) && (game.ballY < heightScreen - 39 ) )
   {
     game.speedY=game.speedY * -1;
   }
}*/

}
  
