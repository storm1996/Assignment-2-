class Brick
{
  int brickX;
  int brickY;
  int brickWidth;
  int brickHeight;
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
void update()
{
  
}


}
  
