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
  brickY=Y-brickHeight/2;
}


}
  
